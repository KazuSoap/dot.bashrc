@echo off

set sjis_dir=%~dp1sjis_exe
md %sjis_dir% > NUL 2>&1

set mani_dir=%~dp0

rem --------------------------------
mt -inputresource:%1;#1 -out:%sjis_dir%\sjis.manifest
mt -manifest %sjis_dir%\sjis.manifest -manifest %mani_dir%\utf-8.manifest -out:%sjis_dir%\merged.manifest
rem --------------------------------
rem copy %mani_dir%\utf-8.manifest %sjis_dir%\merged.manifest
rem --------------------------------

copy %1 %sjis_dir%\%~n1_sjis.exe
mt -manifest %sjis_dir%\merged.manifest -outputresource:%1;#1
