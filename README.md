# MyScoop

_scoop configuration for my Windows PC_


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

scoop install librecad
scoop install freecad
scoop install solvespace
scoop install pyenv
```

## git_bash

* bashrc

```
cp ./config/bash.bash.bashrc C:\Users\dhkima\scoop\apps\git\current\etc\bash.bashrc
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
code ~/scoop/apps/git/current/etc/profile.d/git-prompt.sh

# Commenting out newline lines in prompt display related contents
#PS1="$PS1"'\n'                 # new line
```

## alacritty

* config

```
cp ./config/alacritty-cmd.yml %userprofile%\scoop\persist\alacritty\alacritty-cmd.yml
```

## GlazeWM

* config

```
mkdir %userprofile%\.glaze-wm
cp ./config/config.yaml %userprofile%\.glaze-wm\config.yaml
```

## ETC

* font : [D2Coding Nerd Font](https://github.com/kelvinks/D2Coding_Nerd/raw/master/D2Coding%20v.1.3.2%20Nerd%20Font%20Complete.ttf)

