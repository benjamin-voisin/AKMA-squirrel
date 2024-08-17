Caml1999N033����            5src/core/highTerm.mli����  �  -  �  &�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������	) Module build on top of [Term] and [Env] ��5src/core/highTerm.mliA@@�A@n@@��A@@�A@n@@@@��A@@�A@n@@��
A@@�A@n@��A@@�A@n@������"SE��Cpw�Cpy@����*SystemExpr��Cp|� Cp F@��"Cp|�#Cp F@@@��%Cpp�&Cp F@��(Cpp�)Cp F@����������$Term��6F � ��7F � �@��9F � ��:F � �@@��<F � ��=F � �@@��?F � ��@F � �@@��BF � ��CF � �@������%Smart��LH � ��MH � �@�������'SmartFO!S��XH � ��YH � �@��[H � ��\H � �@@����$form��cH � ��dH � �@  # ���hH � ��iH � �@@@@A������$Term$term��sH � ��tH � �@@��vH � ��wH � �@@@@��yH � ��zH � �@@��|H � ��}H � �@@@��H � ���H � �@���H � ���H � �@���Р/is_system_indep���M����M��@��@�����#Env!t���M����M��@@���M����M��@@@��@�����$Term$term���M����M��@@���M����M��@@@����$bool���M����M��@@���M����M��@@@���M����M��@@@���M����M��@@@@���)ocaml.doc���@@ ���@@ �A�������	x Check if a term semantics is independent of the system (among all 
    compatible systems, hence actions are allowed). ���K((��Lo�@@���K((��Lo�@@@@���K((��Lo�@@���K((��Lo�@@���M����M��@���M����M��@���Р0is_deterministic���Q04��Q0D@��@�����#Env!t���Q0G��Q0L@@���Q0G��Q0L@@@��@�����$Term$term���Q0P� Q0Y@@��Q0P�Q0Y@@@����$bool��
Q0]�Q0a@@��Q0]�Q0a@@@��Q0P�Q0a@@@��Q0G�Q0a@@@@���Y���@@ ���@@ �A�������	Q Check if a term represents a deterministic (i.e. 
    non-probabilistic) value. ��$O���%P/@@��'O���(P/@@@@��*O���+P/@@��-O���.P/@@��0Q00�1Q0a@��3Q00�4Q0a@���Р+is_constant��<U���=U��@��@�����#Env!t��HU���IU��@@��KU���LU��@@@��@�����$Term$term��WU���XU��@@��ZU���[U��@@@����$bool��bU���cU��@@��eU���fU��@@@��hU���iU��@@@��kU���lU��@@@@������D@@ ��E@@ �A�������	_ Check if a term represents a constant (i.e. 
    non-probabilistic and η-independent) value. ��|Scc�}T��@@��Scc��T��@@@@���Scc��T��@@���Scc��T��@@���U����U��@���U����U��@���Р2is_ptime_deducible���Yjn��Yj�@���"si����$bool���Z����Z��@@���Z����Z��@@@��@�����#Env!t���Z����Z��@@���Z����Z��@@@��@�����$Term$term���Z����Z��@@���Z����Z��@@@����$bool���Z����Z��@@���Z����Z��@@@���Z����Z��@@@���Z����Z��@@@���Z����Z��@@@@������@@ ���@@ �A�������	n Check if a term is deducible in ptime by an adversary with no direct 
    access to the protocol randomness. ���W����X@i@@���W����X@i@@@@���W����X@i@@���W����X@i@@���Yjj��Z��@���Yjj��Z��@���Р+tag_of_term���]����]��@��@�����#Env!t��
]���]��@@��]���]��@@@��@�����$Term$term��]���]��@@��]���]��@@@������$Vars#Tag!t��(]� �)]�
@@��+]� �,]�
@@@��.]���/]�
@@@��1]���2]�
@@@@���w��
@@ ��@@ �A�������	% Compute the tag satisfied by a term ��B\���C\��@@��E\���F\��@@@@��H\���I\��@@��K\���L\��@@��N]���O]�
@��Q]���R]�
@@