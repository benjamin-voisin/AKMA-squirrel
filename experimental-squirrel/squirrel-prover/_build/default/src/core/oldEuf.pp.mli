Caml1999N033����            3src/core/oldEuf.mli����  �  B  �  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ��A�  # �*euf_schema��3src/core/oldEuf.mliJ���J��@@@��Р+action_name��	K���
K��@@�����'Symbols&action��K���K��@@��K���K��@@@��K���K��@@�Р&action�� L���!L��@@�����&Action(action_v��*L��+L�@@��-L��.L�@@@��0L���1L�@@�Р'message��7M�8M @@�����$Term$term��AM(�BM1@@��DM(�EM1@@@��GM�HM2@@�Р+key_indices��NN35�ON3@@@�����$Term%terms��XN3D�YN3N@@��[N3D�\N3N@@@��^N35�_N3O@@�Р#env��eOPR�fOPU@@�����$Vars#env��oOPa�pOPi@@��rOPa�sOPi@@@��uOPR�vOPi@@@A@���)ocaml.doc��E@@ ��F@@ �A�������
   Type of an euf axiom case schema.
    [e] of type [euf_schema] represents the fact that the message [e.message]
    has been hashed.
    [e.action] stores the relevant action for future use,
    with fresh indices where relevant (i.e. for indices other than the
    key's indices).  ���D � ���I��@@���D � ���I��@@@@���D � ���I��@@���D � ���I��@@���J����Pkl@@���J����Pkl@���Р-pp_euf_schema���Sos��So�@��@�����&Format)formatter���So���So�@@���So���So�@@@��@����*euf_schema���So���So�@@���So���So�@@@����$unit���So���So�@@���So���So�@@@���So���So�@@@���So���So�@@@@@���Soo��So�@���Soo��So�@���A�  # �*euf_direct���Y����Y��@@@��Р-d_key_indices���Z����Z��@@�����$Term%terms���Z����Z��@@���Z����Z��@@@���Z����Z��@@�Р)d_message���[����[��@@�����$Term$term��[���[��@@��[���	[��@@@��[���[��@@@A@�������@@ ���@@ �A�������	� Type of a direct euf axiom case.
    [e] of type [euf_case] represents the fact that the message [e.m]
    has been hashed, and the key indices were [e.eindices]. ��V���X]�@@��V��� X]�@@@@��"V���#X]�@@��%V���&X]�@@��(Y���)\��@@��+Y���,\��@���Р-pp_euf_direct��4^���5^��@��@�����&Format)formatter��@^���A^�@@��C^���D^�@@@��@����*euf_direct��M^��N^�@@��P^��Q^�@@@����$unit��X^� �Y^�$@@��[^� �\^�$@@@��^^��_^�$@@@��a^���b^�$@@@@@��d^���e^�$@��g^���h^�$@���A�  # �(euf_rule��qf���rf��@@@��Р$hash��yg���zg��@@�����'Symbols%fname���g����g��@@���g����g��@@@���g����g��@@�Р#key���h����h��@@��������'Symbols$name���h����h��@@���h����h��@@@������$Term%terms���h����h��@@���h����h��@@@@���h����h��@@@���h����h��@@�Р-case_schemata���i����i��@@����$list���i���i�
@�����*euf_schema���i����i�@@���i����i�@@@@���i����i�
@@@���i����i�@@�Р,cases_direct���j��j@@����$list���j(��j,@�����*euf_direct���j��j'@@���j��j'@@@@���j��j,@@@���j��j,@@@A@�������@@ ���@@ �A�������
   Type of an euf axiom rule:
    - [hash] stores the hash function name.
    - [key] stores the key considered in this rule.
    - [case_schemata] is the list (seen as a disjunction) of case schemata.
    - [cases_direct] is the list (seen as a disjunction) of direct cases. ��amm�e8�@@��
amm�e8�@@@@��amm�e8�@@��amm�e8�@@��f���k./@@��f���k./@���Р+pp_euf_rule��m15� m1@@��@�����&Format)formatter��+m1C�,m1S@@��.m1C�/m1S@@@��@����(euf_rule��8m1W�9m1_@@��;m1W�<m1_@@@����$unit��Cm1c�Dm1g@@��Fm1c�Gm1g@@@��Im1W�Jm1g@@@��Lm1C�Mm1g@@@@@��Om11�Pm1g@��Rm11�Sm1g@���Р'key_ssc��[sEI�\sEP@���'globals����$bool��gtS]�htSa@@��jtS]�ktSa@@@���(messages����$list��vue|�wue�@������$Term$term���uer��ue{@@���uer��ue{@@@@���uer��ue�@@@���%elems�����%Equiv%equiv���v����v��@@���v����v��@@@���/allow_functions��@�����'Symbols%fname���w����w��@@���w����w��@@@����$bool���w����w��@@���w����w��@@@���w����w��@@@���%cntxt�����&Constr+trace_cntxt���x����x��@@���x����x��@@@��@�����'Symbols%fname���y����y��@@���y����y��@@@��@�����'Symbols$name���y����y�@@���y����y�@@@����$list���y���y�!@������'Tactics)ssc_error���y���y�@@���y���y�@@@@��y��y�!@@@��y���y�!@@@��y���y�!@@@��
x���y�!@@@��w���y�!@@@��v���y�!@@@��ueg�y�!@@@��tSU�y�!@@@@�������@@ ���@@ �A�������	� Check the syntactic side conditions of the key in the protocol and
    the messages.
    When [global] is true, also checks in global macros. ��'p���(r	D@@��*p���+r	D@@@@��-p���.r	D@@��0p���1r	D@@��3sEE�4y�!@��6sEE�7y�!@���Р'mk_rule��?	N	R�@	N	Y@���%elems�����%Equiv%equiv��M @	\	d�N @	\	o@@��P @	\	d�Q @	\	o@@@���)drop_head����$bool��\ A	s	�] A	s	�@@��_ A	s	�` A	s	�@@@���,fun_wrap_key����&option��k B	�	��l B	�	�@���@�����'Symbols%fname��x B	�	��y B	�	�@@��{ B	�	��| B	�	�@@@����$bool��� B	�	��� B	�	�@@��� B	�	��� B	�	�@@@��� B	�	��� B	�	�@@@@��� B	�	��� B	�	�@@@���/allow_functions��@�����'Symbols%fname��� C	�	��� C	�	�@@��� C	�	��� C	�	�@@@����$bool��� C	�	��� C	�	�@@��� C	�	��� C	�	�@@@��� C	�	��� C	�	�@@@���%cntxt�����&Constr+trace_cntxt��� D	�	��� D	�
@@��� D	�	��� D	�
@@@���#env�����#Env!t��� E

�� E

@@��� E

�� E

@@@���$mess�����$Term$term��� E

�� E

"@@��� E

�� E

"@@@���$sign�����$Term$term��� E

+�� E

4@@��� E

+�� E

4@@@���'head_fn�����'Symbols%fname��� F
8
B�  F
8
O@@�� F
8
B� F
8
O@@@���%key_n�����'Symbols$name�� F
8
Y� F
8
e@@�� F
8
Y� F
8
e@@@���&key_is�����$Term%terms��! F
8
p�" F
8
z@@��$ F
8
p�% F
8
z@@@����(euf_rule��, F
8
~�- F
8
�@@��/ F
8
~�0 F
8
�@@@��2 F
8
i�3 F
8
�@@@��5 F
8
S�6 F
8
�@@@��8 F
8
:�9 F
8
�@@@��; E

&�< F
8
�@@@��> E

�? F
8
�@@@��A E

�B F
8
�@@@��D D	�	��E F
8
�@@@��G C	�	��H F
8
�@@@��J B	�	��K F
8
�@@@��M A	s	u�N F
8
�@@@��P @	\	^�Q F
8
�@@@@���۰�@@ �� @@ �A�������	� [mk_rule proc head_fn key_n] create the euf rule associated to an given head
   function and key in a process.  If drop_head is true, the message stored do
   not contain anymore the head_fn function, else they still do. ��a|jj�b~	
	M@@��d|jj�e~	
	M@@@@��g|jj�h~	
	M@@��j|jj�k~	
	M@@��m	N	N�n F
8
�@��p	N	N�q F
8
�@@