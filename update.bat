@Echo off

REM scoop
call scoop update --all
call scoop reset *
call scoop cleanup *
call scoop cache rm *

REM conda
call %userprofile%\scoop\apps\miniconda3\current\Scripts\activate.bat
call conda update --all

echo Finished.
exit