@ECHO OFF

REM path
if not defined BASE_PATH (
    set /p BASE_PATH_LOCAL="Input your local github repo path (ex D:\github):"
    setx BASE_PATH "%BASE_PATH_LOCAL%"
    REM reg add HKCU\Environment /v BASE_PATH /t REG_EXPAND_SZ /d "%BASE_PATH_LOCAL%" /f
)
set MYSCOOP_PATH=%BASE_PATH_LOCAL%\MyScoop
set MYSCOOP_CONFIG=%MYSCOOP_PATH%\config

REM git parameters
if not defined GH_TOKEN (
    set /p GH_TOKEN_LOCAL="Input your Github Pernonal Access Token:"
    setx GH_TOKEN "%GH_TOKEN_LOCAL%"
    REM reg add HKCU\Environment /v GH_TOKEN /t REG_EXPAND_SZ /d "%GH_TOKEN_LOCAL%" /f
)
if not defined GH_EMAIL (
    set /p GH_EMAIL_LOCAL="Input your Github e-mail address (ex dhkima@higenmotor.com):"
    setx GH_EMAIL "%GH_EMAIL_LOCAL%"
    REM reg add HKCU\Environment /v GH_EMAIL /t REG_EXPAND_SZ /d "%GH_EMAIL_LOCAL%" /f
)
if not defined GH_USERNAME (
    set /p GH_USERNAME_LOCAL="Input your Github username (ex dhkima-higenmotor):"
    setx GH_USERNAME "%GH_USERNAME_LOCAL%"
    REM reg add HKCU\Environment /v GH_USERNAME /t REG_EXPAND_SZ /d "%GH_USERNAME_LOCAL%" /f
)

REM Install scoop
powershell.exe -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser" ; "irm get.scoop.sh | iex"

REM git
call scoop install git

REM Bucket
call scoop bucket add extras
call scoop update

REM Pkgs
call scoop install sudo aria2 imagemagick uutils-coreutils grep wget ffmpeg dark git-lfs gh miniconda3 julia qview mupdf

REM Depress aria2 warning
call scoop config aria2-warning-enabled false

REM Solution for 7zip update or installation error
call scoop config MSIEXTRACT_USE_LESSMSI $true

REM LongPaths support
call sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

REM bashrc
REM call git clone https://github.com/dymaxionkim/MyScoop.git %MYSCOOP_PATH%
copy "%MYSCOOP_CONFIG%\bash.bashrc" "%userprofile%\scoop\apps\git\current\etc\bash.bashrc"

REM git
call git config --global user.email %GH_EMAIL_LOCAL%
call git config --global user.name %GH_USERNAME_LOCAL%
call git config --global color.ui auto
call git config --global core.editor "code -w"
call git config --global push.default matching
call git config --global credential.helper wincred
call git config --global lfs.activitytimeout 300
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

REM Fonts
REM https://fonts.google.com/noto/specimen/Noto+Sans+KR?query=noto+sans+kr
sudo copy "%MYSCOOP_PATH%\Fonts\*.otf" "%systemroot%\Fonts\"
sudo copy "%MYSCOOP_PATH%\Fonts\*.ttf" "%systemroot%\Fonts\"
sudo copy "%MYSCOOP_PATH%\Fonts\*.TTF" "%systemroot%\Fonts\"

echo Finished.
