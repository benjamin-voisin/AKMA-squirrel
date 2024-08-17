Caml1999N033����            2src/core/equiv.mli����  ��  �  ag  ^������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������8 Equivalence formulas.  ��2src/core/equiv.mliA@@�A@]@@��A@@�A@]@@@@��A@@�A@]@@��
A@@�A@]@��A@@�A@]@������"SE��C_f�C_h@����*SystemExpr��C_k� C_u@��"C_k�#C_u@@@��%C__�&C_u@��(C__�)C_u@�����<��@@ ��@@ �A�������1 {2 Equivalence} ��;F � ��<F � �@@��>F � ��?F � �@@@@��AF � ��BF � �@@��DF � ��EF � �@��GF � ��HF � �@���A�  # �%equiv��QI � ��RI � �@@@@A�����$list��ZI � ��[I � �@������$Term$term��eI � ��fI � �@@��hI � ��iI � �@@@@��kI � ��lI � �@@@@��nI � ��oI � �@@��qI � ��rI � �@���Р(pp_equiv��zK � �{K �@��@�����&Format)formatter���K ���K �@@���K ���K �@@@��@����%equiv���K ���K �$@@���K ���K �$@@@����$unit���K �(��K �,@@���K �(��K �,@@@���K ���K �,@@@���K ���K �,@@@@@���K � ���K �,@���K � ���K �,@���Р1pp_equiv_numbered���M.3��M.D@��@�����&Format)formatter���M.S��M.c@@���M.S��M.c@@@��@����%equiv���M.g��M.l@@���M.g��M.l@@@����$unit���M.p��M.t@@���M.p��M.t@@@���M.g��M.t@@@���M.S��M.t@@@@@���M..��M.t@���M..��M.t@���Р2_pp_equiv_numbered���Nuy��Nu�@���#dbg����$bool���Nu���Nu�@@��Nu��Nu�@@@��@�����&Format)formatter��Nu��Nu�@@��Nu��Nu�@@@��@����%equiv��Nu��Nu�@@��Nu��Nu�@@@����$unit��%Nu��&Nu�@@��(Nu��)Nu�@@@��+Nu��,Nu�@@@��.Nu��/Nu�@@@��1Nu��2Nu�@@@@@��4Nuu�5Nu�@��7Nuu�8Nu�@���Р+subst_equiv��@Q�AQ@��@�����$Term%subst��LQ�MQ @@��OQ�PQ @@@��@����%equiv��YQ$�ZQ)@@��\Q$�]Q)@@@����%equiv��dQ-�eQ2@@��gQ-�hQ2@@@��jQ$�kQ2@@@��mQ�nQ2@@@@@��pQ�qQ2@��sQ�tQ2@���Р(fv_equiv��|TY]�}TYe@��@����%equiv���TYh��TYm@@���TYh��TYm@@@������$Vars"Sv!t���TYq��TYz@@���TYq��TYz@@@���TYh��TYz@@@@���)ocaml.doc��u@@ ��v@@ �A�������? Free variables of an [equiv]. ���S44��S4X@@���S44��S4X@@@@���S44��S4X@@���S44��S4X@@���TYY��TYz@���TYY��TYz@�����а��@@ ���@@ �A�������7 {2 Equivalence atoms} ���W����W��@@���W����W��@@@@���W����W��@@���W����W��@���W����W��@���A�  # �(pred_app���Y����Y��@@@��Р%psymb���Z����Z��@@�����'Symbols)predicate���Z���Z�@@���Z���Z�@@@���Z����Z�@���b���@@ ���@@ �A�������2 Predicate symbol ��Z��Z�3@@��Z��Z�3@@@@��Z��Z�3@@��Z��Z�3@@�Р'ty_args��[46�[4=@@����$list��&[4K�'[4O@������$Type"ty��1[4C�2[4J@@��4[4C�5[4J@@@@��7[4C�8[4O@@@��:[46�;[4P@������@@ ��@@ �A�������0 Type arguments ��K[4]�L[4r@@��N[4]�O[4r@@@@��Q[4]�R[4r@@��T[4]�U[4r@@�Р'se_args��[\su�\\s|@@����$list��c\s��d\s�@������"SE!t��n\s��o\s�@@��q\s��r\s�@@@@��t\s��u\s�@@@��w\su�x\s�@���ܰ�P@@ ��Q@@ �A�������= System expression arguments ���\s���\s�@@���\s���\s�@@@@���\s���\s�@@���\s���\s�@@�Р*multi_args���]����]��@@����$list���]����]��@���������"SE!t���]����]��@@���]����]��@@@������$Term%terms���]����]��@@���]����]��@@@@���]����]��@@@@���]����]��@@@���]����]��@���-���@@ ���@@ �A�������	/ Multi-term args with their system expression. ���^����^� @@���^����^� @@@@���^����^� @@���^����^� @@�Р*simpl_args���_!#��_!-@@�����$Term%terms���_!0��_!:@@���_!0��_!:@@@���_!#��_!;@���^���@@ ���@@ �A�������2 Simple arguments ��
_!J�_!a@@��_!J�_!a@@@@��_!J�_!a@@��_!J�_!a@@@A@@��Y���`bc@@��Y���`bc@���A�  # �$atom��#d���$d��@@@���%Equiv��+e���,e��@@������%equiv��5e���6e��@@��8e���9e��@@@@@��;e���<e��@������@@ ��@@ �A�������	� Equiv u corresponds to (u)^left ~ (u)^right
      where the systems [left, right] are given by the [pair] component 
      of the system context. ��Lf���Mhr�@@��Of���Phr�@@@@��Rf���Shr�@@��Uf���Vhr�@@��%Reach��\j���]j��@@�������$Term$term��hj���ij��@@��kj���lj��@@@@@��nj���oj��@���Ӱ�G@@ ��H@@ �A�������	� Reach(φ) corresponds to [[φ]_{P1} ∧ [φ]_(P2) ∧ …]
      where the systems [Pi] are given by the [set] component of 
      the system context. ��k����m-I@@���k����m-I@@@@���k����m-I@@���k����m-I@@��$Pred���oKO��oKS@@������(pred_app���oKW��oK_@@���oKW��oK_@@@@@���oKM��oK_@�����x@@ ��y@@ �A�������	} Fully applied predicate. Interpretation does not depend on the 
      system context, as all system arguments are explicit. ���p`b��q��@@���p`b��q��@@@@���p`b��q��@@���p`b��q��@@@A@������@@ ���@@ �A�������	m Global formula atom, to be interpreted relatively to a 
    system context (e.g. specified by the sequent). ���bee��c��@@���bee��c��@@@@���bee��c��@@���bee��c��@@���d����oK_@@���d����oK_@���Р'pp_atom���s����s��@��@�����&Format)formatter���s����s�@@���s����s�@@@��@����$atom���s���s�@@���s���s�@@@����$unit��s��s�@@��	s��
