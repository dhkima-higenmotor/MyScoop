@ECHO OFF

REM path
set BASE_PATH=D:\github
set MYSCOOP_PATH=%BASE_PATH%\MyScoop
set MYSCOOP_CONFIG=%MYSCOOP_PATH%\config

REM Install scoop
powershell.exe -Command Set-ExecutionPolicy RemoteSigned -Scope CurrentUser ; irm get.scoop.sh | iex

REM Bucket
scoop install git
scoop bucket add extras

REM Pkgs
scoop install sudo aria2 imagemagick uutils-coreutils grep wget ffmpeg
scoop install git-lfs gh
scoop install miniconda3 julia
scoop install qview mupdf

REM Depress aria2 warning
scoop config aria2-warning-enabled false
REM Solution for 7zip update or installation error
scoop config MSIEXTRACT_USE_LESSMSI $true

REM bashrc
git clone https://github.com/dymaxionkim/MyScoop.git %MYSCOOP_PATH%
cp %MYSCOOP_CONFIG%/bash.bashrc %userprofile%\scoop\apps\git\current\etc\bash.bashrc

REM conda enable
%userprofile%\scoop\apps\miniconda3\current\Scripts\activate.bat
conda init bash
echo '. ${HOME}/.bash_profile' >> %userprofile%\.bashrc
cp %MYSCOOP_CONFIG%/git-prompt.sh %userprofile%\scoop\apps\git\current\etc\profile.d\git-prompt.sh

REM conda forge
conda config --add channels conda-forge
conda config --set channel_priority strict
conda config --remove channels defaults
conda update --all

REM font
wget https://github.com/kelvinks/D2Coding_Nerd/raw/master/D2Coding%20v.1.3.2%20Nerd%20Font%20Complete.ttf %MYSCOOP_PATH%
wget https://github.com/dymaxionkim/CREO3_STARTUP/raw/master/font/ARIALUNI.TTF %MYSCOOP_PATH%

set D2Coding=D2Coding v.1.3.2 Nerd Font Complete.ttf
set ARIALUNI=ARIALUNI.TTF

if not exist %systemroot%\fonts\%D2Coding% (
sudo COPY /Y %D2Coding% %systemroot%\fonts
sudo REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "D2Coding & D2Coding Bold & D2Coding ligature & D2Coding ligature Bold (TrueType)" /t REG_SZ /d "D2Coding-Ver1.3.2-20180524-all.ttc" /f
)

if not exist %systemroot%\fonts\%ARIALUNI% (
sudo COPY /Y %ARIALUNI% %systemroot%\fonts
sudo REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Arial Unicode MS (TrueType)" /t REG_SZ /d "ARIALUNI.TTF" /f
)

rm "%D2Coding%"
rm "%ARIALUNI%"
