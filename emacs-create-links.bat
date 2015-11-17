@set CURRDIR=%~dp0

@rem mklink "C:\.emacs" "%CURRDIR%\.emacs"
@rem mklink "%HOMEDRIVE%%HOMEPATH%\.emacs" "%CURRDIR%\.emacs"


mklink /D /J "%APPDATA%\.emacs.d" "%CURRDIR%\.emacs.d"
pause
