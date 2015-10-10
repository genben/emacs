@set CURRDIR=%~dp0

mklink "C:\.emacs" "%CURRDIR%\.emacs"
mklink /D /J "C:\.emacs.d" "%CURRDIR%\.emacs.d"
pause
