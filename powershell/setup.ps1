


# powershell 需要管理员权限

# 软连接
New-Item -ItemType SymbolicLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name PowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\PowerShell

New-Item -ItemType SymbolicLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name WindowsPowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\WindowsPowerShell

# 硬链接
New-Item -ItemType HardLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name PowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\PowerShell

New-Item -ItemType HardLink `
		 -Path C:\Users\13662\Documents\ `
		 -Name WindowsPowerShell `
		 -Target C:\Users\13662\.dotfiles\powershell\WindowsPowerShell
