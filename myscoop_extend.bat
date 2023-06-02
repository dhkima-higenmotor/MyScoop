@ECHO OFF

REM path
set BASE_PATH=D:\github
REM set BASE_PATH=%userprofile%\github
set MYSCOOP_PATH=%BASE_PATH%\MyScoop
set MYSCOOP_CONFIG=%MYSCOOP_PATH%\config

REM Terminal
call scoop install btop
call scoop install nano
call scoop install alacritty

REM Window Manager
call scoop install glazewm
call scoop install keypirinha

REM Engineering
call scoop install paraview
call scoop install librecad
call scoop install freecad
REM call scoop install solvespace

REM Graphics, Movies
call scoop install gimp
call scoop install inkscape
call scoop install openshot
call scoop install obs-studio
call scoop install blender

REM Document
REM call scoop install typora
call scoop install pdfarranger
call scoop install libreoffice
call scoop install vcredist2022
call scoop uninstall vcredist2022

REM Utility
call scoop install bandizip
REM call scoop install multicommander
call scoop install firefox
call scoop install vscode
call scoop install honeyview
call scoop install btop

REM git
REM call scoop install gittyup
REM call scoop install gitnuro

REM alacritty
mkdir %userprofile%\AppData\Roaming\alacritty
copy %MYSCOOP_CONFIG%\alacritty-cmd.yml %userprofile%\AppData\Roaming\alacritty\alacritty.yml

REM GlazeWM
mkdir %userprofile%\.glaze-wm
copy %MYSCOOP_CONFIG%\config.yaml %userprofile%\.glaze-wm\config.yaml

REM Keypirinha
mkdir %userprofile%\scoop\apps\keypirinha\current\portable\Profile
mkdir %userprofile%\scoop\apps\keypirinha\current\portable\Profile\User
copy %MYSCOOP_CONFIG%\Keypirinha.ini %userprofile%\scoop\apps\keypirinha\current\portable\Profile\User\Keypirinha.ini

echo Finished!
