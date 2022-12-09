# .dotfiles

## powershell
```powershell
# starts with a specific browser
#Start-Process -FilePath iexplore -ArgumentList www.jb51.net
# starts with default browser and adds to open browser
#Start-Process -FilePath www.jb51.net
#设置
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Set-ExecutionPolicy -Scope CurrentUser Bypass

#安装必要的模块
#https://devblogs.microsoft.com/powershell/announcing-psreadline-2-1-with-predictive-intellisense/
Install-Module PSReadLine -RequiredVersion 2.2.6
Install-Module ZLocation -Scope CurrentUser
Install-Module windows-screenfetch
Install-Module PSColor
Install-Module DirColors
Install-Module posh-git
Install-Module oh-my-posh
Import-Module windows-screenfetch
Set-PSReadLineOption -PredictionSource History
screenfetch

# 安装 oh-my-posh : https://ohmyposh.dev/docs/installation/windows
winget install JanDeDobbeleer.OhMyPosh -s winget

# 打开不能使用 chocolatey 安装的软件主页
Start-Process -FilePath https://community.chocolatey.org/packages?q=
Start-Process -FilePath https://code.visualstudio.com/docs/?dv=win
Start-Process -FilePath https://getquicker.net/
Start-Process -FilePath https://u.tools/
Start-Process -FilePath https://www.wolai.com/lgf136/4fe1sgHUK9MFPZY7TCZrDn
Start-Process -FilePath https://www.notion.so/lgf136/Software-bf5441545b80414982fc6d3213ffa566

```

## msys2
```bash
git config --global user.name "lgf"
git config --global user.email "1366256652@qq.com"
git config --global init.defaultBranch main
git config --global core.autocrlf false
git config --global http.sslverify false
git config --global https.sslverify false
git config --global pull.rebase false
git config --global core.quotepath false


git  clone git@github.com:lgf-136/.dotfiles.git ~/.dotfiles
rm -f ~/.zshrc ~/.bashrc
ln -s -f ~/.dotfiles/.zshrc  ~/.zshrc
ln -s -f ~/.dotfiles/.bashrc  ~/.bashrc


"C:\Users\lgf\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

rm -f /c/Users/lgf/Documents/PowerShell/Microsoft.PowerShell_profile.ps1
ln   /c/Users/lgf/.dotfiles/powershell/PowerShell/Microsoft.PowerShell_profile.ps1 /c/Users/lgf/Documents/PowerShell/Microsoft.PowerShell_profile.ps1

rm -f /c/Users/lgf/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
ln  /c/Users/lgf/.dotfiles/powershell/WindowsPowerShell/Microsoft.PowerShell_profile.ps1 /c/Users/lgf/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1

rm -f /c/Users/lgf/.cargo/config
ln  /c/Users/lgf/.dotfiles/.cargo/config /c/Users/lgf/.cargo/config
```


