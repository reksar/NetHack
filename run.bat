@echo off

set NetHackRoot=%~d0%~p0
set NetHack=%NetHackRoot%bin\Release\x64\NetHack.exe
set build=%NetHackRoot%win\win32\vs\build-project.bat
set uname=you

rem ---------------------------------------------------------------------------
rem Build the NetHack if it does not exist.

if not exist "%NetHack%" (
  echo NetHack does not exist, trying to build ...
  %build%
)

rem ---------------------------------------------------------------------------
rem Delete saved progress to fresh start.

for /f "tokens=2 delims==" %%i in ('
  %NetHack% --showpaths ^| findstr savedir
') do (
  set savedir=%%~i
)

set SavedProgress=%savedir%%uname%.*

if exist "%SavedProgress%" (
  del "%SavedProgress%"
)

rem ---------------------------------------------------------------------------
set NETHACKOPTIONS=legacy:false
%NetHack% -u %uname% -@
