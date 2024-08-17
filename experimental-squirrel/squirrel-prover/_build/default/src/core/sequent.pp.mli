Caml1999N033����            4src/core/sequent.mli����  ,�  �  �  ̠����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������	@ Extending sequents with functionalities based on proved goals. ��4src/core/sequent.mliA@@�A@ E@@��A@@�A@ E@@@@��A@@�A@ E@@��
A@@�A@ E@��A@@�A@ E@������"Sv��C G N�C G P@�����$Vars"Sv��!C G S�"C G Z@��$C G S�%C G Z@@@��'C G G�(C G Z@��*C G G�+C G Z@������$Mvar��4D [ b�5D [ f@�����%Match$Mvar��>D [ i�?D [ s@��AD [ i�BD [ s@@@��DD [ [�ED [ s@��GD [ [�HD [ s@������"SE��QE t {�RE t }@����*SystemExpr��YE t ��ZE t �@��\E t ��]E t �@@@��_E t t�`E t �@��bE t t�cE t �@������"PT��lH � ��mH � �@�����A�  # �!t��xK;B�yK;C@@@��Р&system���LHL��LHR@@�����"SE'context���LHU��LH_@@���LHU��LH_@@@���LHL��LH`@@�Р$args���Mae��Mai@@����$list���Ma���Ma�@���������$Vars#var���Mao��Maw@@���Mao��Maw@@@�������$Vars#Tag!t���Maz��Ma�@@���Maz��Ma�@@@@���Mao��Ma�@@@@���Man��Ma�@@@���Mae��Ma�@���)ocaml.doc���@@ ���@@ �A�������	' in reversed order w.r.t. introduction ���N����N��@@���N����N��@@@@���N����N��@@���N����N��@@�Р"mv���P����P��@@�����$Mvar!t���P����P��@@���P����P��@@@���P����P��@@�Р%subgs��Q���Q��@@����$list��
Q���Q��@������%Equiv(any_form��Q���Q��@@��Q���Q��@@@@��Q���Q��@@@��Q���Q��@@�Р$form��%R���&R��@@�����%Equiv(any_form��/R��0R�@@��2R��3R�@@@��5R���6R�@@@A@���l��@@ ��@@ �A�������	O A proof-term conclusion.
      For now, we do not keep the proof-term itself. ��FI � ��GJ:@@��II � ��JJ:@@@@��LI � ��MJ:@@��OI � ��PJ:@@��RK;=�SS@@��UK;=�VS@���Р"pp��^U�_U@��@�����&Format)formatter��jU&�kU6@@��mU&�nU6@@@��@����!t��wU:�xU;@@��zU:�{U;@@@����$unit���U?��UC@@���U?��UC@@@���U:��UC@@@���U&��UC@@@@@���U��UC@���U��UC@���Р&pp_dbg���VDJ��VDP@��@�����&Format)formatter���VDS��VDc@@���VDS��VDc@@@��@����!t���VDg��VDh@@���VDg��VDh@@@����$unit���VDl��VDp@@���VDl��VDp@@@���VDg��VDp@@@���VDS��VDp@@@@@���VDF��VDp@���VDF��VDp@@���H � ���Wqt@@@���H � ���Wqt@���H � ���Wqt@���Р+pt_try_cast���\#'��\#2@���&failed��@����$unit���]5?��]5C@@���]5?��]5C@@@�����"PT!t���]5G��]5K@@���]5G��]5K@@@�� ]5?�]5K@@@��@�����%Equiv&f_kind��^PU�^Pa@���!a��^PR�^PT@@@@��^PR�^Pa@@@��@�����"PT!t��"_fh�#_fl@@��%_fh�&_fl@@@�����"PT!t��/_fp�0_ft@@��2_fp�3_ft@@@��5_fh�6_ft@@@��8^PR�9_ft@@@��;]57�<_ft@@@@���r��@@ ��@@ �A�������	_ Try to cast [pt_f] as a [kind] proof-term conclusion. 
    Raise [failed] in case of failure. ��LZ���M[�"@@��OZ���P[�"@@@@��RZ���S[�"@@��UZ���V[�"@@��X\##�Y_ft@��[\##�\_ft@���A�  # �$ghyp��ec�fc@@@@A�������#Hyp��pc�qc@@������%Ident!t��{c�|c @@��~c�c @@@@���c��c @@����%Lemma���c#��c)@@�����&string���c-��c3@@���c-��c3@@@@���c#��c3@@@@@���c��c5@@@���Ұ�t@@ ��u@@ �A�������	? Generalized hypothesis: hypothesis or lemma/axiom identifier. ���b����b�@@���b����b�@@@@���b����b�@@���b����b�@@���c��c5@@���c��c5@�����!S���fs��fs�@������������*LowSequent!S���g����g��@���g����g��@@���g����g��@@���g����g��@������&Reduce���k��k@�������)Reduction!S���k��k#@���k��k#@@����!t���k.� k/@  # ���k.�k/@@@@A�����!t��k3�k4@@��k3�k4@@@@��k)�k4@@��k�k4@@���M���@@ ���@@ �A�������5 reduction functions ��'j���(j�@@��*j���+j�@@@@��-j���.j�@@��0j���1j�@@��3k�4k4@��6k�7k4@���Р-is_assumption��?o���@o��@��@�����&Theory%lsymb��Ko���Lo��@@��No���Oo��@@@��@����!t��Xo���Yo��@@��[o���\o��@@@����$bool��co���do��@@��fo���go��@@@��io���jo��@@@��lo���mo��@@@@������E@@ ��F@@ �A�������	A An assumption can be an hypothesis, an axiom, or a proved goal. ��}n���~n��@@���n����n��@@@@���n����n��@@���n����n��@@���o����o��@���o����o��@���Р4is_global_assumption���p ��p @��@�����&Theory%lsymb���p ��p )@@���p ��p )@@@��@����!t���p -��p .@@���p -��p .@@@����$bool���p 2��p 6@@���p 2��p 6@@@���p -��p 6@@@���p ��p 6@@@@@���p ��p 6@���p ��p 6@���Р3is_local_assumption���q7=��q7P@��@�����&Theory%lsymb���q7T��q7`@@���q7T��q7`@@@��@����!t���q7d��q7e@@���q7d��q7e@@@����$bool���q7i��q7m@@���q7i��q7m@@@���q7d��q7m@@@���q7T��q7m@@@@@��q79�q7m@��q79�q7m@���Р2to_general_sequent��t���t��@��@����!t��t���t��@@��t���t��@@@�����$Goal!t��$t���%t��@@��'t���(t��@@@��*t���+t��@@@@@��-t���.t��@��0t���1t��@���Р1to_global_sequent��9yu{�:yu�@��@����!t��Cyu��Dyu�@@��Fyu��Gyu�@@@�����/LowEquivSequent!t��Pyu��Qyu�@@��Syu��Tyu�@@@��Vyu��Wyu�@@@@������/@@ ��0@@ �A�������	� Transform any sequent into a global sequent. Drop local
      hypotheses that no longer apply.
      Conclusion defaults to [Equiv.False]. ��gv���hxFt@@��jv���kxFt@@@@��mv���nxFt@@��pv���qxFt@@��syuw�tyu�@��vyuw�wyu�@���Р.convert_pt_gen�� A���� A�	@���3check_compatibility����$bool��� B		�� B		"@@��� B		�� B		"@@@���*close_pats����$bool��� C	&	6�� C	&	:@@��� C	&	6�� C	&	:@@@��@�����&Theory"pt��� D	>	B�� D	>	K@@��� D	>	B�� D	>	K@@@��@����!t��� E	P	T�� E	P	U@@��� E	P	T�� E	P	U@@@�������$ghyp��� F	Y	]�� F	Y	a@@��� F	Y	]�� F	Y	a@@@������$Type%tvars��� F	Y	d�� F	Y	n@@��� F	Y	d�� F	Y	n@@@������"PT!t��� F	Y	q�� F	Y	u@@��� F	Y	q�� F	Y	u@@@@��� F	Y	]�� F	Y	u@@@��� E	P	T�� F	Y	u@@@��� D	>	B�� F	Y	u@@@��� C	&	*�� F	Y	u@@@��� B		
�� F	Y	u@@@@���)���@@ ���@@ �A�������	� Convert a parsed proof term into a proof-term.
      If [close_pats] is [false], pattern variables that cannot be
      inferred remains (default to [true]).
      Also return the head of the proof term as a [ghyp], and
      subgoals to prove. ��|��� @��@@��|��� @��@@@@��	|���
 @��@@��|��� @��@@�� A��� F	Y	u@�� A��� F	Y	u@���Р*convert_pt�� J	�	�� J	�	�@���*close_pats����$bool��' K	�	��( K	�	�@@��* K	�	��+ K	�	�@@@��@�����&Theory"pt��6 L