s�@@@��s��s�@@@��s���s�@@@@@��s���s�@��s���s�@���Р*subst_atom��u�u$@��@�����$Term%subst��*u'�+u1@@��-u'�.u1@@@��@����$atom��7u5�8u9@@��:u5�;u9@@@����$atom��Bu=�CuA@@��Eu=�FuA@@@��Hu5�IuA@@@��Ku'�LuA@@@@@��Nu�OuA@��Qu�RuA@���Р'fv_atom��ZxY]�[xYd@��@����$atom��dxYg�exYk@@��gxYg�hxYk@@@������$Vars"Sv!t��sxYo�txYx@@��vxYo�wxYx@@@��yxYg�zxYx@@@@���ް�R@@ ��S@@ �A�������0 Free variables ���wCC��wCX@@���wCC��wCX@@@@���wCC��wCX@@���wCC��wCX@@���xYY��xYx@���xYY��xYx@��������t@@ ��u@@ �A�������: {2 Equivalence formulas} ���{����{��@@���{����{��@@@@���{����{��@@���{����{��@���{����{��@�����̰��@@ ���@@ �A�������	* We only support a small fragment for now ���|����|�@@���|����|�@@@@���|����|�@@���|����|�@���|����|�@���A�  # �%quant���~��~@@@���&ForAll���~��~%@@�@@���~��~%@@��&Exists���~(��~.@@�@@���~&��~.@@@A@@���~��~.@@���~��~.@���A�  # �$form�� @05�	 @09@@@���%Quant�� A=A� A=F@@������%quant�� A=J� A=O@@�� A=J� A=O@@@������$Vars+tagged_vars��( A=R�) A=b@@��+ A=R�, A=b@@@�����$form��4 A=e�5 A=i@@��7 A=e�8 A=i@@@@@��: A=?�; A=i@@��#Let��A Bjn�B Bjq@@�������$Vars#var��M Bjw�N Bj@@��P Bjw�Q Bj@@@������$Term$term��[ Bj��\ Bj�@@��^ Bj��_ Bj�@@@�����$form��g Bj��h Bj�@@��j Bj��k Bj�@@@@@��m Bjl�n Bj�@���Ұ�F@@ ��G@@ �A�������	, The system context of the [term] is [pair] ��~ C��� C��@@��� C���� C��@@@@��� C���� C��@@��� C���� C��@@��$Atom��� D���� D��@@������$atom��� D���� D��@@��� D���� D��@@@@@��� D���� D��@@��$Impl��� E���� E��@@������$form��� E���� E��@@��� E���� E��@@@�����$form��� E���� E��@@��� E���� E��@@@@@��� E���� E��@@��#And��� F���� F��@@������$form��� F���� F�	@@��� F���� F�	@@@�����$form��� F�	�� F�	
@@��� F�	�� F�	
@@@@@��� F���� F�	
@@��"Or��� G		�� G		@@������$form��� G		�� G		@@��� G		�� G		@@@�����$form�� G		� G		#@@�� G		� G		#@@@@@�� G		� G		#@@@A@@��
 @00� G		#@@�� @00� G		#@���Р"pp�� I	%	)� I	%	+@��@�����&Format)formatter��" I	%	2�# I	%	B@@��% I	%	2�& I	%	B@@@��@����$form��/ I	%	F�0 I	%	J@@��2 I	%	F�3 I	%	J@@@����$unit��: I	%	N�; I	%	R@@��= I	%	N�> I	%	R@@@��@ I	%	F�A I	%	R@@@��C I	%	2�D I	%	R@@@@@��F I	%	%�G I	%	R@��I I	%	%�J I	%	R@���Р&pp_dbg��R J	S	W�S J	S	]@��@�����&Format)formatter��^ J	S	`�_ J	S	p@@��a J	S	`�b J	S	p@@@��@����$form��k J	S	t�l J	S	x@@��n J	S	t�o J	S	x@@@����$unit��v J	S	|�w J	S	�@@��y J	S	|�z J	S	�@@@��| J	S	t�} J	S	�@@@�� J	S	`�� J	S	�@@@@@��� J	S	S�� J	S	�@��� J	S	S�� J	S	�@���Р#_pp��� O
 
$�� O
 
'@���#dbg����$bool��� O
 
.�� O
 
2@@��� O
 
.�� O
 
2@@@���'context�����"SE'context��� O
 
?�� O
 
I@@��� O
 
?�� O
 
I@@@��@�����&Format)formatter��� O
 
