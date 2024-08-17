Caml1999N033����            5src/prover/prover.mli����  a�  w  @�  >������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����.squirrelprover��A@A�A@O@@��A@@� A@P@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������
  7 {2 Prover state} 
   is composed by :
   - goals proofs obligation and lemma remaining to be proved
   - table of symbols
   - current_goal if there is one
   - subgoals associated sequent that has to be proved (i.e. the
   root of the required proof tree)
   - bullets (path trough a proof tree under contstruction)
  
    The term "goal" refers to two things below:

    - A toplevel goal declaration (i.e. a lemma)
      which is represented (with some redundancy) by a [Goal.statement]
      and a [Goal.t] which is the associated sequent that has to be
      proved, i.e. the root of the required proof tree.

    - A sequent that has to be proved (i.e. a node in a proof tree)
      which is represented by a [Goal.t].

    For now we use the adjectives toplevel and inner to distinguish
    the two kinds of goals. ��5src/prover/prover.mliA@@�U<@@��A@@�U<@@@@��A@@�U<@@��
A@@�U<@��A@@�U<@������,Squirrelcore��W>C�W>O@A��W>>�W>O@@��W>>�W>O@������*Unfinished��'YQ[�(YQe@�@�@@��,YQQ�-YQe@@��@@ ��@@ �A@��2YQQ�3YQe@���A�  # �%state��<[gl�=[gq@@@@A@@��?[gg�@[gq@@��B[gg�C[gq@���Р%init'��K^���L^��@��@����$unit��U^���V^��@@��X^���Y^��@@@����%state��`^���a^��@@��c^���d^��@@@��f^���g^��@@@@���)ocaml.doc��@@@ ��A@@ �A�������	+ Set the proof_state to its initial state. ��x]ss�y]s�@@��{]ss�|]s�@@@@��~]ss�]s�@@���]ss��]s�@@���^����^��@���^����^��@���Р-add_proof_obl���a����a��@��@�����$Goal!t���a����a��@@���a����a��@@@��@����%state���a����a��@@���a����a��@@@����%state���a���a�@@���a���a�@@@���a����a�@@@���a����a�@@@@���W���@@ ���@@ �A�������6 add proof obligation ���`����`��@@���`����`��@@@@���`����`��@@���`����`��@@���a����a�@���a����a�@���Р)add_decls���d!%��d!.@��@����%state���d!1��d!6@@���d!1��d!6@@@��@�����$Decl,declarations���d!:� d!K@@��d!:�d!K@@@�������%state��d!O�d!T@@��d!O�d!T@@@�����$list��d!^�d!b@������$Goal!t��$d!W�%d!]@@��'d!W�(d!]@@@@��*d!W�+d!b@@@@��-d!O�.d!b@@@��0d!:�1d!b@@@��3d!1�4d!b@@@@���Ͱ�@@ ��@@ �A�������2 add declarations ��Dc		�Ec	 @@��Gc		�Hc	 @@@@��Jc		�Kc	 @@��Mc		�Nc	 @@��Pd!!�Qd!b@��Sd!!�Td!b@���Р2get_current_system��\fdh�]fdz@��@����%state��ffd}�gfd�@@��ifd}�jfd�@@@����&option��qfd��rfd�@������*SystemExpr'context��|fd��}fd�@@��fd���fd�@@@@���fd���fd�@@@���fd}��fd�@@@@@���fdd��fd�@���fdd��fd�@���Р0get_current_goal���i����i��@��@����%state���i����i��@@���i����i��@@@����&option���i����i��@������)ProverLib-pending_proof���i����i��@@���i����i��@@@@���i����i��@@@���i����i��@@@@���W���@@ ���@@ �A�������5 Return current goal ���h����h��@@���h����h��@@@@���h����h��@@���h����h��@@���i����i��@���i����i��@���Р)get_table���l#'��l#0@��@����%state���l#3��l#8@@���l#3��l#8@@@�����'Symbols%table���l#<��l#I@@�� l#<�l#I@@@��l#3�l#I@@@@�������@@ ���@@ �A�������	! Return the table of given state ��k���k�"@@��k���k�"@@@@��k���k�"@@��k���k�"@@�� l##�!l#I@��#l##�$l#I@���Р,get_subgoals��,ouy�-ou�@��@����%state��6ou��7ou�@@��9ou��:ou�@@@����$list��Aou��Bou�@������$Goal!t��Lou��Mou�@@��Oou��Pou�@@@@��Rou��Sou�@@@��Uou��Vou�@@@@�����.@@ ��/@@ �A�������	$ Return the subgoals of given state ��fnKK�gnKt@@��inKK�jnKt@@@@��lnKK�mnKt@@��onKK�pnKt@@��rouu�sou�@��uouu�vou�@���Р(get_mode��~r���r��@��@����%state���r����r��@@���r����r��@@@�����)ProverLib+prover_mode���r����r��@@���r����r��@@@���r����r��@@@@���5��t@@ ��u@@ �A�������8 Return the prover_mode ���q����q��@@���q����q��@@@@���q����q��@@���q����q��@@���r����r��@���r����r��@���Р)set_table���u��u@��@����%state���u��u$@@���u��u$@@@��@�����'Symbols%table���u(��u5@@���u(��u5@@@����%state���u9��u>@@���u9��u>@@@���u(��u>@@@���u��u>@@@@�������@@ ���@@ �A�������> Set the table of given state ��t���t�@@��t���t�@@@@��t���	t�@@��t���t�@@��u�u>@��u�u>@���Р-tactic_handle��x_c�x_p@��@����%state��$x_s�%x_x@@��'x_s�(x_x@@@��@�����)ProverLib/bulleted_tactic��3x_|�4x_�@@��6x_|�7x_�@@@����%state��>x_��?x_�@@��Ax_��Bx_�@@@��Dx_|�Ex_�@@@��Gx_s�Hx_�@@@@����� @@ ��!@@ �A�������9 Handler of parsed input ��Xw@@�Yw@^@@��[w@@�\w@^@@@@��^w@@�_w@^@@��aw@@�bw@^@@��dx__�ex_�@��gx__�hx_�@���Р*do_tactic'��p{���q{��@���%check������%Check��~{���{��@A@���{����{��@@����'NoCheck���{����{�@A@���{����{�@@@@@���{����{�@@@��@����%state���{���{�@@���{���{�@@@��@�����)ProverLib0bulleted_tactics���|��|+@@���|��|+@@@����%state���|/��|4@@���|/��|4@@@���|��|4@@@���{���|4@@@���{����|4@@@@���Y���@@ ���@@ �A�������	1 do tactic with or without check of parsed input ���z����z��@@���z����z��@@@@���z����z��@@���z����z��@@���{����|4@���{����|4@���Р2is_proof_completed���~6:��~6L@��@����%state���~6O��~6T@@���~6O��~6T@@@����$bool���~6X��~6\@@�� ~6X�~6\@@@��~6O�~6\@@@@@��~66�~6\@��	~66�
~6\@���Р2try_complete_proof�� B��� B��@��@����%state�� B��� B��@@�� B���  B��@@@����%state��' B���( B��@@��* B���+ B��@@@��- B���. B��@@@@���ǰ�@@ ��@@ �A�������	O If current proof is completed change prover_mode and 
* printout informations ��> @^^�? A��@@��A @^^�B A��@@@@��D @^^�E A��@@��G @^^�H A��@@��J B���K B��@��M B���N B��@���Р&do_eof��V E �W E&@��@����%state��` E)�a E.@@��c E)�d E.@@@����%state��k E2�l E7@@��n E2�o E7@@@��q E)�r E7@@@@�����J@@ ��K@@ �A�������	: Only switch prover_mode to AllDone → to finish program ��� D���� D�@@��� D���� D�@@@@��� D���� D�@@��� D���� D�@@��� E�� E7@��� E�� E7@���Р1current_goal_name��� H|��� H|�@��@����%state��� H|��� H|�@@��� H|��� H|�@@@����&option��� H|��� H|�@�����&string��� H|��� H|�@@��� H|��� H|�@@@@��� H|��� H|�@@@��� H|��� H|�@@@@���[���@@ ���@@ �A�������	= Return the name of the goal currently being proved, if any. ��� G99�� G9{@@��� G99�� G9{@@@@��� G99�� G9{@@��� G99�� G9{@@��� H||�� H|�@��� H||�� H|�@���Р+pp_subgoals��� J���� J��@��@����%state��� J���� J��@@��� J���� J��@@@��@�����&Format)formatter�� J��� J��@@�� J��� J��@@@��@����$unit�� J��� J��@@�� J��� J��@@@����$unit�� J��� J��@@�� J��� J��@@@��! J���" J��@@@��$ J���% J��@@@��' J���( J��@@@@@��* J���+ J��@��- J���. J��@���Р.complete_proof��6 M	)	-�7 M	)	;@��@����%state��@ M	)	>�A M	)	C@@��C M	)	>�D M	)	C@@@����%state��K M	)	G�L M	)	L@@��N M	)	G�O M	)	L@@@��Q M	)	>�R M	)	L@@@@�����*@@ ��+@@ �A�������	: Complete the proofs, resetting the current goal to None. ��b L���c L�	(@@��e L���f L�	(@@@@��h L���i L�	(@@��k L���l L�	(@@��n M	)	)�o M	)	L@��q M	)	)�r M	)	L@���Р(add_hint��z P	h	l�{ P	h	t@��@����%state��� P	h	w�� P	h	|@@��� P	h	w�� P	h	|@@@��@�����$Hint&p_hint��� P	h	��� P	h	�@@��� P	h	��� P	h	�@@@����%state��� P	h	��� P	h	�@@��� P	h	��� P	h	�@@@��� P	h	��� P	h	�@@@��� P	h	w�� P	h	�@@@@���A���@@ ���@@ �A�������4 TODO processDecl ? ��� O	N	N�� O	N	g@@��� O	N	N�� O	N	g@@@@��� O	N	N�� O	N	g@@��� O	N	N�� O	N	g@@��� P	h	h�� P	h	�@��� P	h	h�� P	h	�@���Р)set_param��� S	�	��� S	�	�@��@����%state��� S	�	��� S	�	�@@��� S	�	��� S	�	�@@@��@�����&Config+p_set_param��� S	�	��� S	�	�@@��� S	�	��� S	�	�@@@����%state��� S	�	��� S	�	�@@��� S	�	��� S	�	�@@@��� S	�	��� S	�	�@@@��� S	�	��� S	�	�@@@@�������@@ ���@@ �A�������9 set param : from config �� R	�	�� R	�	�@@�� R	�	�� R	�	�@@@@�� R	�	�� R	�	�@@�� R	�	�� R	�	�@@�� S	�	�� S	�	�@�� S	�	�� S	�	�@���Р,add_new_goal��& V
+
/�' V
+
;@��@����%state��0 V
+
>�1 V
+
C@@��3 V
+
>�4 V
+
C@@@��@�����(Location'located��? V
+
U�@ V
+
e@�������$Goal&Parsed!t��L V
+
G�M V
+
T@@��O V
+
G�P V
+
T@@@@��R V
+
G�S V
+
e@@@����%state��Z V
+
i�[ V
+
n@@��] V
+
i�^ V
+
n@@@��` V
+
G�a V
+
n@@@��c V
+
>�d V
+
n@@@@������<@@ ��=@@ �A�������	: Declare a new goal to the current goals, and returns it. ��t U	�	��u U	�
*@@��w U	�	��x U	�
*@@@@��z U	�	��{ U	�
*@@��} U	�	��~ U	�
*@@��� V
+
+�� V
+
n@��� V
+
+�� V
+
n@���Р+start_proof��� Y
�
��� Y
�
�@��@����%state��� Y
�
��� Y
�
�@@��� Y
�
��� Y
�
�@@@��@������%Check��� Y
�
��� Y
�
�@A@��� Y
�
��� Y
�
�@@����'NoCheck��� Y
�
��� Y
�
�@A@��� Y
�
��� Y
�
�@@@@@��� Y
�
��� Y
�
�@@@�������&option��� Y
�
��� Y
�@�����&string��� Y
�
��� Y
�
�@@��� Y
�
��� Y
�
�@@@@��� Y
�
��� Y
�@@@�����%state��� Y
��� Y
�	@@��� Y
��� Y
�	@@@@��� Y
�
��� Y
�	@@@��� Y
�
��� Y
�
@@@��� Y
�
��� Y
�
@@@@������@@ ���@@ �A�������	J Initialize the prover state try to prove the first of the unproved goal. ��� X
q
q�� X
q
�@@��� X
q
q�� X
q
�@@@@��� X
q
q�� X
q
�@@��� X
q
q�  X
q
�@@�� Y
�
�� Y
�
@�� Y
�
�� Y
�
@���Р%abort�� \-1� \-6@��@����%state�� \-9� \->@@�� \-9� \->@@@����%state��# \-B�$ \-G@@��& \-B�' \-G@@@��) \-9�* \-G@@@@���ð�@@ ��@@ �A�������: Abort the current proof. ��: [�; [,@@��= [�> [,@@@@��@ [�A [,@@��C [�D [,@@��F \--�G \-G@��I \--�J \-G@���Р*first_goal��R _lp�S _lz@��@����%state��\ _l}�] _l�@@��_ _l}�` _l�@@@�����)ProverLib-pending_proof��i _l��j _l�@@��l _l��m _l�@@@��o _l}�p _l�@@@@���	��H@@ ��I@@ �A�������= Return first pending_proof. ��� ^II�� ^Ik@@��� ^II�� ^Ik@@@@��� ^II�� ^Ik@@��� ^II�� ^Ik@@��� _ll�� _l�@��� _ll�� _l�@���Р,search_about��� b���� b��@��@����%state��� c���� c��@@��� c���� c��@@@��@�����)ProverLib,search_query��� c���� c�@@��� c���� c�@@@����$list��� d4�� d8@���������%Lemma%lemma��� d�� d@@��� d�� d@@@�����$list��� d.�� d2@������%Equiv(any_form��� d�� d-@@��� d�� d-@@@@��� d�� d2@@@@��� d�� d2@@@@��� d�� d8@@@��� c���� d8@@@��� c���� d8@@@@�������@@ ���@@ �A�������	- Returns terms that match t pattern in lemma �� a��� a��@@�� a��� a��@@@@��
 a��� a��@@�� a��� a��@@�� b��� d8@�� b��� d8@���Р(do_print�� gTX� gT`@��@����%state��& gTc�' gTh@@��) gTc�* gTh@@@��@�����)ProverLib+print_query��5 gTl�6 gT�@@��8 gTl�9 gT�@@@����$unit��@ gT��A gT�@@��C gT��D gT�@@@��F gTl�G gT�@@@��I gTc�J gT�@@@@�����	"@@ ��	#@@ �A�������4 Manage print query ��Z f::�[ f:S@@��] f::�^ f:S@@@@��` f::�a f:S@@��c f::�d f:S@@��f gTT�g gT�@��i gTT�j gT�@���Р)do_search��r j���s j��@��@����%state��| j���} j��@@�� j���� j��@@@��@�����)ProverLib,search_query��� j���� j��@@��� j���� j��@@@����$unit��� j���� j��@@��� j���� j��@@@��� j���� j��@@@��� j���� j��@@@@���9��	x@@ ��	y@@ �A�������	& Print out terms that match t pattern ��� i���� i��@@��� i���� i��@@@@��� i���� i��@@��� i���� i��@@��� j���� j��@��� j���� j��@���Р1get_first_subgoal��� pcg�� pcx@��@����%state��� pc{�� pc�@@��� pc{�� pc�@@@�����$Goal!t��� pc��� pc�@@��� pc��� pc�@@@��� pc{�� pc�@@@@�����	�@@ ��	�@@ �A�������	U Get the first subgoal.
    @raise Not_found if there is no subgoal or current goal. ��� n�� o#b@@��� n�� o#b@@@@��� n�� o#b@@��� n�	  o#b@@��	 pcc�	 pc�@��	 pcc�	 pc�@���Р'pp_goal��	 t���	 t��@��@����%state��	 t���	 t��@@��	 t���	 t��@@@��@�����&Format)formatter��	' t���	( t��@@��	* t���	+ t��@@@��@����$unit��	4 t���	5 t��@@��	7 t���	8 t��@@@����$unit��	? t���	@ t��@@��	B t���	C t��@@@��	E t���	F t��@@@��	H t���	I t��@@@��	K t���	L t��@@@@�����
$@@ ��
%@@ �A�������, Print goal ��	\ s���	] s��@@��	_ s���	` s��@@@@��	b s���	c s��@@��	e s���	f s��@@��	h t���	i t��@��	k t���	l t��@���Р$init��	t w�	u w@���+withPrelude����$bool��	� w�	� w @@��	� w�	� w @@@��@����$unit��	� w$�	� w(@@��	� w$�	� w(@@@����%state��	� w,�	� w1@@��	� w,�	� w1@@@��	� w$�	� w1@@@��	� w�	� w1@@@@���	;��
z@@ ��
{@@ �A�������	& Return Toplevel.PROVER in init state ��	� v���	� v�@@��	� v���	� v�@@@@��	� v���	� v�@@��	� v���	� v�@@��	� w�	� w1@��	� w�	� w1@���Р)do_tactic��	� zGK�	� zGT@���%check������%Check��	� zG_�	� zGe@A@��	� zG_�	� zGe@@����'NoCheck��	� zGh�	� zGp@A@��	� zGh�	� zGp@@@@@��	� zG^�	� zGq@@@��@����%state��	� zGu�	� zGz@@��	� zGu�	� zGz@@@��@�����)Sedlexing&lexbuf��
 {~��
 {~�@@��
 {~��
 {~�@@@��@�����)ProverLib0bulleted_tactics��
 {~��
 {~�@@��
 {~��
 {~�@@@����%state��
 {~��
 {~�@@��
 {~��
  {~�@@@��
" {~��
# {~�@@@��
% {~��
& {~�@@@��
( zGu�
) {~�@@@��
+ zGW�
, {~�@@@@���	Ű�@@ ��@@ �A�������. do tactics ! ��
< y33�
= y3F@@��
? y33�
@ y3F@@@@��
B y33�
C y3F@@��
E y33�
F y3F@@��
H zGG�
I {~�@��
K zGG�
L {~�@���Р-do_print_goal��
T ~���
U ~��@��@����%state��
^ ~���
_ ~��@@��
a ~���
b ~��@@@����$unit��
i ~���
j ~��@@��
l ~���
m ~��@@@��
o ~���
p ~��@@@@���
	��H@@ ��I@@ �A�������4 print current goal ��
� }���
� }��@@��
� }���
� }��@@@@��
� }���
� }��@@��
� }���
� }��@@��
� ~���
� ~��@��
� ~���
� ~��@���Р.do_start_proof��
� �cg�
� �cu@���%check������%Check��
� �c��
� �c�@A@��
� �c��
� �c�@@����'NoCheck��
� �c��
� �c�@A@��
� �c��
� �c�@@@@@��
� �c�
� �c�@@@��@����%state��
� �c��
� �c�@@��
� �c��
� �c�@@@����%state��
� ����
� ���@@��
� ����
� ���@@@��
� �c��
� ���@@@��
� �cx�
� ���@@@@���
o���@@ ���@@ �A�������	f Start a proof : initialize the prover state and set
 * prover_state regarding to a given `Check mode ��
� ����
� �/b@@��
� ����
� �/b@@@@��
� ����
� �/b@@��
� ����
� �/b@@��
� �cc�
� ���@��
� �cc�
� ���@���Р+do_add_goal��
� ����
� ���@��@����%state�� ����	 ���@@�� ���� ���@@@��@�����(Location'located�� ��� ��@�������$Goal&Parsed!t��$ ����% �� @@��' ����( �� @@@@��* ����+ ��@@@����%state��2 ��3 �@@��5 ��6 �@@@��8 ����9 �@@@��; ����< �@@@@���
հ�@@ ��@@ �A�������	( Add given parsed goal and print it out ��L ����M ���@@��O ����P ���@@@@��R ����S ���@@��U ����V ���@@��X ����Y �@��[ ����\ �@���Р-do_set_option��d �X\�e �Xi@��@����%state��n �Xl�o �Xq@@��q �Xl�r �Xq@@@��@�����&Config+p_set_param��} �Xu�~ �X�@@��� �Xu�� �X�@@@����%state��� �X��� �X�@@��� �X��� �X�@@@��� �Xu�� �X�@@@��� �Xl�� �X�@@@@���+��j@@ ��k@@ �A�������	4 set param/option from Config (Alias for set_param) ��� ��� �W@@��� ��� �W@@@@��� ��� �W@@��� ��� �W@@��� �XX�� �X�@��� �XX�� �X�@���Р&do_qed��� ����� ���@��@����%state��� ����� ���@@��� ����� ���@@@����%state��� ���� ��@@��� ���� ��@@@��� ����� ��@@@@���o���@@ ���@@ �A�������	T Complete the proofs, resetting the current goal to None and
 * print exiting proof ��� ����� ���@@��� ����� ���@@@@��� ����� ���@@��� ����� ���@@��� ����� ��@��� ����� ��@���Р(do_decls��� �NR�� �NZ@��@����%state�� �N]�	 �Nb@@�� �N]� �Nb@@@��@�����$Decl,declarations�� �Nf� �Nw@@�� �Nf� �Nw@@@����%state��" �N{�# �N�@@��% �N{�& �N�@@@��( �Nf�) �N�@@@��+ �N]�, �N�@@@@���Ű�@@ ��@@ �A�������	? Add declarations to the table and print new proof obligations ��< �		�= �	M@@��? �		�@ �	M@@@@��B �		�C �	M@@��E �		�F �	M@@��H �NN�I �N�@��K �NN�L �N�@���Р*do_command��T ����U ���@���)main_mode������%Stdin��b ����c ���@A@��e ����f ���@@����$File��m ����n ���@@�����&string��v ����w ���@@��y ����z ���@@@@��| ����} ���@@@@@�� ����� ���@@@���*file_stack����$list��� ��
�� ��@������&Driver$file��� ����� ��	@@��� ����� ��	@@@@��� ����� ��@@@���$test����$bool��� ���� ��@@��� ���� ��@@@���%check������%Check��� ��(�� ��.@A@��� ��(�� ��.@@����'NoCheck��� ��1�� ��9@A@��� ��1�� ��9@@@@@��� ��'�� ��:@@@��@����%state��� ��>�� ��C@@��� ��>�� ��C@@@��@�����&Driver$file��� �GI�� �GT@@��� �GI�� �GT@@@��@�����)ProverLib%input��� �GX�� �Gg@@��� �GX�� �Gg@@@����%state��� �Gk�� �Gp@@��  �Gk� �Gp@@@�� �GX� �Gp@@@�� �GI� �Gp@@@��	 ��>�
 �Gp@@@�� �� � �Gp@@@�� ��� �Gp@@@�� ���� �Gp@@@�� ���� �Gp@@@@�������@@ ���@@ �A�������	/ Evaluate the given input and return new state ��& ����' ���@@��) ����* ���@@@@��, ����- ���@@��/ ����0 ���@@��2 ����3 �Gp@��5 ����6 �Gp@���Р,exec_command��> ����? ���@���%check������%Check��L ����M ���@A@��O ����P ���@@����'NoCheck��W ����X ���@A@��Z ����[ ���@@@@@��] ����^ ���@@@���$test����$bool��i ����j ���@@��l ����m ���@@@��@����&string��v ����w ���@@��y ����z ���@@@��@����%state��� ����� ���@@��� ����� ���@@@����%state��� ����� ��@@��� ����� ��@@@��� ����� ��@@@��� ����� ��@@@��� ����� ��@@@��� ����� ��@@@@���7��v@@ ��w@@ �A�������	1 Execute the given sentence and return new state ��� �rr�� �r�@@��� �rr�� �r�@@@@��� �rr�� �r�@@��� �rr�� �r�@@��� ����� ��@��� ����� ��@���Р(exec_all��� �:>�� �:F@���%check������%Check��� �:Q�� �:W@A@��� �:Q�� �:W@@����'NoCheck��� �:Z�� �:b@A@��� �:Z�� �:b@@@@@��� �:P�� �:c@@@���$test����$bool��� �:m�� �:q@@��� �:m�� �:q@@@��@����%state��� �:u�� �:z@@�� �:u� �:z@@@��@����&string�� �{�� �{�@@�� �{�� �{�@@@����%state�� �{�� �{�@@�� �{�� �{�@@@�� �{�� �{�@@@�� �:u�  �{�@@@��" �:g�# �{�@@@��% �:I�& �{�@@@@�������@@ ���@@ �A�������	/ Execute the given string and return new state ��6 ��7 �9@@��9 ��: �9@@@@��< ��= �9@@��? ��@ �9@@��B �::�C �{�@��E �::�F �{�@���Р#run��N ����O ���@���$test����$bool��Z ����[ ���@@��] ����^ ���@@@��@����&string��g ����h ���@@��j ����k ���@@@����$unit��r ����s ���@@��u ����v ���@@@��x ����y ���@@@��{ ����| ���@@@@�����T@@ ��U@@ �A�������= Run the given squirrel file ��� ����� ���@@��� ����� ���@@@@��� ����� ���@@��� ����� ���@@��� ����� ���@��� ����� ���@@