@echo off

set Project=NetHack

rem Rough cleaning of build results instead of `msbuild /t:Clean` to get rid of 
rem additional dependencies.
set root=..\..\..
set build_dirs=%root%\bin %root%\tools obj symbols
for %%i in (%build_dirs%) do (
  rmdir /s /q %%i 2>NUL
)

rem `Platform` should be set by `vcvars`.
if "%Platform%" == "x86" (
  set obsolete_platform_name=Win32
) else (
  set obsolete_platform_name=%Platform%
)

msbuild NetHack.sln ^
  /t:%Project%:rebuild ^
  /p:Configuration=Release;Platform=%obsolete_platform_name%
