Caml1999N033����            4src/core/process.mli����  H�    1�  /������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������
  � This module defines bi-processes and an internal representation that is
  * useful to perform backward reachability analysis on them. It is
  * independent of whether we perform this analysis to check correspondence or
  * reachability properties. In particular we do not perform the folding
  * of conditionals, since it is not necessary for correspondences. We will
  * do it separately for equivalences. ��4src/core/process.mliA@@�Ft�@@��A@@�Ft�@@@@��A@@�Ft�@@��
A@@�Ft�@��A@@�Ft�@������!L��H���H��@����(Location��H��� H��@��"H���#H��@@@��%H���&H��@��(H���)H��@�����<��@@ ��@@ �A�������	0 Processes, using terms and facts from [Theory] ��;K���<K�2@@��>K���?K�2@@@@��AK���BK�2@@��DK���EK�2@��GK���HK�2@���A�  # �%lsymb��QM49�RM4>@@@@A������&Theory%lsymb��\M4A�]M4M@@��_M4A�`M4M@@@@��bM44�cM4M@@��eM44�fM4M@�����y��@@@ ��A@@ �A�������
  � {2 Front-end processes}
    The computational semantics is action-deterministic
    (e.g. existential lookup is arbitrarily made deterministic) but in the tool
    some constructs may be non-deterministic: we are reasoning over unknown
    determinizations.
  
    It may be useful in the future to check for sources of non-determinism
    other than existential choices. They may be useful, though, e.g. to
    model mixnets. ��xP���yX2G@@��{P���|X2G@@@@��~P���X2G@@���P����X2G@���P����X2G@������%Parse���[����[��@�����A�  # �#cnt���]����]��@@@���$Null���^����^��@@�@@���^����^��@���)ocaml.doc���@@ ���@@ �A�������. Null process ���^����^�@@���^����^�@@@@���^����^�@@���^����^�@@��#New���_��_@@������%lsymb���_��_!@@���_��_!@@@������&Theory$p_ty���_$��_/@@���_$��_/@@@�����!t���_2��_3@@���_2��_3@@@@@���_��_3@���L���@@ ���@@ �A�������/ Name creation ��_:�_N@@��_:�_N@@@@��	_:�
_N@@��_:�_N@@��"In��`OU�`OW@@�������'Channel)p_channel��`O\� `Om@@��"`O\�#`Om@@@�����%lsymb��+`Op�,`Ou@@��.`Op�/`Ou@@@�����!t��7`Ox�8`Oy@@��:`Ox�;`Oy@@@@@��=`OS�>`Oy@������@@ ��@@ �A�������' Input ��N`Oz�O`O�@@��Q`Oz�R`O�@@@@��T`Oz�U`O�@@��W`Oz�X`O�@@��#Out��^a���_a��@@�������'Channel)p_channel��ja���ka��@@��ma���na��@@@������&Theory$term��xa���ya��@@��{a���|a��@@@�����!t���a����a��@@���a����a��@@@@@���a����a��@�����c@@ ��d@@ �A�������( Output ���a����a��@@���a����a��@@@@���a����a��@@���a����a��@@��(Parallel���b����b��@@������!t���b����b��@@���b����b��@@@�����!t���b����b��@@���b����b��@@@@@���b����b��@���!���@@ ���@@ �A�������6 Parallel composition ���b����b�@@���b����b�@@@@���b����b�@@���b����b�@@��#Set���d	��d	@@������%lsymb���d	��d	@@���d	��d	@@@�����$list���d	*��d	.@������&Theory$term��	d	�
d	)@@��d	�d	)@@@@��d	�d	.@@@������&Theory$term��d	1�d	<@@��d	1�d	<@@@�����!t��&d	?�'d	@@@��)d	?�*d	@@@@@@��,d	�-d	@@������@@ ��@@ �A�������	� [Set (s,args,t,p)] stores [t] in cell [s(args)] and continues with [p]. 
        FIXME: for now, we only allow argument of type index. ��=eAE�>f��@@��@eAE�Af��@@@@��CeAE�Df��@@��FeAE�Gf��@@��#Let��Mh���Nh��@@������%lsymb��Wh���Xh��@@��Zh���[h��@@@������&Theory$term��eh���fh��@@��hh���ih��@@@�����&option��qh��rh�	@������&Theory$p_ty��|h���}h�@@��h����h�@@@@���h����h�	@@@�����!t���h���h�@@���h���h�@@@@@���h����h�@�����j@@ ��k@@ �A�������	- Local definition, optional type information ���i��iE@@���i��iE@@@@���i��iE@@���i��iE@@��$Repl���kGM��kGQ@@������%lsymb���kGU��kGZ@@���kGU��kGZ@@@�����!t���kG]��kG^@@���kG]��kG^@@@@@���kGK��kG^@���(���@@ ���@@ �A�������	T [Repl (x,p)] is the parallel composition of [p[x:=i]]
        for all indices [i]. ���l_c��m��@@���l_c��m��@@@@���l_c��m��@@���l_c��m��@@��&Exists���o����o��@@������$list���o����o��@�����%lsymb��o���o��@@��o���o��@@@@��o���	o��@@@������&Theory$term��o���o��@@��o���o��@@@�����!t��o��� o��@@��"o���#o��@@@�����!t��+o���,o��@@��.o���/o��@@@@@��1o���2o��@������
@@ ��@@ �A�������	� [Exists (vars,test,p,q)] evalues to [p[vars:=indices]]
        if there exists [indices] such that [test[vars:=indices]]
        is true, and [q] otherwise. Note that this construct
        subsumes the common conditional construct. ��Bp���Cs��@@��Ep���Fs��@@@@��Hp���Is��@@��Kp���Ls��@@��%Apply��Ru���Su��@@������%lsymb��\u���]u��@@��_u���`u��@@@�����$list��hu�	�iu�	@������&Theory$term��su���tu�	@@��vu���wu�	@@@@��yu���zu�	@@@@@��|u���}u�	@���ְ�U@@ ��V@@ �A�������	- Process call: [Apply (p,ts)] calls [p(ts)]. ���v		��v		B@@���v		��v		B@@@@���v		��v		B@@���v		��v		B@@��%Alias���x	D	J��x	D	O@@������!t���x	D	S��x	D	T@@���x	D	S��x	D	T@@@�����%lsymb���x	D	W��x	D	\@@���x	D	W��x	D	\@@@@@���x	D	H��x	D	\@������@@ ���@@ �A�������	_ [Alias (p,i)] behaves as [p] but [i] will be used
        as a naming prefix for its actions. ���y	]	a��z	�	�@@���y	]	a��z	�	�@@@@���y	]	a��z	�	�@@���y	]	a��z	�	�@@@A@���-���@@ ���@@ �A�������2 A parsed process ���\����\��@@���\����\��@@@@���\����\��@@���\����\��@@���]����x	D	\@�  # �!t���|	�	���|	�	�@@@@A������!L'located��|	�	��|	�	�@�����#cnt��|	�	��|	�	�@@��|	�	��|	�	�@@@@��|	�	��|	�	�@@@@��|	�	��|	�	�@@��]���|	�	�@@��[���}	�	�@@@��[���}	�	�@�� [���!}	�	�@���A�  # �$proc��* @
+
0�+ @
+
4@@@���$Null��2 A
7
;�3 A
7
?@@�@@��6 A
7
9�7 A
7
?@@��#New��= B
@
D�> B
@
G@@�������$Vars#var��I B
@
P�J B
@
X@@��L B
@
P�M B
@
X@@@������$Type"ty��W B
@
[�X B
@
b@@��Z B
@
[�[ B
@
b@@@�����$proc��c B
@
e�d B
@
i@@��f B
@
e�g B
@
i@@@@@��i B
@
B�j B
@
i@@��"In��p C
j
n�q C
j
p@@�������'Symbols'channel��| C
j
z�} C
j
�@@�� C
j
z�� C
j
�@@@������$Vars#var��� C
j
��� C
j
�@@��� C
j
��� C
j
�@@@�����$proc��� C
j
��� C
j
�@@��� C
j
��� C
j
�@@@@@��� C
j
l�� C
j
�@@��#Out��� D
�
��� D
�
�@@�������'Symbols'channel��� D
�
��� D
�
�@@��� D
�
��� D
�
�@@@������$Term$term��� D
�
��� D
�
�@@��� D
�
��� D
�
�@@@�����$proc��� D
�
��� D
�
�@@��� D
�
��� D
�
�@@@@@��� D
�
��� D
�
�@@��(Parallel��� E
�
��� E
�
�@@������$proc��� E
�
��� E
�
�@@��� E
�
��� E
�
�@@@�����$proc��� E
�
��� E
�
�@@��� E
�
��� E
�
�@@@@@��� E
�
��� E
�
�@@��#Set��� F
�
��� F
�
�@@�������'Symbols%macro�� F
�
�� F
�@@�� F
�
��	 F
�@@@�����$list�� F
�� F
�@������$Term$term�� F
�� F
�@@�� F
��  F
�@@@@��" F
��# F
�@@@������$Term$term��- F
��. F
�%@@��0 F
��1 F
�%@@@�����$proc��9 F
�(�: F
�,@@��< F
�(�= F
�,@@@@@��? F
�
��@ F
�,@@��#Let��F G-1�G G-4@@�������$Vars#var��R G-=�S G-E@@��U G-=�V G-E@@@������$Term$term��` G-H�a G-Q@@��c G-H�d G-Q@@@������$Type"ty��n G-T�o G-[@@��q G-T�r G-[@@@�����$proc��z G-^�{ G-b@@��} G-^�~ G-b@@@@@��� G-/�� G-b@@��$Repl��� Hcg�� Hck@@�������$Vars#var��� Hcs�� Hc{@@��� Hcs�� Hc{@@@�����$proc��� Hc~�� Hc�@@��� Hc~�� Hc�@@@@@��� Hce�� Hc�@@��&Exists��� I���� I��@@�������$Vars$vars��� I���� I��@@��� I���� I��@@@������$Term$term��� I���� I��@@��� I���� I��@@@�����$proc��� I���� I��@@��� I���� I��@@@�����$proc��� I���� I��@@��� I���� I��@@@@@��� I���� I��@@��%Apply��� J���� J��@@�������'Symbols'process��� J���� J��@@��� J���� J��@@@�����$list�� J��� J��@������$Term$term�� J��� J��@@�� J��� J��@@@@�� J��� J��@@@@@�� J��� J��@@��%Alias�� K��� K��@@������$proc��( K���) K��@@��+ K���, K��@@@�����&string��4 K���5 K�@@��7 K���8 K�@@@@@��: K���; K�@@@A@@��= @
+
+�> K�@@��@ @
+
+�A K�@���Р#_pp��I NNR�J NNU@���#dbg����$bool��U NN_�V NNc@@��X NN_�Y NNc@@@��@�����&Format)formatter��d NNg�e NNw@@��g NNg�h NNw@@@��@����$proc��q NN{�r NN@@��t NN{�u NN@@@����$unit��| NN��} NN�@@�� NN��� NN�@@@��� NN{�� NN�@@@��� NNg�� NN�@@@��� NN[�� NN�@@@@@��� NNN�� NN�@��� NNN�� NN�@���Р"pp��� O���� O��@��@�����&Format)formatter��� O���� O��@@��� O���� O��@@@��@����$proc��� O���� O��@@��� O���� O��@@@����$unit��� O���� O��@@��� O���� O��@@@��� O���� O��@@@��� O���� O��@@@@@��� O���� O��@��� O���� O��@���Р&pp_dbg��� P���� P��@��@�����&Format)formatter��� P���� P��@@��� P���� P��@@@��@����$proc��� P���� P��@@��� P���� P��@@@����$unit��� P���� P��@@��� P���� P��@@@��� P���� P��@@@��  P��� P��@@@@@�� P��� P��@�� P��� P��@���A�  # �)proc_decl�� SUZ� SUc@@@��Р$args�� Thj� Thn@@�����$Vars$vars��" Thr�# Th{@@��% Thr�& Th{@@@��( Thj�) Th|@@�Р%projs��/ U}�0 U}�@@�����$Term%projs��9 U}��: U}�@@��< U}��= U}�@@@��? U}�@ U}�@@�Р$time��F V���G V��@@�����$Vars#var��P V���Q V��@@��S V���T V��@@@��V V���W V��@@�Р$proc��] W���^ W��@@����$proc��e W���f W��@@��h W���i W��@@@��k W���l W��@@@A@���Ű�D@@ ��E@@ �A�������	% Check that a process is well-typed. ��| Z!!�} Z!K@@�� Z!!�� Z!K@@@@��� Z!!�� Z!K@@��� Z!!�� Z!K@@��� SUU�� X��@@��� SUU�� X��@���Р%parse��� [LP�� [LU@��@�����'Symbols%table��� \Y[�� \Yh@@��� \Y[�� \Yh@@@���$args�����&Theory$bnds��� ]ls�� ]l~@@��� ]ls�� ]l~@@@��@�����$Term%projs��� ]l��� ]l�@@��� ]l��� ]l�@@@��@�����%Parse!t��� ]l��� ]l�@@��� ]l��� ]l�@@@����)proc_decl��� ]l��� ]l�@@��� ]l��� ]l�@@@��� ]l��� ]l�@@@��� ]l��� ]l�@@@��� ]ln�� ]l�@@@��� \Y[�� ]l�@@@@���C���@@ ���@@ �A�������~��� Z!!�� Z!K@@��� Z!!�� Z!K@@@@��� Z!!�  Z!K@@�� Z!!� Z!K@@�� [LL� ]l�@�� [LL�	 ]l�@���Р'declare�� a9=� a9D@��@�����'Symbols%table�� bGI� bGV@@��  bGI�! bGV@@@���"id����%lsymb��, c[`�- c[e@@��/ c[`�0 c[e@@@���$args�����&Theory$bnds��= c[n�> c[y@@��@ c[n�A c[y@@@���%projs����&option��L c[��M c[�@�����$list��U c[��V c[�@�����%lsymb��^ c[��_ c[�@@��a c[��b c[�@@@@��d c[��e c[�@@@@��g c[��h c[�@@@��@�����%Parse!t��s c[��t c[�@@��v c[��w c[�@@@�����'Symbols%table��� d���� d��@@��� d���� d��@@@��� c[��� d��@@@��� c[}�� d��@@@��� c[i�� d��@@@��� c[]�� d��@@@��� bGI�� d��@@@@�����	k@@ ��	l@@ �A�������	F Declare a named process. The body of the definition is type-checked. ��� `���� `�8@@��� `���� `�8@@@@��� `���� `�8@@��� `���� `�8@@��� a99�� d��@��� a99�� d��@���Р4add_namelength_axiom��� g��� g�@���#loc�����(Location!t��� h �� h*@@��� h �� h*@@@��@�����'Symbols%table��� h.�� h;@@��� h.�� h;@@@��@����%lsymb��� h?�� hD@@��� h?�� hD@@@��@�����$Type%ftype��� hH�� hR@@��� hH�� hR@@@�����'Symbols%table��	 iVX�	 iVe@@��	 iVX�	 iVe@@@��	 hH�	 iVe@@@��	
 h?�	 iVe@@@��	 h.�	 iVe@@@��	 h�	 iVe@@@@@��	 g���	 iVe@��	 g���	 iVe@���Р.declare_system��	 p���	  p��@��@�����'Symbols%table��	+ q���	, q��@@��	. q���	/ q��@@@��@����&option��	8 q���	9 q��@�����%lsymb��	A q���	B q��@@��	D q���	E q��@@@@��	G q���	H q��@@@��@�����$Term%projs��	S q���	T q��@@��	V q���	W q��@@@��@�����%Parse!t��	b q���	c q� @@��	e q���	f q� @@@�����'Symbols%table��	o q��	p q�@@��	r q��	s q�@@@��	u q���	v q�@@@��	x q���	y q�@@@��	{ q���	| q�@@@��	~ q���	 q�@@@@���ذ�
W@@ ��
X@@ �A�������	� Final declaration of the system under consideration,
    which triggers the computation of its internal representation
    as a set of actions. In that process, name creations are compiled away.
    Other constructs are grouped into action descriptions. ��	� l���	� ou�@@��	� l���	� ou�@@@@��	� l���	� ou�@@��	� l���	� ou�@@��	� p���	� q�@��	� p���	� q�@�����	���
y@@ ��
z@@ �A�������3 {2 Error handling}��	� tZZ�	� tZr@@��	� tZZ�	� tZr@@@@��	� tZZ�	� tZr@@��	� tZZ�	� tZr@��	� tZZ�	� tZr@���A�  # �'error_i��	� vty�	� vt�@@@���+Arity_error��	� w���	� w��@@������&string��	� w���	� w��@@��	� w���	� w��@@@�����#int��	� w���	� w��@@��	� w���	� w��@@@�����#int��	� w���	� w��@@��	� w���	� w��@@@@@��	� w���	� w��@@��0StrictAliasError��	� x���	� x��@@������&string��
 x���
	 x��@@��
 x���
 x��@@@@@��
 x���
 x��@@��0DuplicatedUpdate��
 y���
 y��@@������&string��
 y���
  y��@@��
" y���
# y��@@@@@��
% y���
& y��@@��,Freetyunivar��
, z���
- z��@@�@@��
0 z���
1 z��@@��-ProjsMismatch��
7 {���
8 {�	@@�������$Term%projs��
C {��
D {�@@��
F {��
G {�@@@������$Term%projs��
Q {��
R {�$@@��
T {��
U {�$@@@@@��
W {���
X {�$@@��+ActionUndef��
^ |%)�
_ |%4@@�������'Symbols&action��
j |%8�
k |%F@@��
m |%8�
n |%F@@@@@��
p |%'�
q |%F@@@A@@��
s vtt�
t |%F@@��
v vtt�
w |%F@���A�  # �%error��
� ~JO�
� ~JT@@@@A���������(Location!t��
� ~JW�
� ~Ja@@��
� ~JW�
� ~Ja@@@�����'error_i��
� ~Jd�
� ~Jk@@��
� ~Jd�
� ~Jk@@@@��
� ~JW�
� ~Jk@@@@��
� ~JJ�
� ~Jk@@��
� ~JJ�
� ~Jk@���Р(pp_error��
� �mq�
� �my@��@��@�����&Format)formatter��
� �|�
� �|�@@��
� �|�
� �|�@@@��@�����(Location!t��
� �|��
� �|�@@��
� �|��
� �|�@@@����$unit��
� �|��
� �|�@@��
� �|��
� �|�@@@��
� �|��
� �|�@@@��
� �|�
� �|�@@@��@�����&Format)formatter��
� ����
� ���@@��
� ����
� ���@@@��@����%error��
� ����
� ���@@��
� ����
� ���@@@����$unit�� ���� ���@@�� ���� ���@@@��
 ���� ���@@@�� ���� ���@@@�� �|~� ���@@@@@�� �mm� ���@�� �mm� ���@������%Error��  ����! ���@�@������%error��+ ����, ���@@��. ����/ ���@@@@@��1 ����2 ���@@��@@ ��@@ �A@��7 ����8 ���@@