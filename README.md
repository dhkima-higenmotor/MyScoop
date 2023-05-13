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
scoop install sudo
scoop install aria2
scoop install btop
scoop install vscode
scoop install git-lfs
scoop install gh
scoop install julia
scoop install miniconda3
scoop install alacritty
scoop install uutils-coreutils
scoop install imagemagick
scoop install glazewm
scoop install typora
scoop install paraview
scoop install octave
scoop install gimp
scoop install inkscape
scoop install keypirinha

scoop install librecad
scoop install freecad
scoop install solvespace
scoop install pyenv
```

## git_bash

* bashrc

```bash
bash
cd /d/github/MyScoop
cp config/bash.bashrc ~/scoop/apps/git/current/etc/bash.bashrc
```

* conda enable

```bash
conda init bash
```

* conda prompt

```bash
echo '. ${HOME}/.bash_profile' >> ~/.bashrc
```

- conda prompt one line

```bash
cp config/git-prompt.sh ~/scoop/apps/git/current/etc/profile.d/git-prompt.sh
```

## alacritty

```bash
#cp config/alacritty-cmd.yml ~/scoop/persist/alacritty/alacritty-cmd.yml
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

