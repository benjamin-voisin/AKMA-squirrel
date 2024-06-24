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
abstract supi_to_message : index -> message.

(* Key shared btw UE and Core for symmetric encryption *)
name key_shared: index  -> message.
abstract good_key : message.
senc enc,dec.

aenc enc_af_core, dec_af_core, pk.
name core_key : message.
name AF_key : message.

process UE_initial (SUPI: index) =
    in(ch_UE_Core, registration);
	(* Check that the core sending this message is the "good" one (meaning using the same SUPI) *)
	if (fKAKMA(fst(dec(registration, key_shared(SUPI))),supi_to_message(SUPI)) = snd(dec(registration, key_shared(SUPI))))
	then (
		let K_AKMA = snd(dec(registration, key_shared(SUPI))) in
		let AKID = fAKID(SUPI, K_AKMA) in
		db_akid(SUPI) := AKID;
		db_kakma(SUPI) := K_AKMA
	).


process Core_initial (SUPI: index) = 
    new r; new ausf_rand;
	let k_ausf= kausf(SUPI,ausf_rand) in
	let K_AKMA=fKAKMA(k_ausf, supi_to_message(SUPI)) in
    out(ch_UE_Core, enc(<k_ausf,K_AKMA>, r, key_shared(SUPI))).
    
 
process AF (AF_ID: index) =
    new r;
    in(ch_UE_AF, AKID);
    out(ch_Core_AF, enc_af_core(<AKID, af_id_index_to_message(AF_ID)>, r, pk(core_key)));
    in(ch_Core_AF, x);
    if (dec_af_core(x, AF_key) = ko) then (
        out(ch_UE_AF, ko)
    ) else (
        let K_AF = dec_af_core(x, AF_key) in
        out(ch_UE_AF, K_AF)
    ).
 

process Core_KAF =
    (* K_AF key-generation *)
    in(ch_Core_AF, x); new r;
    try find SUPI such that
        db_akid(SUPI) = fst(dec_af_core(x,core_key)) in
        out(ch_Core_AF, enc_af_core(fKAF(db_kakma(SUPI),snd(dec_af_core(x,core_key))),r, pk(AF_key)))
    else (
        out(ch_Core_AF, enc_af_core(ko,r,pk(AF_key)))
    ).

process UE_KAF (SUPI:index) =
    out(ch_UE_AF, db_akid(SUPI));
    in(ch_UE_AF, x).
 
system [akma] (!_supi (phone_init: UE_initial (supi) | ntw_init: Core_initial (supi) | phone_kaf: UE_KAF (supi)) | !_af_id (ntw_kaf: Core_KAF | af: AF (af_id))).


lemma [akma] reachability_init :
	forall (supi:index),
		happens(phone_init(supi)) =>
		((fKAKMA(fst(dec(input@phone_init(supi), key_shared(supi))),supi_to_message(supi)) = snd(dec(input@phone_init(supi), key_shared(supi))))
		<=>
		(exists (ntw_supi:index),
			ntw_init(ntw_supi) < phone_init(supi) &&
			output@ntw_init(ntw_supi) = input@phone_init(supi))).
Proof.
	intro supi Hap.
	split.
	+ intro Meq.
		exists supi.
		split.
		++ have Hdec : dec (input@phone_init(supi), key_shared supi) = input@phone_init(supi).
			admit.
			rewrite Hdec in Meq.
			euf Meq.

lemma [akma] reachability (ue_supi: index) :
	 happens(phone_init(ue_supi)) =>
	(exists (ntw_supi: index), 
		ntw_init(ntw_supi) < phone_init(ue_supi) &&
		output@ntw_init(ntw_supi) = input@phone_init(ue_supi)).


lemma [akma] reachability :
  forall (t:timestamp),  forall (t':timestamp),  forall (supi,core:index),
  happens(t) => 
  exec@t &&  t'<t  =>  fst(input@t) = db_akid(supi)@t' .
 Proof.
   intro *.
