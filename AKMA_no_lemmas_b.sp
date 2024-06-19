
(* Model of AKMA *)

(* UE  AAnF share kausf, akid, value for kakma per akid    *)
(*UE --> AF: akid *)
(*AF -->AAnF: akid, afid*)
(*AANF --> AF: AF_key, exptime*)
(*KAKMA=KDF (KAUSF, "AKMA", SUPI); KAF=KDF (KAKMA, AF_ID) *)


include Basic. 

set postQuantumSound = true.

set timeout=12.

(*for confirmation/success and failure messages *)
abstract ok : message 
abstract ko : message
abstract ko_no_af_from_core: message

type key. 

(*channels*)
channel ch_UE_Core  (*Channel between UE and Core. *)
channel ch_Core_AF  (*Channel between Core and AF. *)
channel c_dummy
channel ch_UE_AF. (*Channel between UE and AF. Secure connection in this model.*)


(*for counting but likely useless for now*)
abstract myzero  : message
abstract mySucc  : message -> message
mutable YCpt(i:index): message = myzero
mutable ZCpt(i:index): message = myzero


senc enc,dec.
aenc enc2,dec2,pk. 


abstract fAKID: index * message ->message. (* AKID derivation. *)
abstract fKAKMA: index * message ->message. (*K_AKMA derivation. *)
abstract fKAF: message *message -> message. (*K_AF derivation. Inputs: K_AKMA, ID_AF*))
abstract kausf: index *message -> message.
abstract key_creation: message -> message.

(*ue,core -- keys that each UE share with the fixed core, such as k, ...K_AMF*)
name key_shared: index  -> message

(* Long term key of ID_CORE 

name skCORE :  message

(* Long term key of ID_AF *)
name skAF :  message

(* Long term key of UE; for e.g., TLS with the AF *)
name skUE :  message 

*)

(*some random sym. key*)
name rkk: message

(*for AF_ID to be both indexes and messages*)
mutable conv(x: index) : message =zero   

