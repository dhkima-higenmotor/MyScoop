@ECHO OFF

REM parameters
set /p BASE_PATH_LOCAL="Input base repo path (D:\github):"
set /p GH_EMAIL_LOCAL="Input github email:"
set /p GH_USERNAME_LOCAL="Input github username:"

REM set BASE_PATH_LOCAL=D:\github
REM set BASE_PATH_LOCAL=%userprofile%\github
REM set GH_EMAIL_LOCAL=dhkima@higenmotor.com
REM set GH_USERNAME_LOCAL=dhkima-higenmotor

set MYSCOOP_PATH=%BASE_PATH_LOCAL%\MyScoop
set MYSCOOP_CONFIG=%MYSCOOP_PATH%\config

REM Install scoop
powershell.exe -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser" ; "irm get.scoop.sh | iex"

REM git
call scoop install git

REM Bucket
call scoop bucket add extras
call scoop update

REM Pkgs
call scoop install sudo aria2 imagemagick uutils-coreutils grep wget ffmpeg dark git-lfs gh miniconda3 julia qview mupdf everything everything-cli

REM Depress aria2 warning
call scoop config aria2-warning-enabled false

REM Solution for 7zip update or installation error
call scoop config MSIEXTRACT_USE_LESSMSI $true

REM LongPaths support
call sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

REM bashrc
copy "%MYSCOOP_CONFIG%\bash.bashrc" "%userprofile%\scoop\apps\git\current\etc\bash.bashrc"
copy "%MYSCOOP_CONFIG%\bashrc" "%userprofile%\.bashrc"

REM git
call git config --global user.email %GH_EMAIL_LOCAL%
call git config --global user.name %GH_USERNAME_LOCAL%
call git config --global color.ui auto
call git config --global core.editor "code -w"
call git config --global push.default matching
call git config --global credential.helper wincred
call git config --global lfs.activitytimeout 300
call git config --global core.quotepath false
call git config --global lfs.https://github.com/mech-higenmotor/.locksverify true
call git config --global init.defaultBranch main
call gh config set editor "code -w"
call gh config set git_protocol https
call gh auth login

REM conda enable
call %userprofile%\scoop\apps\miniconda3\current\Scripts\activate.bat
call conda init bash
echo '. ${HOME}/.bash_profile' >> %userprofile%\.bashrc
copy %MYSCOOP_CONFIG%/git-prompt.sh %userprofile%\scoop\apps\git\current\etc\profile.d\git-prompt.sh

REM conda forge
call conda config --add channels conda-forge
call conda config --set channel_priority strict
call conda config --remove channels defaults
call conda update --all
call conda config --show channels

REM conda lib
call conda install -y pywin32
call conda install -y pysimplegui
call conda install -y pygit2
call conda install -y pandas
call conda install -y numpy
call conda install -y matplotlib
call conda install -y ezdxf

REM Fonts
REM https://fonts.google.com/noto/specimen/Noto+Sans+KR?query=noto+sans+kr
sudo copy "%MYSCOOP_PATH%\Fonts\*.otf" "%systemroot%\Fonts\"
sudo copy "%MYSCOOP_PATH%\Fonts\*.ttf" "%systemroot%\Fonts\"
sudo copy "%MYSCOOP_PATH%\Fonts\*.TTF" "%systemroot%\Fonts\"

echo Finished.
exit