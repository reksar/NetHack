@echo off

call "prerun.bat" || goto :EOF

set NETHACKOPTIONS=legacy:false
"%NetHack%" -u %uname% -@
