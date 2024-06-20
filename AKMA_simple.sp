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
abstract fKAKMA: index * message -> message. (*K_AKMA derivation. *)
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*)
abstract kausf: index *message -> message.
abstract key_creation: message -> message.

abstract ok : message 
abstract ko : message

mutable db_akid(SUPI:index) : message = zero
mutable db_kakma(SUPI:index) : message = zero

abstract af_id_index_to_message : index -> message.

(* Key shared btw UE and Core for symmetric encryption *)
name key_shared: index  -> message.
abstract good_key : message.
senc enc,dec.

aenc enc_af_core, dec_af_core, pk.
name core_key : message.

process UE_initial (SUPI:index) =
    (* initial phase *)
    new r; new ausf_rand; 
    let k_ausf= kausf(SUPI,ausf_rand) in
    let K_AKMA=fKAKMA(SUPI,k_ausf) in
    let AKID=fAKID(SUPI,K_AKMA) in     
    out(ch_UE_Core, enc(<good_key, <AKID, <K_AKMA, ausf_rand>>>,r, key_shared(SUPI))).

process Core_initial =
    (* initial phase *)
    in(ch_UE_Core,x); (* x should be of form enc(<good_key, <AKID, <K_AKMA, ausf_rand>>> *)
    try find SUPI such that
        fst(dec(x,key_shared(SUPI))) = good_key in
        let AKID = fst(snd(dec(x, key_shared(SUPI)))) in
        let K_AKMA = fst(snd(snd(dec(x, key_shared(SUPI))))) in
        db_akid(SUPI) := AKID; (*current akid for this SUPI, stored on the core*)
        db_kakma(SUPI) := K_AKMA.
    
process AF (AF_ID: index) =
    new r;
    in(ch_UE_AF, AKID);
    out(ch_Core_AF, enc_af_core(<AKID, af_id_index_to_message(AF_ID)>, r, pk(core_key)));
    in(ch_Core_AF, x);
    if (x = ko) then (
        out(ch_UE_AF, ko)
    ) else (
        let K_AF = x in
        out(ch_UE_AF, K_AF)
    ).

process Core_KAF =
    (* K_AF key-generation *)
    in(ch_Core_AF, x);
    try find SUPI such that
        db_akid(SUPI) = fst(dec_af_core(x,core_key)) in
        out(ch_Core_AF, fKAF(db_kakma(SUPI),snd(dec_af_core(x,core_key))))
    else (
        out(ch_Core_AF, ko)
    ).
 
process UE_KAF (SUPI:index) =
    out(ch_UE_AF, db_akid(SUPI));
    in(ch_UE_AF, x).
 
system [akma] (!_supi !_af_id (phone_init: UE_initial (supi) | ntw_init: Core_initial | phone_kaf: UE_KAF (supi) | ntw_kaf: Core_KAF | af: AF (af_id))).

lemma [akma] reachability :
  forall (t:timestamp),  forall (t':timestamp),  forall (supi,core:index),
  happens(t) => 
  exec@t &&  t'<t  =>  fst(input@t) = db_akid(supi)@t' .
 Proof.
   intro *.
