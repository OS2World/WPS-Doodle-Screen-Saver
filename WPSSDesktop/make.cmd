@echo off
@echo Creating header file from IDL file...
sc -mnotc -maddstar -mpbl -s"h;ih" WPSSDesktop.idl
@echo Compiling MSGX.c file...
wcc386 -zq MSGX.c -bd -bm -bt=OS2 -6s -fpi87 -fp6 -sg -otexan -wx -wcd=1177 -I..
@echo Compiling WPSSDesktop.c file...
wcc386 -zq WPSSDesktop.c -bd -bm -bt=OS2 -6s -fpi87 -fp6 -sg -otexan -wx -wcd=1177 -I..
@echo Linking (OpenWatcom v1.4 mode)...
wlink @WPSSDesk
if not errorlevel 1 goto linked
@echo Prevous linking failed, trying to linking in OpenWatcom v1.5 mode...
wlink @WPSSDesk-OW15
if not errorlevel 1 goto linked
@echo WARNING! Linking failed!
:linked
@echo Adding resources...
rc WPSSDesktop-Resources.rc WPSSDesk.dll
@echo Packing DLL...
lxlite WPSSDesk.dll
