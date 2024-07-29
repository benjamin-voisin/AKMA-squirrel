include Basic.
set PostQuantumSound = true.
set timeout = 12.

(* Needs to be a hash *)
abstract fAKID: index * message -> message. (* AKID derivation. *)
abstract fKAKMA: index * message -> message. (*AKMA derivation *)
(*
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*)
(* Needs to be a hash or something *)
*)
hash fKAF.
abstract kausf: index *message -> message.
abstract key_creation: message -> message.

abstract ok : message.
abstract ko : message.

mutable db_akid(SUPI:index) : message = zero.
mutable db_kakma(SUPI:index) : message = zero.

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

channel Ccore.
channel Caf.
channel Cue.


process UE_initial (SUPI: index) =
    in(Cue, registration);
	(* Check that the core sending this message is the "good" one (meaning using the same SUPI) *)
	if (dec(registration, key_shared(SUPI)) <> fail) then (
		let K_AKMA = snd(dec(registration, key_shared(SUPI)))
		in let AKID = fAKID(SUPI, K_AKMA) in
		db_akid(SUPI) := AKID;
		db_kakma(SUPI) := K_AKMA
		(* Maybe output smth to show that it worked ? *)
	).


process Core_initial (SUPI: index) = 
    new r; new ausf_rand;
	let k_ausf= kausf(SUPI,ausf_rand) in
	let K_AKMA=fKAKMA(SUPI, k_ausf) in
    out(Cue, enc(<k_ausf,K_AKMA>, r, key_shared(SUPI))).
    
 
process AF (AF_ID: index) =
    new r;
    in(Caf, msg);

    if (af_id_message_to_index(snd(msg)) = AF_ID) then (
      let msg = enc(<fst(msg), af_id_index_to_message(AF_ID)>, r, AF_key(AF_ID)) in
      out(Ccore, msg);
      in(Caf, x);
      if (dec(x, AF_key(AF_ID)) = ko) then (
          af_seven_ok: out(Cue, ok)
      ) else (
          let K_AF = dec(x, AF_key(AF_ID)) in
          af_seven_ko: out(Cue, ko)
      )
    ).

 
process Core_KAF (AF_ID: index) =
    (* K_AF key-generation *)
    in(Ccore, x); new r;
    let msg = dec(x, AF_key(AF_ID)) in
    let AKID = fst(msg) in
    if (msg <> fail && AF_ID = af_id_message_to_index(snd(msg))) then (
		try find SUPI such that (db_akid(SUPI) = AKID) in
			out(Caf, enc(fKAF(db_kakma(SUPI), af_id_index_to_message(AF_ID)),r, AF_key2(AF_ID) ))
	else (
		out(Caf, enc(ko, r, AF_key2(AF_ID)))
		)
	).

process UE_KAF (SUPI:index, af_id:index) =
    ue_one: out(Caf, <db_akid(SUPI), af_id_index_to_message(af_id)>); 
    ue_seven :in(Cue, x).
 

process desync_attaquer(j:index) =
  out(Cue, ko).

system [akma_desync] (
        !_j desync_attaquer (j) |
	!_supi (
		phone_init: UE_initial (supi) |
		ntw_init: Core_initial (supi) |
		!_af_id (phone_kaf: UE_KAF (supi, af_id))
	) |
	!_af_id (
		ntw_kaf: Core_KAF (af_id) |
		af: AF (af_id)
	)
     ).

lemma [akma_desync] reachability_init :
	forall (supi:index),
		happens(phone_init(supi)) =>
		((dec(input@phone_init(supi),key_shared(supi)) <> fail)
		=>
		(exists (ntw_supi:index),
			ntw_init(ntw_supi) < phone_init(supi) &&
			output@ntw_init(ntw_supi) = input@phone_init(supi))).
Proof.
    intro supi Hap Hdec.
	intctxt Hdec.
	intro [H1 H2].
	exists supi.
	split ; auto.
Qed.

lemma [akma_desync] kaf_reachability:
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
  intctxt Hdec. intro [Hb Hi].
  by exists ntw_af_id. 
Qed.

lemma [akma_desync] if_ok_then_ok:
  forall (af_id,supi:index), (
    happens(af(af_id)) &&
    happens(ntw_kaf(af_id, supi)) &&
    input@(af(af_id)) = output@ntw_kaf(af_id, supi) &&
    cond@ntw_kaf(af_id, supi) =>
    happens(af_seven_ok(af_id))
  ).
Proof.
  intro af_id supi [Hap_af [Hap_ntw [Heq [Hdb [Hdec Haf_id]]]]].
  intctxt Hdec. intro [Hbef Heq2].
  have Hout: output@ntw_kaf(af_id, supi) <> ko by admit.
  admit.
Qed.

lemma [akma_desync] desynchronisation:
  forall (supi, af_id: index), ((
    happens(ue_seven(supi, af_id)) &&
    happens(af(af_id)) &&
    happens(ntw_kaf(af_id, supi)) &&
    dec(input@af(af_id), AF_key2(af_id)) <> fail &&
    cond@ntw_kaf(af_id, supi) &&
    output@ntw_kaf(af_id, supi) = input@af(af_id) &&
    exists(j:index), (
     (* Maybe something "smarter", by specifing timing of attaquer to deduce input = output ? *)
      happens(desync_attaquer(j)) &&
      input@ue_seven(supi, af_id) = output@desync_attaquer(j)
    )) =>
    happens(af_seven_ok(af_id)) &&
    input@ue_seven(supi, af_id) = ko
  )
.
Proof.
  intro supi af_id [Happ_ue Happ_af Happ_ntw Hdec [Hdb Hdec2 Hntw_af] Hmatch [j [Hatt_app Hatt_match]]].
  split.
  + apply if_ok_then_ok af_id supi. repeat split => //.
  + simpl. rewrite Hatt_match. auto.
Qed.
