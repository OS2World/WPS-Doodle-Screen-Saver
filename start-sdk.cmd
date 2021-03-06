@echo off
rem Batch file to create the initial setup for using the SciTech MGL
rem Graphics Library, using the selected default compiler.

rem Setup the default path environment variable

set OLDPATH=%PATH%
set DEFPATH=D:\OS2;D:\OS2\MDOS
PATH %DEFPATH%

rem Initialise the default compile time environment

call C:\SCITECH\bin-os2\set-vars.cmd
set DEFPATH=%SCITECH%\redist\release;%DEFPATH%
rem call C:\SCITECH\bin-os2\wc11-o32.cmd
call C:\SCITECH\bin-os2\ow10-o32.cmd

rem Change to the directory containing all the MGL sample code

cd %SCITECH%\EXAMPLES\SNAP\GRAPHICS

rem restore old path

set PATH=%PATH%;%OLDPATH%
