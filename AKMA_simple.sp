(* Rewrite of the AKMA model, first, a very simple one, with registration and authontication
sequentially *)


include Basic.
set PostQuantumSound = true.
set timeout = 12.

(* Channels definitions *)
channel ch_UE_Core  (*Channel between UE and Core. *)
channel ch_Core_AF  (*Channel between Core and AF. *)
channel ch_UE_AF. (*Channel between UE and AF. Secure connection in this model.*)
channel c_dummy

abstract fAKID: index * message -> message. (* AKID derivation. *)
abstract fKAKMA: index * message -> message. (*K_AKMA derivation. *)
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*)
abstract kausf: index *message -> message.
abstract key_creation: message -> message.

abstract ok : message 
abstract ko : message

process UE (SUPI:index) =
    (* initial phase *)
    new r; new ausf_rand; 
    let k_ausf= kausf(SUPI,ausf_rand) in
    let K_AKMA=fKAKMA(SUPI,k_ausf) in
    let AKID=fAKID(SUPI,K_AKMA) in     

    (* This needs to be encrypted to modelise a secure channel *)
    (* K_AF key-generation *)
    out(ch_UE_Core, <AKID, <K_AKMA, ausf_rand>>);
    in(ch_UE_Core, x).
    
    


process Core =
    (* initial phase *)
    in(ch_UE_Core,x); (* x should be of form <AKID, <K_AKMA, ausf_rand>> *)
    let AKID = fst(x) in
    let K_AKMA = fst(snd(x)) in

    (* K_AF key-generation *)
    in(ch_Core_AF, x);
    if (fst(x) = AKID) then (
        out(ch_Core_AF, fKAF(K_AKMA,snd(x)))
    )
    else (
        out(ch_Core_AF, ko)
    ).


process AF (AF_ID: message) =
    in(ch_UE_AF, AKID);
    out(ch_Core_AF, <AKID, AF_ID>);
    in(ch_Core_AF, x);
    if (x = ko) then (
        out(ch_UE_AF, ko)
    ) else (
        let K_AF = x in
        out(ch_UE_AF, K_AF)
    ).
