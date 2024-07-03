(* Rewrite of the AKMA model, first, a very simple one, with registration and authontication
sequentially *)


include Basic.
set PostQuantumSound = true.
set timeout = 12.

(* Channels definitions *)
channel ch_UE_Core  (*Channel between UE and Core. *)
channel ch_Core_AF  (*Channel between Core and AF. *)
channel ch_UE_AF. (*Channel between UE and AF. Secure connection in this model.*)
channel c_dummy.

abstract fAKID: index * message -> message. (* AKID derivation. *)
hash fKAKMA.
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
abstract supi_to_message : index -> message.

(* Key shared btw UE and Core for symmetric encryption *)
name key_shared: index  -> message.
abstract good_key : message.
senc enc,dec.

aenc enc_af_core, dec_af_core, pk.
name core_key : message.
name AF_key : index -> message.
signature sign, checksign, sign_pk.

process UE_initial (SUPI: index) =
    in(ch_UE_Core, registration);
	(* Check that the core sending this message is the "good" one (meaning using the same SUPI) *)
        (* We can also check dec(registration, key_shared(SUPI)) <> fail, bc that's what we use in the reachability proof *)
	if (fKAKMA(fst(dec(registration, key_shared(SUPI))),supi_to_message(SUPI)) = snd(dec(registration, key_shared(SUPI))))
	then (
		let K_AKMA = snd(dec(registration, key_shared(SUPI))) in
		let AKID = fAKID(SUPI, K_AKMA) in
		db_akid(SUPI) := AKID;
		db_kakma(SUPI) := K_AKMA
                (* Maybe output smth to show that it worked ? *)
	).


process Core_initial (SUPI: index) = 
    new r; new ausf_rand;
	let k_ausf= kausf(SUPI,ausf_rand) in
	let K_AKMA=fKAKMA(k_ausf, supi_to_message(SUPI)) in
    out(ch_UE_Core, enc(<k_ausf,K_AKMA>, r, key_shared(SUPI))).
    
 
process AF (AF_ID: index) =
    new r;
    in(ch_UE_AF, AKID);
    let msg = <AKID, af_id_index_to_message(AF_ID)> in
    out(ch_Core_AF, <af_id_index_to_message(AF_ID),enc(msg, r, AF_key(AF_ID))>);
    in(ch_Core_AF, x);
    if (dec_af_core(x, AF_key(AF_ID)) = ko) then (
        AF1: out(ch_UE_AF, ko)
    ) else (
        let K_AF = dec_af_core(x, AF_key(AF_ID)) in
        AF2: out(ch_UE_AF, K_AF)
    ).
 

process Core_KAF =
    (* K_AF key-generation *)
    in(ch_Core_AF, x); new r;
    let AF_ID = af_id_message_to_index(fst(x)) in
    let msg = dec(snd(x), AF_key(AF_ID)) in
    let AKID = fst(msg) in
    if (msg <> fail) then (
	try find SUPI such that
		db_akid(SUPI) = fst(dec_af_core(x,core_key)) in
		out(ch_Core_AF, enc_af_core(fKAF(db_kakma(SUPI),snd(dec_af_core(x,core_key))),r, pk(AF_key(AF_ID))))
	else (
		out(ch_Core_AF, enc_af_core(ko,r,pk(AF_key(AF_ID))))
		)
	).

process UE_KAF (SUPI:index) =
    out(ch_UE_AF, db_akid(SUPI));
    in(ch_UE_AF, x).
 
system [akma] (!_supi (phone_init: UE_initial (supi) | ntw_init: Core_initial (supi) | phone_kaf: UE_KAF (supi)) | ntw_kaf: Core_KAF | !_af_id af: AF (af_id)).
     

lemma [akma] kaf_reachability:
     forall(supi:index), (
	happens(ntw_kaf(supi)) && cond@ntw_kaf(supi) => (
		exists (af_id:index),
		(af(af_id) < ntw_kaf(supi) &&
                  cond@af(af_id))
			)).
Proof.
    intro supi [Hap [Hdb Hdec]].
    intctxt Hdec.
        + intro [SUPI [Hbef Heq]]. admit.
               
        + intro [Hbef Heq]. admit.
        + intro [af_id [Hbef Heq]].
         exists af_id. split ;  by depends af(af_id),AF1(af_id).
        + intro [af_id [Hbef Heq]].
         exists af_id. split ;  by depends af(af_id),AF2(af_id).
        + auto.
        + intro [af_id [Hbef [_ Heq]]]. by exists af_id.
Qed.

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
