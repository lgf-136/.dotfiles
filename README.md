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


Windows通过powershell永久添加、删除环境变量: https://blog.csdn.net/weixin_42250302/article/details/117901436
https://zhuanlan.zhihu.com/p/349455443

echo $env:CARGO_HOME

rust 环境变量设置
[Environment]::SetEnvironmentVariable("CARGO_HOME", "$home\.cargo", "User")
[Environment]::SetEnvironmentVariable("RUSTUP_HOME", "$home\.rustup", "User")
[Environment]::SetEnvironmentVariable("RUSTUP_DIST_SERVER", "http://mirrors.ustc.edu.cn/rust-static", "Machine")
[Environment]::SetEnvironmentVariable("RUSTUP_UPDATE_ROOT", "http://mirrors.ustc.edu.cn/rust-static/rustup", "Machine")
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "User"));%CARGO_HOME%\bin", "User")


golang环境变量设置
[Environment]::SetEnvironmentVariable("GO111MODULE", "on", "Machine")
[Environment]::SetEnvironmentVariable("GOPROXY", "https://goproxy.cn", "Machine")
[Environment]::SetEnvironmentVariable("GOPATH", "D:\dev-env\Go\go", "User")
[Environment]::SetEnvironmentVariable("GOROOT", "D:\dev-env\Go", "Machine")
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "User"));%GOPATH%\bin", "User")
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "Machine"));%GOROOT%\bin", "Machine")




[environment]::SetEnvironmentvariable("GOPATH", "$env:USERPROFILE\gopath", "User")
#调用命令结果：$(命令)
#获取原有用户 PATH 变量：$([environment]::GetEnvironmentvariable("Path", "User"))
#注意 PATH 中条目以分号结尾
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "User"));%GOPATH%\bin", "User")

[environment]::SetEnvironmentvariable("GOROOT", "C:\go", "Machine")
#调用命令结果：$(命令)
#获取原有系统 PATH 变量：$([environment]::GetEnvironmentvariable("Path", "Machine"))
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "Machine"));%GOROOT%\bin", "Machine")




Anaconda环境变量设置
[Environment]::SetEnvironmentVariable("ANACONDA3_HOME", "D:\dev-env\Anaconda3", "Machine")
[environment]::SetEnvironmentvariable("PATH", "$([environment]::GetEnvironmentvariable("Path", "Machine"));%ANACONDA3_HOME%;%ANACONDA3_HOME%\Scripts;%ANACONDA3_HOME%\Library\bin;%ANACONDA3_HOME%\Library\mingw-w64\bin;%ANACONDA3_HOME%\Library\usr\bin", "Machine")

[Environment]::SetEnvironmentVariable("", "", "user")
[Environment]::SetEnvironmentVariable("", "", "user")
[Environment]::SetEnvironmentVariable("", "", "user")


java环境变量设置
添加java
[Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\Java\jdk1.8.0_211' , 'Machine')
添加java到path
$path = [Environment]::GetEnvironmentVariable('Path', 'Machine')
$newpath = '%JAVA_HOME%' + '\bin;' + $path # 或者：$newpath = $Env:JAVA_HOME + '\bin;' + $path
[Environment]::SetEnvironmentVariable('Path', $newpath, 'Machine')

删除java
[Environment]::SetEnvironmentVariable('JAVA_HOME', $null, 'Machine')



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
cargo install lsd


go install github.com/google/gops@latest

```


