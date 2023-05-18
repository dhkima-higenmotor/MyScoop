# MyScoop

_scoop configuration for my Windows PC_

![GlazeWM](GlazeWM.png)

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
scoop install wget
scoop install ffmpeg
scoop install alacritty

# git
scoop install git-lfs
scoop install gh

# coding
scoop install pyenv
scoop install miniconda3
scoop install julia
scoop install octave
scoop install vscode

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
scoop install pdfarranger

# Utility
scoop install bandizip
scoop install multicommander

## Not recommended ...
# fork : git path problem
# sumatrapdf : teminal opening problem
# micro : clipboard problem
# mupdf : window size problem in glazeWM
```

## Depress aria2 warning

```bash
scoop config aria2-warning-enabled false
```

## Solution for 7zip update or installation error

```bash
scoop config MSIEXTRACT_USE_LESSMSI $true
```

## git_bash

* bashrc

```bash
bash
cd /d/github
git clone https://github.com/dymaxionkim/MyScoop.git
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
echo '. ${HOME}/.bash_profile' >> ~/.bashrc
```

- conda prompt one line

```bash
cd /d/github/MyScoop
cp config/git-prompt.sh ~/scoop/apps/git/current/etc/profile.d/git-prompt.sh
```

## alacritty

```bash
mkdir $HOME/AppData/Roaming/alacritty
cp config/alacritty-cmd.yml $HOME/AppData/Roaming/alacritty/alacritty.yml
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

## ChangeDisplayResolutionMSWIN

* Ref : https://github.com/dymaxionkim/ChangeDisplayResolutionMSWIN
* **자세한 설명은 생략한다**

## ETC

* font : [D2Coding Nerd Font](https://github.com/kelvinks/D2Coding_Nerd/raw/master/D2Coding%20v.1.3.2%20Nerd%20Font%20Complete.ttf) as D2Coding


## Simply Use

* `Ctrl+Win+K` : keypirinha Launcher
* `Alt+Enter` : Alacritty Terminal
* `Alt+V` : Toggle Vertical-Hirizontal Layout
* `Alt+(Shift)+Arrow` : Move(Change) Window
* `Alt+(Shift)+0~9` : Move(Change) Desktop
* `Alt+Shift+Space` : Toggle Float