(*------------------------------------------------------------------*)
(* core's databases *)

(*db_akid , e.g., (supi1, akid0000) TO MAKE IT INTO NAME IN A FIRST INSTANCE*)
mutable db_akid(SUPI:index) : message = zero

(*ue's table, recording the current K-AFs with various AFs*)
mutable ue_kaf_table(SUPI:index, AF_ID: index): message=zero.

name ue_kausf_table: index  -> message


(*REGISTRATION staRTS*)

(* an UE/SUPI, registered to some CORE/ID_CORE, creates an K_AKMA and AKID*)
process UE (SUPI:index) =
    new r; new ausf_rand; 
    let k_ausf= kausf(SUPI,ausf_rand) in
    let K_AKMA=fKAKMA(SUPI,k_ausf) in
    let AKID=fAKID(SUPI,K_AKMA) in     
    out(ch_UE_Core,enc(<AKID,<K_AKMA,ausf_rand>>,r,key_shared(SUPI))); 
   (*this is just to model some seeming of Reg; the shared key is as per AKA -- could be K_AMF*; no idea 
how to write processes without an 'out' *)
    
    db_akid(SUPI) := AKID; (*current akid for this SUPI, stored on the core*)
    ue_kausf_table(SUPI) := k_ausf. (*THIS WONT WORK ANY MORE BECAUSE WE CHANGED TO NAME*)
   




(* we emulate the same computation on the core; not needed but we do it in this modelling*)
process Core(SUPI:index) =
    in(ch_UE_Core,x); (* x= enc(<AKID,<K_akma,rand>>,r0,key_shared(SUPI,ID_CORE))*)
    
    if  (
        fst(snd(dec(x,key_shared(SUPI,ID_CORE))))=fKAKMA(SUPI,kausf(SUPI, snd(snd(dec(x,key_shared(SUPI,ID_CORE)))))) && 
        fst(dec(x,key_shared(SUPI,ID_CORE)))=fAKID(SUPI,snd(dec(x,key_shared(SUPI,ID_CORE))) ) 
        ) 

    then  (
    
          ).

(*UE contacts the AF; sending the AKID; as well as a public-key in case UA* in mutually authenticated*)
process UE_AF_Contact (SUPI:index,ID_CORE:index,ID_AF:index ) =
   new r;
  let  kaf=fKAF(conv(ID_AF),fKAKMA(SUPI,ue_kausf_table(SUPI))) in 
   ue_kaf_table(SUPI):= <pk(af_keys(ID_AF)), kaf>; 
   (*on the UE, record the KAF that this UE  will have with this AF; this is a bit strong but hey*)
   
   (*AKID + a loose sense of that pk(skUE) saying "it's me, some UE that you as an AF should know via an on-boarding"; see modelling below; pk(skUE) is really for channel/session binding in steps 1 and 7 of the protocol*)
   out(ch_UE_AF,enc2(<db_akid(ID_CORE)(SUPI),pk(ue_keys(SUPI))>,r,pk(af_keys(ID_AF)))). 




(*AF reads the AKID request; and keeps this session alive*)
process AF_Core_Contact (ID_AF:index, j:index, ID_CORE:index) =
   in(ch_UE_AF,x); new r2;
   let akid = fst(dec2(x,af_keys(ID_AF))) in 
   
   ZCpt(j) := mySucc(ZCpt(j)); 
   (*AF keeps track that an AKID was sent by some UE; 
   session is marked 'on', at this stage; this is not in the specs*)
   sessions_track(j):=<akid,<snd(dec2(x,af_keys(ID_AF))),on>>;

   (*AF contacts the core, as expected*)
   out(ch_Core_AF,enc2(<akid,conv(ID_AF)>,r2,pk(core_keys(ID_CORE)))).
   
(*the CORE needs to look up the AKID*)
process Core_Answers_AF (ID_CORE:index, ID_AF:index) =
   in(ch_Core_AF,x); (*x= <akid,conv(ID_AF)>*) 
   new r3;
    
   (*I do have a SUPI with such an AKID*)
   if exists (supi:index), db_akid(ID_CORE)(supi) = fst(dec2(x,(core_keys(ID_CORE)))) 
    then 
         (*let me finds its k_akma*)
          try find i such that fst(db_keys(ID_CORE)(i)) = fst(dec2(x,(core_keys(ID_CORE)))) in 
                               let k_akma =snd(db_keys(ID_CORE)(i)) in 
                               (*compute the K_AF and send it to the AF*)
                                out(ch_Core_AF,enc2(fKAF(k_akma,snd(dec2(x,(core_keys(ID_CORE))))),r3,pk(af_keys(ID_AF))))   
   (*I do not have such an AKID*) 
   (*this ko could be ko-no-akid-on-core*)
   else out(ch_Core_AF,enc2(ko,r3,pk(af_keys(ID_AF)))).


   
(*the AF gets an asynchronous answer from the core and should respond to the UE that the answer relates to*)
process AF_AKMA_Ans_UE (ID_AF:index, SUPI:index) =
   in(ch_Core_AF,x); (* x== a key K_AF*) 
   new r4;
 
    (*if the CORE send a key K_AF*)
    if (dec2(x,af_keys(ID_AF)) <> ko) then
          (*find a session that is alive/'on', awaiting a reply*)   
          try find j such that  
                     snd(snd(sessions_track(j))) = on in sessions_track(j):= <fst(sessions_track(j)),<pk(ue_keys(SUPI)),snd(snd(sessions_track(j)))>>; 
                           (*if found, send 'OK' to the right UE that the AF things it has the session with*)       
                           out(ch_UE_AF,enc2(<ok,pk(ue_keys(SUPI))>,r4,fst(snd(sessions_track(j)))))  

   (*If the core did not send a key*) 
   else 
   (*find a (right) session you think it is open, and say 'KO' meaning the Core did not respond well*)
    (*this ko could be ko-no-af-from-core*)
    try find j such that snd(snd(sessions_track(j))) = on in 
                        out(ch_UE_AF,enc2(<ko,pk(af_keys(ID_AF))>,r4,fst(snd(sessions_track(j))))).


(*---------------------------------*)
(*this part /application layer/ is specified no where and we modelled it to be able to check key-agreement*)
(*different modellings/to do with answers and errors/  have different barings on privacy results*)
(*-----------------------------------*)

(* ue_kaf_table(SUPI):= <pk(skAF), kaf> *)
(*here now we need to make the UE read the OK/not ok*)
process UE_Answers_AF (SUPI:index,AF_ID:index) =
   in(ch_UE_AF,x); (*x=OK or not OK*) 
   new r5;
  
   (*if the AF said OK*)
   if fst(dec2(x,ue_keys(SUPI))) = ok then  
            (*if you find the KAF for *this* AF, put it in this z*)
            if fst(ue_kaf_table(SUPI)) = fst(dec2(x,ue_keys(SUPI))) then let z= snd(ue_kaf_table(SUPI)) 
            in  (*send OK and the KAF*) out(ch_UE_AF,enc(<ok,<pk(ue_keys(SUPI)),z>>,r5,pk(af_keys(AF_ID)))) 
                                                           else (*you do not find this AF*) 
                                                           out(ch_UE_AF, enc(ko,r5,rkk)) (*then, send some random encryption*)  
   else (*the AF said not OK*)
   out(ch_UE_AF,enc2(<ko,pk(ue_keys(SUPI))>,r5,pk(af_keys(AF_ID)))).


process AF_Answers_UE (AF_ID:index, SUPI:index) =
   in(ch_UE_AF,x); 
   new r6;
   if(fst(dec2(x,pk(af_keys(AF_ID))))=ko) then (*if a UE send you an pubk-encr. error*)
        (*find the session this belongs to*)     
        try find j such that  
                     snd(snd(sessions_track(j))) <> on && 
                     snd(snd(sessions_track(j))) <> off && 
                     fst(snd(sessions_track(j))) =  snd(dec2(x,af_keys(AF_ID))) in 
                     sessions_track(j):=  <fst(sessions_track(j)),<fst(snd(sessions_track(j))),off>> (*"off"/kill that session*)
   else  (*the ue sent <ok, kaf>*)
     (*if(fst(dec2(x,pk(af_keys(AF_ID))))=ok)*)
     try find j such that  
                     snd(snd(sessions_track(j))) <> on && 
                     snd(snd(sessions_track(j))) <> off && snd(snd(sessions_track(j)))=snd(snd( dec2(x,pk(af_keys(AF_ID))))) in 
                     sessions_track(j):=  <fst(sessions_track(j)),<fst(snd(sessions_track(j))),alive>>;
                      out(ch_UE_AF,enc(ok,r6,snd(dec2(x,pk(af_keys(AF_ID)))))).
    (*there is the case of rubbish being sent on the channel, but let the AF ignore this case for now*)
   (*out(ch_UE_AF, enc(ko,r5,rkk).*)


(*--------------------------------------*)

(*system*)

system [akma]  (!_supi  ( telephone: UE (supi) | 
 netw: Core (supi)    
                                   )
).


lemma [akma] reachability :
  forall (t:timestamp),  forall (t':timestamp),  forall (supi,core:index),
  happens(t) => 
  exec@t &&  t'<t  =>  fst(input@t) = db_akid(core)@t' .






