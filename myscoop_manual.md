# Manual Setting

## Install scoop

* Check PowerShell version

```powershell
$PSVersionTable
```

* [Install Command in Powershell](https://stackoverflow.com/questions/74870579/error-installing-scoop-command-line-installer)

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
iwr -useb get.scoop.sh -outfile 'install.ps1'
.\install.ps1 -RunAsAdmin
```

or

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser ; irm get.scoop.sh | iex
```

## Add Bucket

```powershell
scoop install git
scoop bucket known
scoop bucket add extras
```

## Install Packages

```powershell
# Terminal
scoop install sudo
scoop install aria2
scoop install btop
scoop install imagemagick
scoop install nano
scoop install uutils-coreutils
scoop install grep
scoop install wget
scoop install ffmpeg
scoop install alacritty
scoop install wezterm

# git
scoop install git-lfs
scoop install gh

# coding
#scoop install pyenv
scoop install miniconda3
scoop install julia
scoop install octave
scoop install vscode
scoop install upx

# Window Manager
scoop install glazewm
scoop install keypirinha

# Engineering
scoop install paraview
scoop install librecad
scoop install freecad
scoop install solvespace

# Graphics, Movies
scoop install gimp
scoop install inkscape
scoop install openshot
scoop install obs-studio

# Document
scoop install typora
scoop install pandoc
scoop install pdfarranger
scoop install libreoffice
scoop install vcredist2022
scoop uninstall vcredist2022

# Utility
scoop install bandizip
scoop install multicommander
scoop install firefox
scoop install everything
scoop install everything-cli
scoop install honeyview
scoop install mupdf
scoop install qview

## Not recommended ...
# fork : git path problem
# sumatrapdf : teminal opening problem
# micro : clipboard problem
```

## Depress aria2 warning

```bash
scoop config aria2-warning-enabled false
```

## Solution for 7zip update or installation error

```bash
scoop config MSIEXTRACT_USE_LESSMSI $true
```

## miniconda3 error fix

```bash
conda install brotlipy
conda update urllib3
```

## git_bash

* bashrc

```bash
bash
cd /d/github
git clone https://github.com/dhkima-higenmotor/MyScoop.git
cd MyScoop
cp config/bash.bashrc ~/scoop/apps/git/current/etc/bash.bashrc
```

* conda enable

```bash
cmd
%userprofile%\scoop\apps\miniconda3\current\Scripts\activate.bat
conda init bash
exit
```

* conda prompt

```bash
echo '. ${HOME}/.bash_profile' > ~/.bashrc
```

* conda prompt one line

```bash
cd /d/github/MyScoop
cp config/git-prompt.sh ~/scoop/apps/git/current/etc/profile.d/git-prompt.sh
```

* conda forge

```bash
conda config --add channels conda-forge
conda config --set channel_priority strict
conda config --remove channels defaults
conda config --show channels
conda update --all
```

## alacritty

* Alacritty is 3D accellerated terminal, so it is not works on vitualbox.

```bash
mkdir $HOME/AppData/Roaming/alacritty
cp config/alacritty-cmd.yml $HOME/AppData/Roaming/alacritty/alacritty.yml
```

## wezterm

* Wezterm is 3D accellerated terminal, so it is not works on vitualbox.

```bash
cp config/_wezterm.lua $HOME/.wezterm.lua
```

## GlazeWM

```bash
mkdir ~/.glaze-wm
cp config/config.yaml ~/.glaze-wm/config.yaml
```

## Keypirinha

```bash
mkdir ~/scoop/apps/keypirinha/current/portable/Profile
mkdir ~/scoop/apps/keypirinha/current/portable/Profile/User
cp config/Keypirinha.ini ~/scoop/apps/keypirinha/current/portable/Profile/User/Keypirinha.ini
```

## Windows Terminal

```bash
cp config/settings.json ${LocalAppData}/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
```

## ChangeDisplayResolutionMSWIN

* Ref : https://github.com/dymaxionkim/ChangeDisplayResolutionMSWIN
* **자세한 설명은 생략한다**

## Fonts

* [D2Coding Nerd Font](https://github.com/kelvinks/D2Coding_Nerd/raw/master/D2Coding%20v.1.3.2%20Nerd%20Font%20Complete.ttf) for Coding
* [Noto Sans Korean](https://fonts.google.com/noto/specimen/Noto+Sans+KR) for Sans Serif
* [Noto Serif Korean](https://fonts.google.com/noto/specimen/Noto+Serif+KR?query=noto+serif+korean) for Serif
* [Arial Unicode MS](https://github.com/dymaxionkim/CREO3_STARTUP/raw/master/font/ARIALUNI.TTF) for Blueprint drawing

## Simply Use

* `Ctrl+Win+K` : keypirinha Launcher
* `Alt+Enter` : Alacritty Terminal
* `Alt+V` : Toggle Vertical-Hirizontal Layout
* `Alt+(Shift)+Arrow` : Move(Change) Window
* `Alt+(Shift)+0~9` : Move(Change) Desktop
* `Alt+Shift+Space` : Toggle Float

