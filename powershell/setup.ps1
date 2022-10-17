

# powershell 需要管理员权限
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Set-ExecutionPolicy -Scope CurrentUser Bypass

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

winget install JanDeDobbeleer.OhMyPosh -s winget

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco install -y aria2 sudo 7zip git wget curl


# scoop提速：解决scoop软件下载慢的问题 : https://blog.csdn.net/weixin_42250302/article/details/124733053


Set-ExecutionPolicy RemoteSigned
iwr -useb https://gitee.com/fanyi-ff/poocs/raw/master/install-scoop.ps1 | iex
# iwr -useb https://gitee.com/RubyKids/scoop-cn/raw/master/install.ps1 | iex
# 国内安装scoop的保姆教程: https://blog.csdn.net/sinshine86/article/details/126786780
iwr -useb get.glimmer.ltd | iex
scoop install aria2 sudo git 7zip innounp

scoop config aria2-split 3 
scoop config aria2-max-connection-per-server 3 
scoop config aria2-min-split-size 1M

scoop config SCOOP_REPO https://gitee.com/scoop-bucket/scoop

# scoop bucket rm main
# scoop bucket add main https://mirror.nju.edu.cn/git/scoop-main.git
# scoop bucket add extras https://mirror.nju.edu.cn/git/scoop-extras.git
# scoop bucket add dorado https://gitee.com/scoop-bucket/dorado.git
# scoop bucket add devtools https://github.com/anderlli0053/DEV-tools.git
# scoop bucket add sinbucket https://gitcode.net/sinshine86/sinbucket.git

# 使用Github Action每天自动合并其他scoop仓库的更新，仓库地址：https://github.com/kkzzhizhou/scoop-apps
scoop bucket add apps https://github.com/kkzzhizhou/scoop-apps
scoop update


Function Remove-SymLink ($link)
{
    if (test-path -pathtype container $link)
    {
        $command ="cmd /c rmdir"
        invoke-expression "$command $link"
    }
    elseif (test-path -pathtype Leaf $link)
    {
        $command ="cmd /c del"
        invoke-expression "$command $link"
    }

    echo "no such file or folder"
}

# 软连接
cmd /c rmdir C:\Users\13662\Documents\PowerShell
New-Item -ItemType SymbolicLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name PowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\PowerShell

cmd /c rmdir C:\Users\13662\Documents\WindowsPowerShell
New-Item -ItemType SymbolicLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name WindowsPowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\WindowsPowerShell

# # 硬链接
# New-Item -ItemType HardLink `
# 		 -Path C:\Users\13662\Documents\ `
# 		 -Name PowerShell `
# 		 -Target C:\Users\13662\.dotfiles\powershell\PowerShell

# New-Item -ItemType HardLink `
# 		 -Path C:\Users\13662\Documents\ `
# 		 -Name WindowsPowerShell `
# 		 -Target C:\Users\13662\.dotfiles\powershell\WindowsPowerShell

# # 以管理员运行
# ln-s C:\Users\13662\.dotfiles\powershell\PowerShell C:\Users\13662\Documents\PowerShell
# ln-s C:\Users\13662\.dotfiles\powershell\WindowsPowerShell C:\Users\13662\Documents\WindowsPowerShell


# alias update='cd ~/.dotfiles && git pull && cd .. && \
#               rm -f ~/.zshrc ~/.bashrc ~/.common.sh ~/.exports.sh ~/.alias.sh ~/.functions.sh ~/.gitconfig && \
#               ln -s -f ~/.dotfiles/msys2/.zshrc  ~/.zshrc && \
#               ln -s -f ~/.dotfiles/msys2/.bashrc  ~/.bashrc && \
#               ln -s -f ~/.dotfiles/msys2/.common.sh  ~/.common.sh && \
#               ln -s -f ~/.dotfiles/msys2/.exports.sh  ~/.exports.sh && \
#               ln -s -f ~/.dotfiles/msys2/.alias.sh  ~/.alias.sh && \
#               ln -s -f ~/.dotfiles/msys2/.functions.sh  ~/.functions.sh && \
#               ln -s -f ~/.dotfiles/msys2/.gitconfig  ~/.gitconfig
#             '

ln-s C:\Users\13662\.dotfiles\msys2\.zshrc C:\Users\13662\.zshrc
ln-s C:\Users\13662\.dotfiles\msys2\.bashrc C:\Users\13662\.bashrc
ln-s C:\Users\13662\.dotfiles\msys2\.common.sh C:\Users\13662\.common.sh
ln-s C:\Users\13662\.dotfiles\msys2\.exports.sh C:\Users\13662\.exports.sh
ln-s C:\Users\13662\.dotfiles\msys2\.functions.sh C:\Users\13662\.functions.sh
ln-s C:\Users\13662\.dotfiles\msys2\.alias.sh C:\Users\13662\.alias.sh
ln-s C:\Users\13662\.dotfiles\msys2\.gitconfig C:\Users\13662\.gitconfig