M�� O
 
]@@��� O
 
M�� O
 
]@@@��@����$form��� O
 
a�� O
 
e@@��� O
 
a�� O
 
e@@@����$unit��� O
 
i�� O
 
m@@��� O
 
i�� O
 
m@@@��� O
 
a�� O
 
m@@@��� O
 
M�� O
 
m@@@��� O
 
6�� O
 
m@@@��� O
 
*�� O
 
m@@@@���F���@@ ���@@ �A�������	� Full pretty printer.
    The [context] arguments allows to avoir printing some system expressions
    which are equal [context.set] or [context.pair]. ��� L	�	��� N	�
@@��� L	�	��� N	�
@@@@��� L	�	��� N	�
@@��� L	�	��� N	�
@@��� O
 
 �� O
 
m@�� O
 
 � O
 
m@���Р/mk_quant_tagged��
 R
�
�� R
�
�@���%simpl����$bool�� R
�
�� R
�
�@@�� R
�
�� R
�
�@@@��@����%quant��# R
�
��$ R
�
�@@��& R
�
��' R
�
�@@@��@�����$Vars+tagged_vars��2 R
�
��3 R
�
�@@��5 R
�
��6 R
�
�@@@��@����$form��? R
�
��@ R
�
�@@��B R
�
��C R
�
�@@@����$form��J R
� �K R
�@@��M R
� �N R
�@@@��P R
�
��Q R
�@@@��S R
�
��T R
�@@@��V R
�
��W R
�@@@��Y R
�
��Z R
�@@@@@��\ R
�
��] R
�@��_ R
�
��` R
�@���Р-mk_reach_atom��h T
�i T@��@�����$Term$term��t T�u T#@@��w T�x T#@@@����$form�� T'�� T+@@��� T'�� T+@@@��� T�� T+@@@@@��� T�� T+@��� T�� T+@���Р-mk_equiv_atom��� U,0�� U,=@��@����$list��� U,J�� U,N@������$Term$term��� U,@�� U,I@@��� U,@�� U,I@@@@��� U,@�� U,N@@@����$form��� U,R�� U,V@@��� U,R�� U,V@@@��� U,@�� U,V@@@@@��� U,,�� U,V@��� U,,�� U,V@���Р$tmap��� Y���� Y��@��@��@����$form��� Y���� Y��@@��� Y���� Y��@@@����$form��� Y���� Y��@@��� Y���� Y��@@@��� Y���� Y��@@@��@����$form��� Y���� Y��@@��� Y���� Y��@@@����$form��� Y���� Y��@@�� Y��� Y��@@@�� Y��� Y��@@@�� Y��� Y��@@@@���l���@@ ���@@ �A�������3 Does not recurse. �� X��� X��@@�� X��� X��@@@@�� X��� X��@@��! X���" X��@@��$ Y���% Y��@��' Y���( Y��@���Р%titer��0 Z���1 Z��@��@��@����$form��< Z���= Z��@@��? Z���@ Z��@@@����$unit��G Z��H Z�@@��J Z��K Z�@@@��M Z���N Z�@@@��@����$form��W Z��X Z�@@��Z Z��[ Z�@@@����$unit��b Z��c Z�@@��e Z��f Z�@@@��h Z��i Z�@@@��k Z���l Z�@@@@@��n Z���o Z�@��q Z���r Z�@���Р'tforall��z [�{ [$@��@��@����$form��� [+�� [/@@��� [+�� [/@@@����$bool��� [3�� [7@@��� [3�� [7@@@��� [+�� [7@@@��@����$form��� [<�� [@@@��� [<�� [@@@@����$bool��� [D�� [H@@��� [D�� [H@@@��� [<�� [H@@@��� [*�� [H@@@@@��� [�� [H@��� [�� [H@���Р'texists��� \JN�� \JU@��@��@����$form��� \J\�� \J`@@��� \J\�� \J`@@@����$bool��� \Jd�� \Jh@@��� \Jd�� \Jh@@@��� \J\�� \Jh@@@��@����$form��� \Jm�� \Jq@@��� \Jm�� \Jq@@@����$bool��� \Ju�� \Jy@@��� \Ju�� \Jy@@@��� \Jm�� \Jy@@@��� \J[�	  \Jy@@@@@��	 \JJ�	 \Jy@��	 \JJ�	 \Jy@���Р%tfold��	 ]{�	 ]{�@��@��@����$form��	 ]{��	 ]{�@@��	 ]{��	 ]{�@@@��@��!a��	% ]{��	& ]{�@@@��!a��	+ ]{��	, ]{�@@@��	. ]{��	/ ]{�@@@��	1 ]{��	2 ]{�@@@��@����$form��	; ]{��	< ]{�@@��	> ]{��	? ]{�@@@��@��!a��	F ]{��	G ]{�@@@��!a��	L ]{��	M ]{�@@@��	O ]{��	P ]{�@@@��	R ]{��	S ]{�@@@��	U ]{��	V ]{�@@@@@��	X ]{{�	Y ]{�@��	[ ]{{�	\ ]{�@���Р)tmap_fold��	d ^���	e ^��@��@��@��!b��	n ^���	o ^��@@@��@����$form��	x ^���	y ^��@@��	{ ^���	| ^��@@@�����!b��	� ^���	� ^��@@@�����$form��	� ^���	� ^��@@��	� ^���	� ^��@@@@��	� ^���	� ^��@@@��	� ^���	� ^��@@@��	� ^���	� ^��@@@��@��!b��	� ^���	� ^��@@@��@����$form��	� ^���	� ^��@@��	� ^���	� ^��@@@�����!b��	� ^���	� ^��@@@�����$form��	� ^���	� ^��@@��	� ^���	� ^��@@@@��	� ^���	� ^��@@@��	� ^���	� ^��@@@��	� ^���	� ^��@@@��	� ^���	� ^��@@@@@��	� ^���	� ^��@��	� ^���	� ^��@���Р)get_terms��	� c���	� c��@��@����$form��	� c���	� c��@@��	� c���	� c��@@@����$list��	� c���	� c��@������$Term$term��	� c���	� c��@@��
 c���
 c��@@@@��
 c���
 c��@@@��
 c���
 c��@@@@���l��
�@@ ��
�@@ �A�������	o Get (some) terms appearing in a formula.
  * For instance, terms occurring under binders may not be included. ��
 aBB�
 bo�@@��
 aBB�
 bo�@@@@��
 aBB�
 bo�@@��
! aBB�
" bo�@@��
$ c���
% c��@��
' c���
( c��@���Р'project��
0 gdh�
1 gdo@��@����$list��
: gd|�
; gd�@������$Term$proj��
E gdr�
F gd{@@��
H gdr�
I gd{@@@@��
K gdr�
L gd�@@@��@����$form��
U gd��
V gd�@@��
X gd��
Y gd�@@@����$form��
` gd��
a gd�@@��
c gd��
d gd�@@@��
f gd��
g gd�@@@��
i gdr�
j gd�@@@@���ΰ�B@@ ��C@@ �A�������	8 Project the reachability formulas in a global formula. ��
z f&&�
{ f&c@@��
} f&&�
~ f&c@@@@��
� f&&�
� f&c@@��
� f&&�
� f&c@@��
� gdd�
� gd�@��
� gdd�
� gd�@���Р7is_system_context_indep��
� lX\�
� lXs@��@����$form��
� lXv�
� lXz@@��
� lXv�
� lXz@@@����$bool��
� lX~�
� lX�@@��
� lX~�
� lX�@@@��
� lXv�
� lX�@@@@���	���@@ ���@@ �A�������	x Checks if a formula is independent of the system context,
    i.e. does not contain reachability or equivalence atoms. ��
