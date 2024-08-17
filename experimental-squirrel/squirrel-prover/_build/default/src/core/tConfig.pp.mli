Caml1999N033����            4src/core/tConfig.mli����  %  m  C  e�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������	G {1 Config Table} 
    Manipulation of Squirrel settings in the table. ��4src/core/tConfig.mliA@@�BV L@@��A@@�BV L@@@@��A@@�BV L@@��
A@@�BV L@��A@@�BV L@���Р,reset_params��E � ��E � �@��@�����'Symbols%table��"E � ��#E � �@@��%E � ��&E � �@@@�����'Symbols%table��/E � ��0E � �@@��2E � ��3E � �@@@��5E � ��6E � �@@@@���)ocaml.doc��@@ ��@@ �A�������	9 Reset all setting to their default values in the table. ��GD N N�HD N �@@��JD N N�KD N �@@@@��MD N N�ND N �@@��PD N N�QD N �@@��SE � ��TE � �@��VE � ��WE � �@���Р)set_param��_H � ��`H � �@��@�������&string��lH � ��mH � �@@��oH � ��pH � �@@@������&Config+p_param_val��zH � �{H �@@��}H � �~H �@@@@���H � ���H �@@@��@�����'Symbols%table���H ���H �$@@���H ���H �$@@@�����'Symbols%table���H �(��H �5@@���H �(��H �5@@@���H ���H �5@@@���H � ���H �5@@@@���m��{@@ ��|@@ �A�������	  Change a setting in the table. ���G � ���G � �@@���G � ���G � �@@@@���G � ���G � �@@���G � ���G � �@@���H � ���H �5@���H � ���H �5@�����ְ��@@ ���@@ �A�������7 {2 Look-up functions} ���J77��J7S@@���J77��J7S@@@@���J77��J7S@@���J77��J7S@���J77��J7S@���Р.solver_timeout���M����M��@��@�����'Symbols%table���M����M��@@���M����M��@@@����#int��M���M��@@��M���M��@@@��M���M��@@@@���Ұ��@@ ���@@ �A�������	C Timeout for the solvers (completion.ml and constr.ml) in seconds. ��LUU�LU�@@��LUU�LU�@@@@��LUU�LU�@@��!LUU�"LU�@@��$M���%M��@��'M���(M��@���Р,vint_timeout��0Q9=�1Q9I@����#int��8Q9L�9Q9O@@��;Q9L�<Q9O@@@@�����@@ ��@@ �A�������	j Default value for [solver_timeout],
    used by functions which do not have access to the table for now. ��LO���MP�8@@��OO���PP�8@@@@��RO���SP�8@@��UO���VP�8@@��XQ99�YQ9O@��[Q99�\Q9O@���Р3print_trs_equations��dT{�eT{�@��@�����'Symbols%table��pT{��qT{�@@��sT{��tT{�@@@����$bool��{T{��|T{�@@��~T{��T{�@@@���T{���T{�@@@@���L��Z@@ ��[@@ �A�������	$ Print equations of the TRS system. ���SQQ��SQz@@���SQQ��SQz@@@@���SQQ��SQz@@���SQQ��SQz@@���T{{��T{�@���T{{��T{�@���Р+interactive���W����W��@��@�����'Symbols%table���W����W��@@���W����W��@@@����$bool���W� ��W�@@���W� ��W�@@@���W����W�@@@@�������@@ ���@@ �A�������	+ Get boolean setting for interactive mode. ���V����V��@@���V����V��@@@@���V����V��@@���V����V��@@���W����W�@���W����W�@���Р-s_interactive���[X\��[Xi@����&string���[Xl��[Xr@@���[Xl��[Xr@@@@���ư��@@ ���@@ �A�������	L Name of the setting for interactive mode,
    to be used with [set_param]. ��Y�Z4W@@��Y�Z4W@@@@��Y�Z4W@@��Y�Z4W@@��[XX�[Xr@��[XX�[Xr@���Р,checkInclude��$^���%^��@��@�����'Symbols%table��0^���1^��@@��3^���4^��@@@����$bool��;^���<^��@@��>^���?^��@@@��A^���B^��@@@@�����@@ ��@@ �A�������	0 Setting for checking proofs in included files. ��R]tt�S]t�@@��U]tt�V]t�@@@@��X]tt�Y]t�@@��[]tt�\]t�@@��^^���_^��@��a^���b^��@���Р,debug_constr��ja	�ka	@��@�����'Symbols%table��va	�wa	)@@��ya	�za	)@@@����$bool���a	-��a	1@@���a	-��a	1@@@���a	��a	1@@@@���R��`@@ ��a@@ �A�������	/ Debug information for the constraint checker. ���`����`�@@���`����`�@@@@���`����`�@@���`����`�@@���a		��a	1@���a		��a	1@���Р0debug_completion���dhl��dh|@��@�����'Symbols%table���dh��dh�@@���dh��dh�@@@����$bool���dh���dh�@@���dh���dh�@@@���dh��dh�@@@@�������@@ ���@@ �A�������	/ Debug information for the completion checker. ���c33��c3g@@���c33��c3g@@@@���c33��c3g@@���c33��c3g@@���dhh��dh�@���dhh��dh�@���Р-debug_tactics���g����g��@��@�����'Symbols%table��g���g��@@��g���g��@@@����$bool��g���g��@@��g���g��@@@��g���g��@@@@���ް��@@ ���@@ �A�������	  Debug information for tactics. ��$f���%f��@@��'f���(f��@@@@��*f���+f��@@��-f���.f��@@��0g���1g��@��3g���4g��@���Р1strict_alias_mode��<j�=j$@��@�����'Symbols%table��Hj'�Ij4@@��Kj'�Lj4@@@����$bool��Sj8�Tj<@@��Vj8�Wj<@@@��Yj'�Zj<@@@@���$��2@@ ��3@@ �A�������	" Strict alias mode for processus. ��ji���ki�@@��mi���ni�@@@@��pi���qi�@@��si���ti�@@��vj�wj<@��yj�zj<@���Р5show_strengthened_hyp���mim��mi�@��@�����'Symbols%table���mi���mi�@@���mi���mi�@@@����$bool���mi���mi�@@���mi���mi�@@@���mi���mi�@@@@���j��x@@ ��y@@ �A�������	% Show hypothesis after strengthening ���l>>��l>h@@���l>>��l>h@@@@���l>>��l>h@@���l>>��l>h@@���mii��mi�@���mii��mi�@���Р*auto_fadup���p����p��@��@�����'Symbols%table���p����p��@@���p����p��@@@����$bool���p����p��@@���p����p��@@@���p����p��@@@@�������@@ ���@@ �A�������3 Automatic FA Dup. ���o����o��@@���o����o��@@@@���o����o��@@���o��� o��@@��p���p��@��p���p��@���Р'new_ind��s	�s	@��@�����'Symbols%table��s	�s	$@@��s	�s	$@@@����$bool��%s	(�&s	,@@��(s	(�)s	,@@@��+s	�,s	,@@@@������@@ ��@@ �A�������	& New equivalence induction principle. ��<r���=r�@@��?r���@r�@@@@��Br���Cr�@@��Er���Fr�@@��Hs		�Is	,@��Ks		�Ls	,@���Р,post_quantum��TvMQ�UvM]@��@�����'Symbols%table��`vM`�avMm@@��cvM`�dvMm@@@����$bool��kvMq�lvMu@@��nvMq�ovMu@@@��qvM`�rvMu@@@@���<��J@@ ��K@@ �A�������9 Post-quantum soundness. ���u..��u.L@@���u..��u.L@@@@���u..��u.L@@���u..��u.L@@���vMM��vMu@���vMM��vMu@@