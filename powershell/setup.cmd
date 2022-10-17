
@REM  cmd 需要管理员权限
@REM  软连接
mklink /D C:\Users\13662\Documents\PowerShell C:\Users\13662\.dotfiles\powershell\PowerShell

mklink /D C:\Users\13662\Documents\WindowsPowerShell C:\Users\13662\.dotfiles\powershell\WindowsPowerShell


@REM  硬链接
mklink /H C:\Users\13662\Documents\PowerShell C:\Users\13662\.dotfiles\powershell\PowerShell

mklink /H C:\Users\13662\Documents\WindowsPowerShell C:\Users\13662\.dotfiles\powershell\WindowsPowerShell
