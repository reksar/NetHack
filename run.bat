@echo off

rem  --------------------------------------------------------------------------
rem  Runs a new random game without prompting the user each time.
rem  --------------------------------------------------------------------------


setlocal
set NetHack=%~dp0bin\Release\x64\NetHack.exe
set uname=you

if not exist "%NetHack%" (
  echo [ERR] Not exists: %NetHack%
  goto :END
)


rem  --- Delete previous progress ---------------------------------------------

for /f "tokens=2 delims==" %%i in ('
  %NetHack% --showpaths ^| findstr savedir
') do (
  set savedir=%%~i
)

set save=%savedir%%uname%.*

if exist "%save%" (
  del "%save%"
)


rem  --- Run ------------------------------------------------------------------
set NETHACKOPTIONS=legacy:false
"%NetHack%" -u %uname% -@


:END
endlocal
