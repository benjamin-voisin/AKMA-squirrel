Caml1999N033����         	   <src/core/lowTraceSequent.mli����  (_  !  U  Ѡ����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������	� Sequents used to prove trace properties, aka reachability properties.

    This module implements {!LowSequent.S} with [type form = Term.term]. ��<src/core/lowTraceSequent.mliA@@�C K �@@��A@@�C K �@@@@��A@@�C K �@@��
A@@�C K �@��A@@�C K �@���A�  # �-trace_sequent��E � ��E � �@@@@A@@��E � ��E � �@@��E � ��E � �@�����������*LowSequent!S��-H � ��.H �	@��0H � ��1H �	@@����(hyp_form��8I
�9I
@  # ���=I
�>I
@@@@A������%Equiv(any_form��HI
!�II
/@@��KI
!�LI
/@@@@��NI
�OI
/@����)conc_form��VJ0<�WJ0E@  # ���[J0<�\J0E@@@@A������%Equiv*local_form��fJ0H�gJ0X@@��iJ0H�jJ0X@@@@��lJ07�mJ0X@����!t��tKYe�uKYf@  # ���yKYe�zKYf@@@@A�����-trace_sequent���KYi��KYv@@���KYi��KYv@@@@���KY`��KYv@@���H � ���KYv@@���H � ���KYv@@���H � ���KYv@��������l@@ ��m@@ �A�������	' {2 Sequent type and basic operations} ���N����N��@@���N����N��@@@@���N����N��@@���N����N��@���N����N��@���Р$init���P����P��@���/no_sanity_check����$bool���P�	��P�@@���P�	��P�@@@���#env�����#Env!t���P���P�@@���P���P�@@@��@�����$Term$term���P���P�'@@���P���P�'@@@����'sequent���P�+��P�2@@���P�+��P�2@@@���P���P�2@@@���P���P�2@@@���P����P�2@@@@@���P��� P�2@��P���P�2@���Р,sanity_check��Spt�Sp�@��@����-trace_sequent��Sp��Sp�@@��Sp��Sp�@@@����$unit�� Sp��!Sp�@@��#Sp��$Sp�@@@��&Sp��'Sp�@@@@���)ocaml.doc�� @@ ��@@ �A�������	4 Free variables + var env **toplevel** sanity check ��8R66�9R6o@@��;R66�<R6o@@@@��>R66�?R6o@@��AR66�BR6o@@��DSpp�ESp�@��GSpp�HSp�@���Р"pi��PX6:�QX6<@��@�����$Term$proj��\X6?�]X6H@@��_X6?�`X6H@@@��@����'sequent��iX6L�jX6S@@��lX6L�mX6S@@@����'sequent��tX6W�uX6^@@��wX6W�xX6^@@@��zX6L�{X6^@@@��}X6?�~X6^@@@@���W��V@@ ��W@@ �A�������	� Project diff-operators occurring in a sequent;
    only makes sense when a sequent for a bi-system has just
    been narrowed to a projected system. ���U����W
5@@���U����W
5@@@@���U����W
5@@���U����W
5@@���X66��X6^@���X66��X6^@��������x@@ ��y@@ �A�������	� {2 Automated reasoning}

    All these functions only consider local formula hypotheses.
    It could make sense to extend some of them in the future. ���[����^E@@���[����^E@@@@���[����^E@@���[����^E@���[����^E@���Р'get_trs���d%)��d%0@��@����'sequent���d%3��d%:@@���d%3��d%:@@@�����*Completion%state���d%>��d%N@@���d%>��d%N@@@���d%3��d%N@@@@�������@@ ���@@ �A�������	� [get_trs s] returns a term rewriting system that corresponds to the set of
    equalities between messages. It can be used to check if an equality is
    implied by the set of messages hypotheses. 
    May timeout. ���`GG��c$@@���`GG��c$@@@@���`GG��c$@@���`GG��c$@@���d%%� d%N@��d%%�d%N@���Р%query��gko�gkt@���'precise����$bool��gk�gk�@@��gk�gk�@@@��@����!t��$gk��%gk�@@��'gk��(gk�@@@��@������$Term#Lit(literals��5gk��6gk�@@��8gk��9gk�@@@����$bool��@gk��Agk�@@��Cgk��Dgk�@@@��Fgk��Ggk�@@@��Igk��Jgk�@@@��Lgkw�Mgk�@@@@���&��%@@ ��&@@ �A�������4 See [Constr.query] ��]fQQ�^fQj@@��`fQQ�afQj@@@@��cfQQ�dfQj@@��ffQQ�gfQj@@��igkk�jgk�@��lgkk�mgk�@������)Benchmark��vi���wi��@�����Р:register_query_alternative���t����t��@��@����&string���u����u��@@���u����u��@@@��@���'precise����$bool���u����u�@@���u����u�@@@��@����!t���u���u�@@���u���u�@@@��@����&option���u���u�$@�������$Term#Lit(literals���u���u�@@���u���u�@@@@���u���u�$@@@����$bool���u�(��u�,@@���u�(��u�,@@@���u���u�,@@@���u���u�,@@@���u����u�,@@@����$unit���u�1��u�5@@���u�1��u�5@@@���u����u�5@@@���u����u�5@@@@���Ȱ��@@ ���@@ �A�������
  � [register_query_alternative name f] adds an alternative method
        for solving queries (in a form that subsumes query and
        constraints_valid) which will be benchmarked against the default
        implementation.
        For each call to [query ~precise s q], [f ~precise s (Some q)]
        will be ran and timed and its result (including potential errors)
        will be logged.
        For each call to [constraints_valid s q], [f ~precise:true s None]
        will be similarly executed. ���k��� s��@@��k���s��@@@@��k���s��@@��k���	s��@@��t���u�5@��t���u�5@���Р,set_position��x{��x{�@��@����&string��!x{��"x{�@@��$x{��%x{�@@@����$unit��,x{��-x{�@@��/x{��0x{�@@@��2x{��3x{�@@@@�����@@ ��@@ �A�������	: Set position information for benchmark logging purposes. ��Cw7;�Dw7z@@��Fw7;�Gw7z@@@@��Iw7;�Jw7z@@��Lw7;�Mw7z@@��Ox{�Px{�@��Rx{�Sx{�@@��Ui���Vz��@@@��Xi���Yz��@��[i���\z��@���Р-query_happens��d|���e|��@���'precise����$bool��p|���q|��@@��s|���t|��@@@��@����!t��}|���~|��@@���|����|��@@@��@�����$Term$term���|����|��@@���|����|��@@@����$bool���|����|��@@���|����|��@@@���|����|��@@@���|����|��@@@���|����|��@@@@@���|����|��@���|����|��@���Р.eq_atoms_valid��� A		��� A		�@��@����'sequent��� A		��� A		�@@��� A		��� A		�@@@����$bool��� A		��� A		�@@��� A		��� A		�@@@��� A		��� A		�@@@@�������@@ ���@@ �A�������	� If [message_atoms_valid s] returns [true] then (dis)equalities over
    terms on both sides of the sequents make the sequent valid.
    May timeout. ���~���� @	k	~@@���~���� @	k	~@@@@���~���� @	k	~@@���~���� @	k	~@@��� A		�� A		�@��� A		�� A		�@���Р1constraints_valid��� G
j
n�� G
j
@��@����'sequent��  G
j
�� G
j
�@@�� G
j
�� G
j
�@@@����$bool�� G
j
�� G
j
�@@�� G
j
�� G
j
�@@@�� G
j
�� G
j
�@@@@������@@ ���@@ �A�������	� [constraints_valid s] returns true if constraints make the sequent valid,
    taking into account constraint trace formula hypotheses and atomic
    constraint conclusion.
    May timeout. ��" C	�	��# F
V
i@@��% C	�	��& F
V
i@@@@��( C	�	��) F
V
i@@��+ C	�	��, F
V
i@@��. G
j
j�/ G
j
�@��1 G
j
j�2 G
j
�@���Р1get_ts_equalities��: L�; L)@���'precise����$bool��F M,6�G M,:@@��I M,6�J M,:@@@��@����'sequent��S M,>�T M,E@@��V M,>�W M,E@@@����$list��^ M,T�_ M,X@������$Term%terms��i M,I�j M,S@@��l M,I�m M,S@@@@��o M,I�p M,X@@@��r M,>�s M,X@@@��u M,.�v M,X@@@@���O��N@@ ��O@@ �A�������	z [get_ts_equalities s] returns all the equalities between timestamps
    derivable from its hypothesis. 
    May timeout. ��� I
�
��� K @@��� I
�
��� K @@@@��� I
�
��� K @@��� I
�
��� K @@��� L�� M,X@��� L�� M,X@���Р-maximal_elems��� R� �� R�@���'precise����$bool��� S�� S@@��� S�� S@@@��@����'sequent��� S#�� S*@@��� S#�� S*@@@��@�����$Term%terms��� S.�� S8@@��� S.�� S8@@@�����$Term%terms��� T=?�� T=I@@��� T=?�� T=I@@@��� S.�� T=I@@@��� S#�� T=I@@@��� S�� T=I@@@@�������@@ ���@@ �A�������	� [maximal_elems s ts] returns the maximal elements of the timestamps,
    according to their ordering derived from the hypothesis in [s]. 
    May timeout. ��� OZZ�� Q��@@��� OZZ�� Q��@@@@��� OZZ�� Q��@@��� OZZ�� Q��@@��� R���� T=I@��� R���  T=I@���Р0get_all_messages�� X���	 X��@��@����'sequent�� X��� X��@@�� X��� X��@@@�����$Term%terms�� X���  X��@@��" X���# X��@@@��% X���& X��@@@@�������@@ ���@@ �A�������	Q [get_all_messages s] returns all the messages appearing at toplevel
    in [s]. ��6 VLL�7 W��@@��9 VLL�: W��@@@@��< VLL�= W��@@��? VLL�@ W��@@��B X���C X��@��E X���F X��@@