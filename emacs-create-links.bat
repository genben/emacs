@set CURRDIR=%~dp0

mklink "%HOMEDRIVE%%HOMEPATH%\.emacs" "%CURRDIR%\emacs"
mklink /D /J "%HOMEDRIVE%%HOMEPATH%\.emacs.d" "%CURRDIR%\emacs.d"
pause