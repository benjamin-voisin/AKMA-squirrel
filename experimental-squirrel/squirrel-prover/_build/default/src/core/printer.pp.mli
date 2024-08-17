Caml1999N033����            4src/core/printer.mli����  1k  \  "|  !Z�����1ocaml.ppx.context��&_none_@@ �A����������)tool_name���*ppx_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����"::�����������,inline_tests�@�@@����'enabled��.<command-line>A@A�A@H@@��A@@�A@I@@@@�@@����������������,library-name�@�@@����,squirrelcore��A@A�A@M@@��A@@� A@N@@@@�@@�������@�@@@�@@�@@@�@@�@@@@�@@@�@� ����*ocaml.text���@@ ���@@ �A�������	� Module instantiating the printing interface of Squirrel.
  * It provides printing functions that behave accordingly with
  * the running mode and the kind of printed information. ��4src/core/printer.mliA@@�C } �@@��A@@�C } �@@@@��A@@�C } �@@��
A@@�C } �@��A@@�C } �@�����!���@@ ���@@ �A�������. {2 Keywords} �� F � ��!F � �@@��#F � ��$F � �@@@@��&F � ��'F � �@@��)F � ��*F � �@��,F � ��-F � �@���A�  # �'keyword��6I � ��7I � �@@@@A�������-TermCondition��AJ � ��BJ �
@A@��DJ � ��EJ �
@@����(TermDiff��LK�MK@A@��OK�PK@@����'TermSeq��WL�XL%@A@��ZL�[L%@@����+TermHappens��bM&*�cM&6@A@��eM&*�fM&6@@����(TermBool��mN7;�nN7D@A@��pN7;�qN7D@@����+TermQuantif��xOEI�yOEU@A@��{OEI�|OEU@@����*TermAction���PVZ��PVe@A@���PVZ��PVe@@����+ProcessName���Qfj��Qfv@A@���Qfj��Qfv@@����/ProcessVariable���Rw{��Rw�@A@���Rw{��Rw�@@����0ProcessCondition���S����S��@A@���S����S��@@����$Goal���T����T��@A@���T����T��@@����$Prog���U����U��@A@���U����U��@@����,ProcessInOut���V����V��@A@���V����V��@@����.ProcessChannel���W����W��@A@���W����W��@@����.ProcessKeyword���X����X��@A@���X����X��@@����)GoalMacro���Y����Y��@A@���Y����Y��@@����*GoalAction���Z���Z�@A@���Z���Z�@@����,GoalFunction���[��[ @A@���[� [ @@����(GoalName��\!%�\!.@A@��
\!%�\!.@@����*Separation��]/3�]/>@A@��]/3�]/>@@����(HelpType��^?C�^?L@A@�� ^?C�!^?L@@����,HelpFunction��(_MQ�)_M^@A@��+_MQ�,_M^@@����$Test��3`_c�4`_h@A@��6`_c�7`_h@@����%Error��>aim�?ais@A@��Aaim�Bais@@@@@��DI � ��Ebtu@@@���)ocaml.doc��@@ ��@@ �A�������/ Keyword type. ��VH � ��WH � �@@��YH � ��ZH � �@@@@��\H � ��]H � �@@��_H � ��`H � �@@��bI � ��cbtu@@��eI � ��fbtu@�����y��@@@ ��A@@ �A�������< {2 Printer initialization} ��xexx�yex�@@��{exx�|ex�@@@@��~exx�ex�@@���exx��ex�@���exx��ex�@���A�  # �,printer_mode���g����g��@@@���$Test���g����g��@@�@@���g����g��@@��+Interactive���g����g��@@�@@���g����g��@@��$File���g����g��@@�@@���g����g��@@��$Html���g����g��@@�@@���g����g��@@@A@@���g����g��@@���g����g��@���Р,printer_mode���j����j��@����#ref���j���j�@�����,printer_mode���j���j�@@���j���j�@@@@���j���j�@@@@�������@@ ���@@ �A�������7 Current printer_mode. ���i����i��@@���i����i��@@@@���i����i��@@���i����i��@@���j����j�@��j���j�@���Р)dummy_fmt��
mDH�mDQ@�����&Format)formatter��mDT�mDd@@��mDT�mDd@@@@���Ӱ��@@ ���@@ �A�������	+ A formatter that does not print anything. ��(l�)lC@@��+l�,lC@@@@��.l�/lC@@��1l�2lC@@��4mDD�5mDd@��7mDD�8mDd@���Р'get_std��@p���Ap��@��@����$unit��Jp���Kp��@@��Mp���Np��@@@�����&Format)formatter��Wp���Xp��@@��Zp���[p��@@@��]p���^p��@@@@�����6@@ ��7@@ �A�������	B Define a standard formatter for the printer w.r.t. printer_mode. ��noff�oof�@@��qoff�rof�@@@@��toff�uof�@@��woff�xof�@@��zp���{p��@��}p���~p��@���Р(init_ppf���s� ��s�@��@�����&Format)formatter���s���s�@@���s���s�@@@��@����,printer_mode���s���s�+@@���s���s�+@@@����$unit���s�/��s�3@@���s�/��s�3@@@���s���s�3@@@���s���s�3@@@@���o���@@ ���@@ �A�������	  Initialisation of a formatter. ���r����r��@@���r����r��@@@@���r����r��@@���r����r��@@���s����s�3@���s����s�3@���Р$init���vfj��vfn@��@����,printer_mode���vfq��vf}@@���vfq��vf}@@@����$unit���vf���vf�@@���vf���vf�@@@���vfq��vf�@@@@�������@@ ���@@ �A�������	+ Initialisation of the standard formatter. ��u55�	u5e@@��u55�u5e@@@@��u55�u5e@@��u55�u5e@@��vff�vf�@��vff�vf�@�����+���@@ ���@@ �A�������8 {2 Printing functions} ��*y���+y��@@��-y���.y��@@@@��0y���1y��@@��3y���4y��@��6y���7y��@���A�  # �"pp��@|���A|��@@@@A�������&Prompt��K|���L|��@A@��N|���O|��@@����%Start��V|���W|�@A@��Y|���Z|�@@����&Result��a|��b|�@A@��d|��e|�@@����%Error��l|��m|�@A@��o|��p|�@@����#Dbg��w}�x}!@A@��z}�{}!@@����'Warning���}$��},@A@���}$��},@@����&Ignore���}/��}6@A@���}/��}6@@����$Goal���}9��}>@A@���}9��}>@@����'Default���}A��}I@A@���}A��}I@@@@@���|����}K@@@���e���@@ ���@@ �A�������	< Type defining the markup to use before and after printing. ���{����{��@@���{����{��@@@@���{����{��@@���{����{��@@���|����}K@@���|����}K@���Р#prt��� @���� @��@��@����"pp��� @���� @��@@��� @���� @��@@@��@����&format��� @���� @��@���!a��� @���� @��@@@������&Format)formatter��� @���� @��@@��� @���� @��@@@�����$unit�� @��� @��@@��
 @��� @��@@@@�� @��� @��@@@��!a�� @��� @��@@@�� @��� @��@@@�� @��� @��@@@@���հ��@@ ���@@ �A�������	D Print with the printer's standard formatter w.r.t. a given markup. ��*MM�+M�@@��-MM�.M�@@@@��0MM�1M�@@��3MM�4M�@@��6 @���7 @��@��9 @���: @��@���Р'prthtml��B C%)�C C%0@��@����"pp��L C%3�M C%5@@��O C%3�P C%5@@@��@����&format��Y C%V�Z C%\@���!a��` C%:�a C%<@@@������&Format)formatter��k C%>�l C%N@@��n C%>�o C%N@@@�����$unit��w C%P�x C%T@@��z C%P�{ C%T@@@@��} C%9�~ C%\@@@��!a��� C%`�� C%b@@@��� C%9�� C%b@@@��� C%3�� C%b@@@@���E��b@@ ��c@@ �A�������	M Print for html with the printer's standard formatter w.r.t. a given markup. ��� B���� B�$@@��� B���� B�$@@@@��� B���� B�$@@��� B���� B�$@@��� C%%�� C%b@��� C%%�� C%b@���Р+prthtml_out��� F���� F��@��@�����&Format)formatter��� F���� F��@@��� F���� F��@@@��@����"pp��� F���� F��@@��� F���� F��@@@��@����&format��� F���� F��@���!a��� F���� F��@@@������&Format)formatter��� F���� F��@@��� F���� F��@@@�����$unit��� F���� F��@@��� F���� F��@@@@��� F���� F��@@@��!a�� F��� F��@@@�� F��� F��@@@�� F���	 F��@@@�� F��� F��@@@@���ǰ��@@ ���@@ �A�������	@ Print for html with the giver formatter w.r.t. a given markup. �� Edd� Ed�@@�� Edd�  Ed�@@@@��" Edd�# Ed�@@��% Edd�& Ed�@@��( F���) F��@��+ F���, F��@���Р&defprt��4 IDH�5 IDN@��@����"pp��> IDQ�? IDS@@��A IDQ�B IDS@@@��@����&format��K IDt�L IDz@���!a��R IDX�S IDZ@@@������&Format)formatter��] ID\�^ IDl@@��` ID\�a IDl@@@�����$unit��i IDn�j IDr@@��l IDn�m IDr@@@@��o IDW�p IDz@@@��!a��u ID~�v ID�@@@��x IDW�y ID�@@@��{ IDQ�| ID�@@@@���7��T@@ ��U@@ �A�������	= Default printer, look at mode and use either prt or prthml. ��� H�� HC@@��� H�� HC@@@@��� H�� HC@@��� H�� HC@@��� IDD�� ID�@��� IDD�� ID�@���Р"pr��� L���� L��@��@����&format��� L���� L��@���!a��� L���� L��@@@������&Format)formatter��� L���� L��@@��� L���� L��@@@�����$unit��� L���� L��@@��� L���� L��@@@@��� L���� L��@@@��!a��� L���� L��@@@��� L���� L��@@@@�������@@ ���@@ �A�������	7 Default printing on the printer's standard formatter. ��� K���� K��@@��� K���� K��@@@@��� K���� K��@@��� K���� K��@@��� L���� L��@��� L���� L��@���Р"kw�� OCG� OCI@��@����'keyword�� OCL� OCS@@�� OCL� OCS@@@��@�����&Format)formatter�� OCW� OCg@@��  OCW�! OCg@@@��@����&format��* OC��+ OC�@���!a��1 OCl�2 OCn@@@������&Format)formatter��< OCp�= OC�@@��? OCp�@ OC�@@@�����$unit��H OC��I OC�@@��K OC��L OC�@@@@��N OCk�O OC�@@@��!a��T OC��U OC�@@@��W OCk�X OC�@@@��Z OCW�[ OC�@@@��] OCL�^ OC�@@@@�����6@@ ��7@@ �A�������	J Print the given format with the style associated with the given keyword. ��n N���o N�B@@��q N���r N�B@@@@��t N���u N�B@@��w N���x N�B@@��z OCC�{ OC�@��} OCC�~ OC�@���Р#kws��� R���� R��@��@����'keyword��� R���� R��@@��� R���� R��@@@��@�����&Format)formatter��� R���� R��@@��� R���� R��@@@��@����&string��� R���� R��@@��� R���� R��@@@����$unit��� R���� R��@@��� R���� R��@@@��� R���� R��@@@��� R���� R��@@@��� R���� R��@@@@������@@ ���@@ �A�������> Like [kw] but with a string. ��� Q���� Q��@@��� Q���� Q��@@@@��� Q���� Q��@@��� Q���� Q��@@��� R���� R��@��� R���� R��@���������@@ ���@@ �A�������3 {2 HTML printing} ��� U���� U�	@@��� U���� U�	@@@@��� U���� U�	@@��� U���  U�	@�� U��� U�	@���Р$html�� X	z	~� X	z	�@��@��@�����&Format)formatter�� X	z	�� X	z	�@@�� X	z	�� X	z	�@@@��@��!a��$ X	z	��% X	z	�@@@����$unit��, X	z	��- X	z	�@@��/ X	z	��0 X	z	�@@@��2 X	z	��3 X	z	�@@@��5 X	z	��6 X	z	�@@@��@�����&Format)formatter��A X	z	��B X	z	�@@��D X	z	��E X	z	�@@@��@��!a��L X	z	��M X	z	�@@@����$unit��T X	z	��U X	z	�@@��W X	z	��X X	z	�@@@��Z X	z	��[ X	z	�@@@��] X	z	��^ X	z	�@@@��` X	z	��a X	z	�@@@@�����9@@ ��:@@ �A�������	f [html pp] return a printing function which apply [pp] with HTML tags and escaping special characters ��q W		�r W		y@@��t W		�u W		y@@@@��w W		�x W		y@@��z W		�{ W		y@@��} X	z	z�~ X	z	�@��� X	z	z�� X	z	�@@