� j���
� kW@@��
� j���
� kW@@@@��
� j���
� kW@@��
� j���
� kW@@��
� lXX�
� lX�@��
� lXX�
� lX�@�����
���@@ ���@@ �A�������3 {2 Substitutions} ��
� o���
� o��@@��
� o���
� o��@@@@��
� o���
� o��@@��
� o���
� o��@��
� o���
� o��@���Р%subst��
� q���
� q��@��@�����$Term%subst�� q��� q�@@�� q��� q�@@@��@����$form�� q�� q�
@@�� q�� q�
@@@����$form�� q�� q�@@�� q�� q�@@@�� q��  q�@@@��" q���# q�@@@@@��% q���& q�@��( q���) q�@���Р&tsubst��1 r�2 r@��@�����$Type&tsubst��= r%�> r0@@��@ r%�A r0@@@��@����$form��J r4�K r8@@��M r4�N r8@@@����$form��U r<�V r@@@��X r<�Y r@@@@��[ r4�\ r@@@@��^ r%�_ r@@@@@@��a r�b r@@��d r�e r@@���Р(se_subst��m sAE�n sAM@��@�����"SE%subst��y sAS�z sA[@@��| sAS�} sA[@@@��@����$form��� sAb�� sAf@@��� sAb�� sAf@@@����$form��� sAj�� sAn@@��� sAj�� sAn@@@��� sAb�� sAn@@@��� sAS�� sAn@@@@@��� sAA�� sAn@��� sAA�� sAn@���Р+subst_projs��� v���� v��@��@������%Equiv��� w���� w��@A@��� w���� w��@@����%Reach��� w���� w��@A@��� w���� w��@@@@@��� w���� w��@@@��@����$list��� w���� w��@���������$Term$proj��� w���� w��@@��� w���� w��@@@������$Term$proj��� w���� w��@@��� w���� w��@@@@��� w���� w��@@@@��� w���� w��@@@��@����$form��� w���  w��@@�� w��� w��@@@����$form��
 w��� w� @@�� w��� w� @@@�� w��� w� @@@�� w��� w� @@@�� w��� w� @@@@���
{���@@ ���@@ �A�������	5 Substitute projections in [Equiv] or [Reach] atoms. ��' upp�( up�@@��* upp�+ up�@@@@��- upp�. up�@@��0 upp�1 up�@@��3 v���4 w� @��6 v���7 w� @���Р"fv��? z�@ z@��@����$form��I z!�J z%@@��L z!�M z%@@@������$Vars"Sv!t��X z)�Y z2@@��[ z)�\ z2@@@��^ z!�_ z2@@@@���
ð�7@@ ��8@@ �A�������0 Free variables ��o y�p y@@��r y�s y@@@@��u y�v y@@��x y�y y@@��{ z�| z2@��~ z� z2@���Р%ty_fv��� }OS�� }OX@��@����$form��� }O\�� }O`@@��� }O\�� }O`@@@������$Type"Fv!t��� }Oi�� }Or@@��� }Oi�� }Or@@@��� }O\�� }Or@@@@�����@@ ���@@ �A�������5 Free type variables ��� |44�� |4N@@��� |44�� |4N@@@@��� |44�� |4N@@��� |44�� |4N@@��� }OO�� }Or@��� }OO�� }Or@���Р&ty_fvs��� ~sw�� ~s}@��@����$list��� ~s��� ~s�@�����$form��� ~s��� ~s�@@��� ~s��� ~s�@@@@��� ~s��� ~s�@@@������$Type"Fv!t��� ~s��� ~s�@@��� ~s��� ~s�@@@��� ~s��� ~s�@@@@@��� ~ss�� ~s�@��  ~ss� ~s�@��������@@ ���@@ �A�������: {2 Generalized formuals} �� ���� ���@@�� ���� ���@@@@�� ���� ���@@�� ���� ���@�� ����  ���@���A�  # �*local_form��) �/4�* �/>@@@@A������$Term$term��4 �/A�5 �/J@@��7 �/A�8 �/J@@@������@@ ��@@ �A�������	) A local meta-formula is a boolean term. ��H �  �I � .@@��K �  �L � .@@@@��N �  �O � .@@��Q �  �R � .@@��T �//�U �/J@@��W �//�X �/J@���A�  # �+global_form��a �LQ�b �L\@@@@A�����$form��j �L_�k �Lc@@��m �L_�n �Lc@@@@��p �LL�q �Lc@@��s �LL�t �Lc@���A�  # �(any_form��} �ej�~ �er@@@���&Global��� �eu�� �e{@@������$form��� �e�� �e�@@��� �e�� �e�@@@@@��� �eu�� �e�@@��%Local��� �e��� �e�@@�������$Term$term��� �e��� �e�@@��� �e��� �e�@@@@@��� �e��� �e�@@@A@@��� �ee�� �e�@@��� �ee�� �e�@���Р+pp_any_form��� ����� ���@��@�����&Format)formatter��� ����� ���@@��� ����� ���@@@��@����(any_form��� ����� ���@@��� ����� ���@@@����$unit��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р(is_local��� ����� ���@��@����(any_form�� ���� ���@@�� ���� ���@@@����$bool�� ���� ���@@�� ���� ���@@@�� ���� ���@@@@@�� ���� ���@�� ���� ���@���Р,any_to_reach��# ����$ ��@��@����(any_form��- ���. ��@@��0 ���1 ��@@@�����$Term$term��: ���; ��@@��= ���> ��@@@��@ ���A ��@@@@@��C ����D ��@��F ����G ��@���Р,any_to_equiv��O �!�P �-@��@����(any_form��Y �0�Z �8@@��\ �0�] �8@@@����$form��d �<�e �@@@��g �<�h �@@@@��j �0�k �@@@@@@��m ��n �@@��p ��q �@@���A�  # �&f_kind��z ����{ ���@���@��� ����� ���@@@�BA@@���'Local_t��� ����� ���@@�@�����&f_kind��� ����� ���@�����*local_form��� ����� ���@@��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@��(Global_t��� ����� ���@@�@�����&f_kind��� ����� ���@�����+global_form��� ����� ���@@��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@��%Any_t��� ����� ���@@�@�����&f_kind��� ����� ���@�����(any_form��� ����� ���@@��� ����� ���@@@@��� ����� ���@@@��� ����� ���@@@A@@��� ����� ���@@��� ����� ���@���Р*kind_equal��� ��� �@��@����&f_kind�� �� �@���!a�� �� �@@@@�� �� �@@@��@����&f_kind�� �"� �(@���!b�� ��  �!@@@@��" ��# �(@@@����$bool��* �,�+ �0@@��- �,�. �0@@@��0 ��1 �0@@@��3 ��4 �0@@@@@��6 ��7 �0@��9 ��: �0@������#Any��C �4;�D �4>@�����A�  # �!t��O �EL�P �EM@@@@A�����(any_form��X �EP�Y �EX@@��[ �EP�\ �EX@@@@��^ �EG�_ �EX@@��a �EG�b �EX@���Р"pp��j �Z`�k �Zb@��@�����&Format)formatter��v �Zi�w �Zy@@��y �Zi�z �Zy@@@��@����!t��� �Z}�� �Z~@@��� �Z}�� �Z~@@@����$unit��� �Z��� �Z�@@��� �Z��� �Z�@@@��� �Z}�� �Z�@@@��� �Zi�� �Z�@@@@@��� �Z\�� �Z�@��� �Z\�� �Z�@���Р&pp_dbg��� ����� ���@��@�����&Format)formatter��� ����� ���@@��� ����� ���@@@��@����!t��� ����� ���@@��� ����� ���@@@����$unit��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р#_pp��� ����� ���@���#dbg����$bool��� ����� ���@@��� ����� ���@@@���'context�����"SE'context��� ����  ���@@�� ���� ���@@@��@�����&Format)formatter�� ���� ���@@�� ���� ���@@@��@����!t�� ���� ���@@�� ���� ���@@@����$unit��& ����' ��@@��) ����* ��@@@��, ����- ��@@@��/ ����0 ��@@@��2 ����3 ��@@@��5 ����6 ��@@@@@��8 ����9 ��@��; ����< ��@���Р%equal��D ��E �@��@����!t��N ��O �@@��Q ��R �@@@��@����!t��[ ��\ �@@��^ ��_ �@@@����$bool��f ��g �!@@��i ��j �!@@@��l ��m �!@@@��o ��p �!@@@@@��r ��s �!@��u ��v �!@���Р%subst��~ �#)� �#.@��@�����$Term%subst��� �#2�� �#<@@��� �#2�� �#<@@@��@����!t��� �#A�� �#B@@��� �#A�� �#B@@@����!t��� �#F�� �#G@@��� �#F�� �#G@@@��� �#A�� �#G@@@��� �#2�� �#G@@@@@��� �#%�� �#G@��� �#%�� �#G@���Р&tsubst��� �HN�� �HT@��@�����$Type&tsubst��� �HW�� �Hb@@��� �HW�� �Hb@@@��@����!t��� �Hf�� �Hg@@��� �Hf�� �Hg@@@����!t��� �Hk�� �Hl@@��� �Hk�� �Hl@@@��� �Hf�� �Hl@@@��� �HW�� �Hl@@@@@��� �HJ�� �Hl@��� �HJ�� �Hl@���Р"fv��� �nt�� �nv@��@����!t��  �n|� �n}@@�� �n|� �n}@@@������$Vars"Sv!t�� �n�� �n�@@�� �n�� �n�@@@�� �n|� �n�@@@@@�� �np� �n�@�� �np� �n�@���Р%ty_fv��$ ����% ���@��@����!t��. ����/ ���@@��1 ����2 ���@@@������$Type"Fv!t��= ����> ���@@��@ ����A ���@@@��C ����D ���@@@@@��F ����G ���@��I ����J ���@���Р'project��R ����S ���@��@����$list��\ ����] ���@������$Term$proj��g ����h ���@@��j ����k ���@@@@��m ����n ���@@@��@����!t��w ����x ���@@��z ����{ ���@@@����!t��� ����� ���@@��� ����� ���@@@��� ����� ���@@@��� ����� ���@@@@@��� ����� ���@��� ����� ���@���Р,convert_from��� ��� �@��@����&f_kind��� � �� �&@���!a��� ��� �@@@@��� ��� �&@@@��@��!a��� �*�� �,@@@����(any_form��� �0�� �8@@��� �0�� �8@@@��� �*�� �8@@@��� ��� �8@@@@���,���@@ ���@@ �A�������	) Convert any formula kind to [any_form]. ��� ����� ��@@��� ����� ��@@@@��� ����� ��@@��� ����� ��@@��� �
�� �8@��� �
�� �8@���Р*convert_to��� ����� ���@���#loc�����(Location!t��� ����� ��@@�� ���� ��@@@��@����&f_kind�� ��� ��@���!a�� ��� ��
@@@@�� ��� ��@@@��@����(any_form�� ���  ��@@��" ���# ��@@@��!a��( ��!�) ��#@@@��+ ���, ��#@@@��. ���/ ��#@@@��1 ����2 ��#@@@@������
@@ ��@@ �A�������	� Convert [any_form] to any formula kind.
    * Issue a soft failure (with the provided location, if any)
    * when the input formula is not of the right kind. ��B �:<�C ���@@��E �:<�F ���@@@@��H �:<�I ���@@��K �:<�L ���@@��N ����O ��#@��Q ����R ��#@������%Smart��[ �%.�\ �%3@�������'SmartFO!S��g �%6�h �%?@��j �%6�k �%?@@����$form��r �%J�s �%N@  # ���w �%J�x �%N@@@@A�����(any_form��� �%Q�� �%Y@@��� �%Q�� �%Y@@@@��� �%E�� �%Y@@��� �%6�� �%Y@@@��� �%'�� �%Y@��� �%'�� �%Y@@��� �4A�� �Z]@@@��� �44�� �Z]@��� �44�� �Z]@������%Babel��� ����� ���@�����Р'convert��� ����� ���@���#loc�����(Location!t��� ����� ���@@��� ����� ���@@@���#src����&f_kind��� ����� ��@���!a��� ����� ���@@@@��� ����� ��@@@���#dst����&f_kind��� ���� ��@���!b��� ���� ��@@@@��� ���� ��@@@��@��!a��� ���� ��@@@��!b��� ���� �� @@@��� ���� �� @@@��� ���� �� @@@�� ���� �� @@@�� ���� �� @@@@@�� ���� �� @��
 ���� �� @���Р%subst�� �"(� �"-@��@����&f_kind�� �"4� �":@���!a��$ �"1�% �"3@@@@��' �"1�( �":@@@��@�����$Term%subst��3 �">�4 �"H@@��6 �">�7 �"H@@@��@��!a��> �"M�? �"O@@@��!a��D �"S�E �"U@@@��G �"M�H �"U@@@��J �">�K �"U@@@��M �"1�N �"U@@@@@��P �"$�Q �"U@��S �"$�T �"U@���Р&tsubst��\ �V\�] �Vb@��@����&f_kind��f �Vh�g �Vn@���!a��m �Ve�n �Vg@@@@��p �Ve�q �Vn@@@��@�����$Type&tsubst��| �Vr�} �V}@@�� �Vr�� �V}@@@��@��!a��� �V��� �V�@@@��!a��� �V��� �V�@@@��� �V��� �V�@@@��� �Vr�� �V�@@@��� �Ve�� �V�@@@@@��� �VX�� �V�@��� �VX�� �V�@���Р+subst_projs��� ����� ���@��@����&f_kind��� ����� ���@���!a��� ����� ���@@@@��� ����� ���@@@��@������%Equiv��� ����� ���@A@��� ����� ���@@����%Reach��� ����� ���@A@��� ����� ���@@@@@��� ����� ���@@@��@����$list��� ����� ���@���������$Term$proj��� ����� ���@@��� ����� ���@@@������$Term$proj��� ����� ���@@��� ����  ���@@@@�� ���� ���@@@@�� ���� ���@@@��@��!a�� ���� ���@@@��!a�� ���� ���@@@�� ���� ���@@@�� ���� ���@@@�� ���� ���@@@�� ����  ���@@@@@��" ����# ���@��% ����& ���@���Р"fv��. ����/ ���@��@����&f_kind��8 ���9 ��@���!a��? ����@ ��@@@@��B ����C ��@@@��@��!a��J ���K ��@@@������$Vars"Sv!t��V ���W ��@@��Y ���Z ��@@@��\ ���] ��@@@��_ ����` ��@@@@@��b ����c ��@��e ����f ��@���Р)get_terms��n �#�o �,@��@����&f_kind��x �2�y �8@���!a�� �/�� �1@@@@��� �/�� �8@@@��@��!a��� �<�� �>@@@����$list��� �L�� �P@������$Term$term��� �B�� �K@@��� �B�� �K@@@@��� �B�� �P@@@��� �<�� �P@@@��� �/�� �P@@@@@��� ��� �P@��� ��� �P@���Р"pp��� �RX�� �RZ@��@����&f_kind��� �Rd�� �Rj@���!a��� �Ra�� �Rc@@@@��� �Ra�� �Rj@@@��@�����&Format)formatter��� �Rn�� �R~@@��� �Rn�� �R~@@@��@��!a��� �R��� �R�@@@����$unit��� �R��� �R�@@��� �R��� �R�@@@��� �R��� �R�@@@��� �Rn�� �R�@@@��� �Ra�� �R�@@@@@��� �RT�� �R�@��� �RT�� �R�@���Р&pp_dbg�� ���� ���@��@����&f_kind�� ���� ���@���!a�� ���� ���@@@@�� ���� ���@@@��@�����&Format)formatter��& ����' ���@@��) ����* ���@@@��@��!a��1 ����2 ���@@@����$unit��9 ����: ���@@��< ����= ���@@@��? ����@ ���@@@��B ����C ���@@@��E ����F ���@@@@@��H ����I ���@��K ����L ���@���Р'project��T ����U ���@��@����&f_kind��^ ����_ ���@���!a��e ����f ���@@@@��h ����i ���@@@��@����$list��r ����s ���@������$Term$proj��} ����~ ���@@��� ����� ���@@@@��� ����� ���@@@��@��!a��� ����� ���@@@��!a��� ����� �� @@@��� ����� �� @@@��� ����� �� @@@��� ����� �� @@@@@��� ����� �� @��� ����� �� @@��� ����� �@@�����|@@ ��}@@ �A�������	[ Conversions between formula kinds and generic functionalities
    over all formula kinds. ��� �__�� ���@@��� �__�� ���@@@@��� �__�� ���@@��� �__�� ���@@��� ����� �@��� ����� �@������%Smart��� �{��� �{�@�������'SmartFO!S��� �{��� �{�@��� �{��� �{�@@����$form��� �{��� �{�@  # ���� �{��� �{�@@@@A�����+global_form��� �{��� �{�@@��� �{��� �{�@@@@��� �{��� �{�@@��� �{��� �{�@@���`���@@ ���@@ �A�������	( {2 Smart constructors and destructots} �� �MM� �Mz@@�� �MM� �Mz@@@@�� �MM� �Mz@@�� �MM� �Mz@@�� �{{� �{�@�� �{{� �{�@���Р+destr_reach��$ ����% ���@��@����$form��. ����/ ���@@��1 ����2 ���@@@����&option��9 ����: ���@������$Term$term��D ����E ���@@��G ����H ���@@@@��J ����K ���@@@��M ����N ���@@@@@��P ����Q ���@��S ����T ���@���Р+destr_equiv��\ ����] ���@��@����$form��f ����g ���@@��i ����j ���@@@����&option��q ����r ��@�����%equiv��z ����{ ���@@��} ����~ ���@@@@��� ����� ��@@@��� ����� ��@@@@@��� ����� ��@��� ����� ��@���Р(is_equiv��� ��� �@��@����$form��� ��� �@@��� ��� �@@@����$bool��� ��� �"@@��� ��� �"@@@��� ��� �"@@@@@��� ��� �"@��� ��� �"@���Р(is_reach��� �#'�� �#/@��@����$form��� �#2�� �#6@@��� �#2�� �#6@@@����$bool��� �#:�� �#>@@��� �#:�� �#>@@@��� �#2�� �#>@@@@@��� �##�� �#>@��� �##�� �#>@@