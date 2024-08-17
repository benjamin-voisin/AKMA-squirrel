include Basic.
set PostQuantumSound = true.
set timeout = 12.



abstract fAKID: index * message * index -> message. (* AKID derivation. *)
abstract fKAKMA: index * message -> message. (*AKMA derivation *)
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*)
abstract kausf: index *message -> message.
abstract key_creation: message -> message.

(* Function to make AKID uniq for each af_id *)
(* hash AKID_with_AF_ID. *)

abstract ok : message.
abstract ko : message.

mutable db_akid(SUPI:index, af_id: index) : message = zero.
mutable db_kakma(SUPI:index) : message = zero.
mutable db_kausf(SUPI: index) : message = zero.

abstract af_id_index_to_message : index -> message.
abstract af_id_message_to_index : message -> index.
axiom [any] af_id_conv (x:message) :
	af_id_index_to_message(af_id_message_to_index(x)) = x.

(* Key shared btw UE and Core for symmetric encryption *)
name key_shared: index  -> message.
senc enc,dec.

name core_key : message.
name AF_key : index -> message.
name AF_key2 : index -> message.

(* For communications btw UE and AF, we probably need asymetric encryption *)
(*
aenc ue_af_enc, ue_af_dec, pk.
name UE_key : index -> message.
name AF_ue_key : index -> message.
*)


game CPA = {
  
  rnd inde : message;
  rnd m : message; 
  oracle enc x = {
  rnd r : message;
  return enc(diff(x,m), r,AF_key2(af_id_message_to_index(inde)))
  }
}.



channel Ccore.
channel Caf.
channel Cue.


(* add af_id index *)
process UE_initial (SUPI, af_id: index) =
    in(Cue, registration);
	(* Check that the core sending this message is the "good" one (meaning using the same SUPI) *)
	if (dec(registration, key_shared(SUPI)) <> fail) then (
		let K_AKMA = snd(dec(registration, key_shared(SUPI))) in let AKID = fAKID(SUPI, K_AKMA, af_id) in
		db_akid(SUPI, af_id) := AKID;
		db_kakma(SUPI) := K_AKMA
		(* Maybe output smth to show that it worked ? *)
	).


(* add af_id index *)
process Core_initial (SUPI: index) = 
    new r; new ausf_rand;
	let k_ausf= kausf(SUPI,ausf_rand) in
	let K_AKMA=fKAKMA(SUPI, k_ausf) in
     db_kausf(SUPI) := k_ausf;
    out(Cue, enc(<k_ausf,K_AKMA>, r, key_shared(SUPI))).
    
 
process AF (AF_ID: index) =
    new r;
    in(Caf, msg);
    if (af_id_message_to_index(fst(snd(msg))) = AF_ID) then (
      let msg = enc(<fst(msg), af_id_index_to_message(AF_ID)>, r, AF_key(AF_ID)) in
      out(Ccore, msg);
      in(Caf, x);
      new fake_response;
      if (fst(fst(dec(x, AF_key2(AF_ID)))) = ok) then (
          af_seven_ko: out(Cue, diff(snd(dec(x, AF_key2(AF_ID))), fake_response))
      ) else (
          af_seven_ko: out(Cue, diff(snd(dec(x, AF_key2(AF_ID))), fake_response))
      )
    ).

 
process Core_KAF (AF_ID: index) =
    (* K_AF key-generation *)
    in(Ccore, x); new r; new r';
    let msg = dec(x, AF_key(AF_ID)) in
    let AKID = fst(msg) in
    if (msg <> fail && AF_ID = af_id_message_to_index(snd(msg))) then (
        try find SUPI such that (db_akid(SUPI)(AF_ID) = AKID) in
            let kaf = fKAF(db_kakma(SUPI), af_id_index_to_message(AF_ID)) in
            out(Caf, enc(<<ok,kaf>, enc(kaf, r', db_kausf(SUPI))>, r, AF_key2(AF_ID)))
	else (
            new r2; out(Caf, enc(<<ko, ko>, enc(ko, r', r2)>, r, AF_key2(AF_ID)))
        )
    )
    else (
        new r2; out(Caf, enc(<ko, enc(ko, r', r2)>, r, AF_key2(AF_ID)))
    ).


 (* On peut envoyer le SUPI à l'AF et avoir un key_shared(supi, af_id) *)
process UE_KAF (SUPI:index, af_id:index) =
     new r;
    ue_one: out(Caf, <db_akid(SUPI)(af_id), af_id_index_to_message(af_id)>);
    ue_seven :in(Cue, x).
 

system  (
    !_supi (
        ntw_init: Core_initial (supi)
    ) |
    !_supi !_af_id (
        phone_init: UE_initial (supi, af_id) |
        phone_kaf: UE_KAF (supi, af_id)
    ) |
    !_af_id (
        af: AF (af_id) |
        ntw_kaf: Core_KAF (af_id)
    )
).

global lemma _ (t:timestamp[const]) : [happens(t)] -> equiv(frame@t).
Proof.
  intro H.
  crypto CPA( af_id) => //.
Qed.

lemma [akma] reachability_init :
    forall (supi, af_id:index),
        happens(phone_init(supi, af_id)) =>
	((dec(input@phone_init(supi, af_id),key_shared(supi)) <> fail)
	=>
	(exists (ntw_supi, ntw_af_id:index),
	    ntw_init(ntw_supi) < phone_init(supi, ntw_af_id) &&
	    output@ntw_init(ntw_supi) = input@phone_init(supi, ntw_af_id))).
Proof.
    intro supi af_id Hap Hdec.
	intctxt Hdec.
	intro [H1 H2].
        by exists supi, af_id.
Qed.

lemma [akma] kaf_reachability:
	forall (ntw_af_id:index, supi:index), (
		happens(ntw_kaf(ntw_af_id, supi)) && (cond@ntw_kaf(ntw_af_id, supi)
) => (
			exists (af_id: index), (
				af(af_id) < ntw_kaf(ntw_af_id, supi) &&
				output@af(af_id) = input@ntw_kaf(ntw_af_id, supi)
			)
		)
	).
Proof.
  intro ntw_af_id supi [Hap [Hdb [Hdec Haf_id]]].
  intctxt Hdec; intro *; exists ntw_af_id => //.
Qed.




