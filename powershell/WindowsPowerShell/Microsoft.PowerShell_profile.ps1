# https://ohmyposh.dev/docs/migrating
#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" | Invoke-Expression

Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Function oms
{
    Invoke-Expression (& 'C:\ProgramData\chocolatey\lib\starship\tools\starship.exe' init powershell --print-full-init | Out-String)
}
Function omp
{
    oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json | Invoke-Expression
}
Function zz
{
    Import-Module ZLocation
}
Function lgf
{
    cd C:\Users\13662
}
Function dl
{
    cd C:\Users\13662\Downloads
}
Function dt
{
    cd C:\Users\13662\Desktop
}
Function od
{
    cd C:\Users\13662\OneDrive
}
Function ap
{
    cd C:\Users\13662\AppData
}

# 利用域名无需魔法访问cloudflare workers(重新实现github加速) https://www.kejiwanjia.com/jiaocheng/105320.html
Function gh-proxy($url='')
{
    git clone  http://gitproxy.ml/$url
}

function pi()
{
    if (Test-Path -Path '.\package-lock.json')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           npm install
        }
        echo "npm install $args"
        echo "all dependencies"
        npm install $args
        npm list
    }
    elseif (Test-Path -Path '.\yarn.lock')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           yarn install
        }
        echo "yarn add $args"
        $args | foreach { yarn add $($_) }
        echo "all dependencies"
        yarn list 
    }
    elseif (Test-Path -Path '.\pnpm-lock.yaml')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           pnpm install
        }
        echo "pnpm add $args"
        pnpm config set auto-install-peers true
        $args | foreach { pnpm add $($_) }
        echo "dependencies"
        pnpm list -P
        echo "devDependencies"
        pnpm list -D
    }
    else
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           npm install
        }
        echo "npm install $args"
        npm install $args
        echo "all dependencies"
        npm list
    }
}
function pid()
{
    if (Test-Path -Path '.\package-lock.json')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           npm install
        }
        echo "npm install $args"
        echo "all dependencies"
        npm install -D $args
        npm list
    }
    elseif (Test-Path -Path '.\yarn.lock')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           yarn install
        }
        echo "yarn add $args"
        $args | foreach { yarn add -D $($_) }
        echo "all dependencies"
        yarn list 
    }
    elseif (Test-Path -Path '.\pnpm-lock.yaml')
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           pnpm install
        }
        echo "pnpm add $args"
        pnpm config set auto-install-peers true
        $args | foreach { pnpm add -D $($_) }
        echo "dependencies"
        pnpm list -P
        echo "devDependencies"
        pnpm list -D
    }
    else
    {
        if (!(Test-Path  '.\node_modules\'))
        {
	echo "install all dependencies list on package.json file"
           npm install
        }
        echo "npm install $args"
        npm install -D $args
        echo "all dependencies"
        npm list
    }
}