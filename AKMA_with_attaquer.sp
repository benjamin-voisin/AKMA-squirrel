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

(* 
channel Ccore.
channel Caf.
channel cag.
channel Cue.
channel Cue1.
*)

channel Cregistr.
channel Cone.
channel Ctwo.
channel Cthree.
channel Cfour.
channel Cfive.
channel Csix.
channel Cseven.

channel Cdummy.

process UE_initial (SUPI: index) =
    in(Cregistr, registration);
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
    out(Cregistr, enc(<k_ausf,K_AKMA>, r, key_shared(SUPI))).

 
process AF (AF_ID: index) =
    new r;
    in(Cone, msg);

    if (af_id_message_to_index(snd(msg)) = AF_ID) then (
      let msg2 = enc(<fst(msg), af_id_index_to_message(AF_ID)>, r, AF_key(AF_ID)) in
      af_two: out(Ctwo, msg2);
      in(Csix, x);
      if (dec(x, AF_key2(AF_ID)) = ko) then (
          af_seven_ko: out(Cseven, ko)
      ) else (
          let K_AF = dec(x, AF_key2(AF_ID)) in
          af_seven_ok: out(Cseven, ok)
      )
   )
   else (
     null
)
    .

 
process Core_KAF (AF_ID: index) =
    (* K_AF key-generation *)
    in(Ctwo, x); new r;
    let msg = dec(x, AF_key(AF_ID)) in
    let AKID = fst(msg) in
    if (msg <> fail && AF_ID = af_id_message_to_index(snd(msg))) then (
	try find SUPI such that (db_akid(SUPI) = AKID) in (
 out(Csix, enc(fKAF(db_kakma(SUPI), af_id_index_to_message(AF_ID)),r, AF_key2(AF_ID) ))
 )
	else (
		out(Csix, enc(ko, r, AF_key2(AF_ID)))
		)
	)
     else (
       out(Cdummy, ko)
).

process UE_KAF (SUPI:index, af_id:index) =
    ue_one: out(Cone, <db_akid(SUPI), af_id_index_to_message(af_id)>); 
    ue_seven :in(Cseven, x).
 

process desync_attaquer(j:index) =
  out(Cseven, ko).


system [akma_desync] (
         (* !_j desync_attaquer (j) | *) 
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
  exists ntw_af_id. split => //.
     admit. admit.
Qed.


lemma [akma_desync] executable_AF (t:timestamp) (af_id,supi:index) :
  happens(t) => exec@t => af_seven_ok(af_id)<=t => exec@ntw_kaf(af_id, supi) && 
cond@ntw_kaf(af_id, supi).
 Proof.
intro Hh Hexe Hle.
  executable t => // Hblah'. expandall.
    
  by use Hblah' with af_seven_ok(af_id).
Qed.

(*
lemma [akma_desync] reachability_ok:
  forall (af_id,supi:index), (
happens(af_seven_ok(af_id))
    happens(af(af_id)) &&
    happens(ntw_kaf(af_id, supi)) &&
    input@(af(af_id)) = output@ntw_kaf(af_id, supi) &&
    cond@ntw_kaf(af_id, supi) =>
    
  ).
*)
 
lemma [akma_desync] if_core_then_af:
  forall(af_id:index), (
    happens(af(af_id)) &&
    (* cond@af(af_id) && *)
    happens(af_two(af_id)) &&
    af_id_message_to_index(snd(input@af(af_id))) = af_id &&
    dec(input@(af_seven_ok(af_id)), AF_key2(af_id)) <> ko =>
    happens(af_seven_ok(af_id))
).
Proof.
  intro af_id [Hap Haptwo Hcod Hdec].
  expandall. executable af_two(af_id). auto. auto.
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
  intctxt Hdec. intro [Hbef Heq2]. expandall.
  apply if_core_then_af. repeat split => //.
    + admit.
    + admit.
Qed.


lemma [akma_desync] weak_desynchronisation:
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


(* We can add some axioms to prove better desynchronisation *)
axiom [akma_desync]  blah (supi, af_id:index): att(frame@pred(ue_seven(supi, af_id))) =  ko.
axiom [akma_desync] blah2 (supi, af_id:index, tau: timestamp): att(frame@pred(tau)) = ko.
axiom [akma_desync] blah3 (supi, af_id, j:index):
    happens(desync_attaquer(j)) =>
    att(frame@pred(ue_seven(supi, af_id))) =  ko.


lemma [akma_desync] desynchronisation:
  forall (supi, af_id: index), (
    happens(ue_seven(supi, af_id)) &&
    happens(af(af_id)) &&
    happens(ntw_kaf(af_id, supi)) &&
    dec(input@af(af_id), AF_key2(af_id)) <> fail &&
    cond@ntw_kaf(af_id, supi) &&
    output@ntw_kaf(af_id, supi) = input@af(af_id) =>

    exists(af_id2: index), (
      happens(af_seven_ok(af_id2)) &&
      input@ue_seven(supi, af_id2) = ko
    )
  )
.
Proof.
  intro supi af_id [Hap_ue Hap_af Hdec Hap_ntw Hcond Heq].
  exists af_id. split.
  + apply if_ok_then_ok af_id supi. repeat split => //.
  + simpl. apply blah2 supi af_id (ue_seven(supi, af_id)).
Qed.
