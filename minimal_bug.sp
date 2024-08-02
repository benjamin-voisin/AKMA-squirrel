channel c1.
channel c2.
channel c3.
channel c4.

name m: message.
name m2: message.



process toto (i:index) = 
  toto_1: in(c1, x);
  if (x = m) then (
    toto_2: out(c2, m);
    toto_3: in(c3, x);
    if (x = m2) then (
      toto_4_m: out(c4, m)
    )
  )
.

system very_simple : (!_i toto (i)).

(*
name db: index -> message.

process tata (i, j: index) =
  tata_2: in(c2, x);
  if (x = m) then (
    try find i such that (db(i) = x) in (
      tata_6: out(c3, m)
    ) else (
      tata_6: out(c3, m2)
    )
  )
.


process tutu (i: index) =
  tutu_1: out(c1, m);
  tutu_7: in(c4, x)
.

system simple: (
  !_i (
    toto (i) |
    tutu (i) |
    !_j (tata (i, j))
  )
).
*)
