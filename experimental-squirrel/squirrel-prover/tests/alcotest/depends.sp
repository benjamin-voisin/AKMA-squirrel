channel c

system !_i in(c,x);out(c,x);in(c,x);out(c,x).

lemma _ (i:index) : A1(i) < A1(i).
Proof.
  depends A1(i), A1(i).
Qed.
