@echo off

rem  NOTE: init the `vcvars` before!

setlocal
set root=%~dp0
set vs=%root%win\win32\vs

if "%Platform%"=="x86" (
  set winx=Win32
) else (
  set winx=%Platform%
)

rem  Instead of `msbuild /t:Clean` to get rid of additional dependencies.
for %%i in ("%root%bin" "%root%tools" "%vs%\obj" "%vs%\symbols") do (
  rd /s /q "%%i" 2>NUL
)

msbuild "%vs%\NetHack.sln" ^
  /t:NetHack:rebuild ^
  /p:Configuration=Release;Platform=%winx%

endlocal