�7 L

@@��9 L

�: L

@@@��@����!t��C M

�D M

@@��F M

�G M

@@@�������$ghyp��Q N

 �R N

$@@��T N

 �U N

$@@@������$Type%tvars��_ N

'�` N

1@@��b N

'�c N

1@@@������"PT!t��m N

4�n N

8@@��p N

4�q N

8@@@@��s N

 �t N

8@@@��v M

�w N

8@@@��y L

�z N

8@@@��| K	�	��} N

8@@@@������U@@ ��V@@ �A�������	W Same as [convert_pt_gen], when the system is the current system of
      the sequent. ��� H	w	y�� I	�	�@@��� H	w	y�� I	�	�@@@@��� H	w	y�� I	�	�@@��� H	w	y�� I	�	�@@��� J	�	��� N

8@��� J	�	��� N

8@@���fs��� O
9
<@@���ְ�x@@ ��y@@ �A�������	6 Sequents with functionalities based on proved goals. ���e77��e7r@@���e77��e7r@@@@���e77��e7r@@���e77��e7r@@���fss�� O
9
<@���fss�� O
9
<@�����&MkArgs��� R
�
��� R
�
�@���������!S��� S
�
��� S
�
�@�����*LowSequent!S��� S
�
��� S
�
�@��� S
�
��� S
�
�@@@��� S
�
��� S
�
�@��� S
�
��� S
�
�@���Р2to_general_sequent��� U
�
��� U
�
�@��@�����!S!t��� U
�
��� U
�
�@@��  U
�
�� U
�
�@@@�����$Goal!t��
 U
