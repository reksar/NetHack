@echo off

set NetHackRoot=%~d0%~p0
set NetHack=%NetHackRoot%bin\Release\x64\NetHack.exe
set build=%NetHackRoot%win\win32\vs\build-project.bat

if not exist "%NetHack%" (
  echo NetHack does not exist, trying to build ...
  %build%
)

%NetHack% -u you -@
