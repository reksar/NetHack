@echo off

rem The folder of the current batch file.
set vs_path=%~d0%~p0

rem ---------------------------------------------------------------------------

rem Remove generated dirs roughly, instead of `msbuild /t:Clean` to get rid of 
rem additional dependencies.
set root_path=%vs_path%..\..\..
set build_dirs=%root_path%\bin %root_path%\tools %vs_path%obj %vs_path%symbols

for %%i in (%build_dirs%) do (
  rmdir /s /q %%i 2>NUL
)

rem ---------------------------------------------------------------------------

call "%vs_path%vscmd\init.bat" -x 64 -toolset || goto :EOF

rem `Platform` should be set by `vcvars`.
if "%Platform%" == "x86" (
  set obsolete_platform_name=Win32
) else (
  set obsolete_platform_name=%Platform%
)

set Project=NetHack

msbuild %vs_path%NetHack.sln ^
  /t:%Project%:rebuild ^
  /p:Configuration=Release;Platform=%obsolete_platform_name%