�
�� U
�
�@@�� U
�
�� U
�
�@@@�� U
�
�� U
�
�@@@@@�� U
�
�� U
�
�@�� U
�
�� U
�
�@���Р1to_global_sequent�� V
�
��  V
�
�@��@�����!S!t��+ V
�
��, V
� @@��. V
�
��/ V
� @@@�����/LowEquivSequent!t��8 V
��9 V
�@@��; V
��< V
�@@@��> V
�
��? V
�@@@@@��A V
�
��B V
�@��D V
�
��E V
�@@��G R
�
��H W@@@��J R
�
��K W@��M R
�
��N W@������"Mk��W ZZa�X ZZc@�����$Args��` ZZe�a ZZi@����&MkArgs��h ZZl�i ZZr@��k ZZl�l ZZr@@������!S��u ZZv�v ZZw@��x ZZv�y ZZw@@����!t��� [}��� [}�@  # ���� [}��� [}�@@@@A�������$Args!S!t��� [}��� [}�@@��� [}��� [}�@@@@��� [}�� [}�@����)conc_form��� \���� \��@  # ���� \���� \��@@@@A�������$Args!S)conc_form��� \���� \��@@��� \���� \��@@@@��� \���� \��@����(hyp_form��� ]���� ]��@  # ���� ]���� ]��@@@@A�������$Args!S(hyp_form��� ]���� ]��@@��� ]���� ]��@@@@��� ]���� ]��@@��� ZZv�� ]��@@��� ZZd�� ]��@@������@@ ���@@ �A�������	9 Functor building a {!Sequent.S} from a {!LowSequent.S}. ��� Y�� YY@@��� Y�� YY@@@@��� Y�� YY@@��� Y�� YY@@��� ZZZ�� ]��@��� ZZZ�� ]��@@