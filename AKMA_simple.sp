include Basic.
set PostQuantumSound = true.
set timeout = 12.

abstract fAKID: index * message -> message. (* AKID derivation. *)
abstract fKAKMA: index * message -> message. (*AKMA derivation *)
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*)
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
		let K_AKMA = snd(dec(registration, key_shared(SUPI))) in let AKID = fAKID(SUPI, K_AKMA) in
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
    in(Caf, AKID);
    let msg = enc(<AKID, af_id_index_to_message(AF_ID)>, r, AF_key(AF_ID)) in
    out(Ccore, msg);
    in(Caf, x);
    if (dec(x, AF_key(AF_ID)) = ko) then (
        AF1: out(Cue, ko)
    ) else (
        let K_AF = dec(x, AF_key(AF_ID)) in
        AF2: out(Cue, K_AF)
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

process UE_KAF (SUPI:index) =
    out(Caf, db_akid(SUPI));
    in(Cue, x).
 
system [akma] (
	!_supi (
		phone_init: UE_initial (supi) |
		ntw_init: Core_initial (supi) |
		phone_kaf: UE_KAF (supi)
	) |
	!_af_id (
		ntw_kaf: Core_KAF (af_id) |
		af: AF (af_id)
	)
).

lemma [akma] reachability_init :
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

lemma [akma] kaf_reachability:
	forall (ntw_af_id:index, supi:index), (
		happens(ntw_kaf(ntw_af_id, supi)) && cond@ntw_kaf(ntw_af_id, supi) => (
			exists (af_id: index), (
				af(af_id) < ntw_kaf(ntw_af_id, supi) &&
				output@af(af_id) = input@ntw_kaf(ntw_af_id, supi)
			)
		)
	).
Proof.
  intro ntw_af_id supi [Hap [Hdb [Hdec Hafid]]].
  intctxt Hdec. intro [Hb Hi].
  by exists ntw_af_id. 
Qed.
