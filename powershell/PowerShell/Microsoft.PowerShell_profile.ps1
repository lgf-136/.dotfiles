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

Function update()
{
    cd ~\.dotfiles
    git pull
    cd ~
}

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

# Function ln ($target, $link) {
#     New-Item -Path $link -ItemType HardLink  -Value $target
# }

Function ln ($target, $link)
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
    else
    {
        echo "no such file or folder"
    }
    
    if ($PSVersionTable.PSVersion.Major -ge 5)
    {
        New-Item -Path $link -ItemType HardLink -Value $target
    }
    else
    {
        $command ="cmd /c mklink /h"
        invoke-expression "$command""$link""""$target"""
    }
}

# Function ln-s ($target, $link) {
#     New-Item -Path $link -ItemType SymbolicLink -Value $target
# }
# 关于symlink：使用PowerShell创建硬链接和软链接 https://www.codenong.com/894430/
Function ln-s ($target, $link)
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
    else
    {
        echo "no such file or folder"
    }
    
    if ($PSVersionTable.PSVersion.Major -ge 5)
    {
        New-Item -Path $link -ItemType SymbolicLink -Value $target
    }
    else
    {
        $command ="cmd /c mklink /d"
        invoke-expression "$command""$link""""$target"""
    }
}

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

# git emojis

function gcap() {
    # BUG:  标记“&&”不是此版本中的有效语句分隔符。
    # git add . && git commit -m "$*" && git push
    git add . ; git commit -m "$*" ; git push
}

# FEAT.
function gfeat() {
    gcap "✏️ feat: $args"
}

# IMPROVE.
function gimp() {
    gcap "📈 improve: $args"
}

# FIX.
function gfix() {
    gcap "🔧 fix: $args"
}

# RELEASE.
function grls() {
    gcap "🚀 release: $args"
}

# DOC.
function gdoc() {
    gcap "📑 doc: $args"
}

# TEST.
function gtst() {
    gcap "✅ test: $args"
}

# CHORE.
function gchore() {
    gcap "📌 chore: $args"
}

Function touch(){
    foreach ($file in $args){
        if($file -eq $null) {
            throw "No filename supplied"
        }

        if(Test-Path $file)
        {
            (Get-ChildItem $file).LastWriteTime = Get-Date
        }
        else
        {
            echo $null > $file
        }
    }
}

Function ..(){
    cd ..
}

Function ...(){
    cd ..; cd ..
}

Function ....(){
    cd ..; cd ..; cd ..
}

# scoop提速：解决scoop软件下载慢的问题 : https://blog.csdn.net/weixin_42250302/article/details/124733053
function kscoop {
    <#
    .SYNOPSIS
    加速托管在github上的scoop软件的下载及更新

    .DESCRIPTION
    加速托管在github上的scoop软件的下载及更新。支持软件的安装、更新、搜索，及
    通过本函数安装软件的查询。函数涉及两个主要变量:
        # 将此值更改为自己电脑上相应路径
        $basePath = "E:/toolbox/scoop/apps/"
        # 存储通过本函数安装的软件信息的文件
        $appListFile = Join-Path ${basePath} "AAAppsList.json"

    更新时，此方法只能更新用 kscoop -install 方式安装的软件，若要更新scoop原生方式安装的
    软件，需先卸载原来软件（scoop uninstall ***），再使用 kscoop -install 安装

    .PARAMETER install
    要安装软件的全限定名，或者软件清单文件(xx.json)对应的Url

    .PARAMETER bucket
    软件所在的 bucket

    .PARAMETER arch
    软件的架构，32bit 或 64bit，默认安装 64bit 的软件，使用 -arch 32bit 安装32位的软件

    .PARAMETER noCache
    安装时是否使用缓存，默认使用缓存，若开启此开关则不使用

    .PARAMETER update
    要更新软件的全限定名，或 * 。若参数值为 * ，则更新 $appListFile 中所有软件

    .PARAMETER search
    要搜索的软件的名字，不必是软件的全限定名，若名字有空格则用引号括住

    .PARAMETER list
    若开启此开关，则列出通过本函数安装过的软件

    .EXAMPLE
    kscoop -install grep -bucket main -noCache
    不使用缓存

    .EXAMPLE
    kscoop -install grep -bucket main
    使用缓存

    .EXAMPLE
    kscoop -install grep -bucket main -arch 32bit -noCache
    安装32位的软件

    .EXAMPLE
    kscoop -install https://github.com/ScoopInstaller/Main/blob/master/bucket/psutils.json -noCache
    通过 Url 安装一个软件

    .EXAMPLE
    kscoop -update llvm
    更新 $appListFile 中的某个软件

    .EXAMPLE
    kscoop -update *
    更新 $appListFile 中的所有软件

    .EXAMPLE
    kscoop -search grep
    使用浏览器在scoop仓库中搜索 grep

    .EXAMPLE
    kscoop -list
    列出 $appListFile 中的软件信息
    #>
    param (
        [Parameter(Mandatory, ParameterSetName = 'InstallApp')]
        [string]$install,
        [Parameter(ParameterSetName = 'InstallApp')]
        [string]$bucket,
        [Parameter(ParameterSetName = 'InstallApp')]
        [string]$arch = "64bit",
        [Parameter(ParameterSetName = 'InstallApp')]
        [Switch]$noCache,

        [Parameter(Mandatory, ParameterSetName = 'UpdateApp')]
        [string]$update,

        [Parameter(Mandatory, ParameterSetName = 'SearchApp')]
        [string]$search,

        [Parameter(Mandatory, ParameterSetName = 'ListApp')]
        [Switch]$list
    )

    begin {
        #将此值更改为自己电脑上相应路径
        $basePath = "E:/toolbox/scoop/apps/"
        #存储已安装软件信息的文件
        $appListFile = Join-Path ${basePath} "AAAppsList.json"
        if (!(Test-Path $appListFile)) {
			New-Item $appListFile -Force
        }

        #读取使用本方法安装的软件列表
        $appList = Get-Content $appListFile | ConvertFrom-Json
        $installedApps = @{}
        foreach ($app in $appList.psobject.Properties) {
            $installedApps.add($app.name, $app.value)
        }

        $urlPattern = "https://ghproxy.com/https://github.com/ScoopInstaller/{0}/blob/master/bucket/{1}.json"
    }

    process {
        switch ($PsCmdlet.ParameterSetName) {
            "InstallApp" {
                $install = $install.Trim()
                #参数为url
                if ($install -match "^https://github\.com/ScoopInstaller(/.+){5}\.json$") {
                    $bucket = $install.Split('/')[4]
                    $appName = $install.Substring($install.LastIndexOf('/') + 1).Replace(".json", '')
                }
                #参数为软件名
                if ($install -notmatch "^https://github\.com/ScoopInstaller.*json$") {
                    $appName = $install
                    #如果没有指明bucket，检查该软件之前是否安装过
                    if ([String]::IsNullOrEmpty($bucket)) {
                        if ($installedApps.Contains($appName)) {
                            $arch = $installedApps[$appName].arch
                            $bucket = $installedApps[$appName].bucket
                        } else {
                            Write-Host "${appListFile} 中找不到软件 ${appName}，请指明软件 bucket" -ForegroundColor Red
                            return
                        }
                    }
                }
                $url = $urlPattern -f $bucket, $appName
                $jsonFile = Join-Path $basePath "${appName}.json"

                if ($noCache -or !(Test-Path $jsonFile)) {
                    $statusCode = k-scoop-down-helper -url $url -file $jsonFile
                    if ($statusCode -ne 200) { return }

                    scoop install $jsonFile -a $arch -k
                } else {
                    scoop install $jsonFile -a $arch
                }

                #将新软件记录到文件中
                if (-not $installedApps.Contains($appName)) {
                    $installedApps.Add($appName, @{ 'bucket' = $bucket; 'arch' = $arch })
                    $installedApps |ConvertTo-Json |Out-File $appListFile
                }
            }
            "UpdateApp" {
                $appName = $update
                #更新所有软件
                if ($appName -eq '*' ) {
                    foreach ($appName in $installedApps.keys) {
                        $bucket, $arch = $installedApps[$appName].bucket, $installedApps[$appName].arch
                        scoop uninstall $appName

                        $jsonFile = Join-Path $basePath "${appName}.json"
                        $url = $urlPattern -f $bucket, $appName
                        $statusCode = k-scoop-down-helper -url $url -file $jsonFile

                        scoop install $jsonFile -a $arch -k
                    }
                    Write-Host "`n一共更新 $($installedApps.count) 个软件：" -ForegroundColor Green
                    $installedApps.Keys | ForEach-Object { Write-Output "`t$_" }
                }
                #更新某个软件
                else {
                    if ($installedApps.contains($appName)) {
                        $bucket, $arch = $installedApps[$appName].bucket, $installedApps[$appName].arch
                        scoop uninstall $appName

                        $jsonFile = Join-Path $basePath "${appName}.json"
                        $url = $urlPattern -f $bucket, $appName
                        $statusCode = k-scoop-down-helper -url $url -file $jsonFile

                        scoop install $jsonFile -a $arch -k
                    }
                    else {
                        $prompt = "文件 ${appListFile} 不存在软件 ${appName}，请确认软件名称是否正确"
                        Write-Host $prompt -ForegroundColor Red
                    }
                }
            }
            "SearchApp" {
                Start-Process msedge "https://scoop.sh/#/apps?q=${search}&s=0&d=1&o=true"
            }
            "ListApp" {
                Write-Host "${appListFile} 中的软件：`n"
                $installedApps
            }
        }
    }
}
function k-scoop-down-helper ($url, $file) {
    <#
    .DESCRIPTION
    根据scoop仓库中软件的 URL 地址，将软件对应的 json 文件下载到本地
    #>
    try {
        $Response = Invoke-WebRequest -Uri $url
        $StatusCode = $Response.StatusCode
    } catch {
        $StatusCode = $_.Exception.Response.StatusCode.value__
    }

    switch ($StatusCode) {
        200 {
            $sbResCont = [System.Text.StringBuilder]::new($Response.Content)

            [void]$sbResCont.Replace("https://github.com/","https://ghproxy.com/https://github.com/")
            [void]$sbResCont.Replace("https://raw.githubusercontent.com","https://ghproxy.com/https://raw.githubusercontent.com")
            Set-Content -Path $jsonFile -Value $sbResCont
            #sed -i '
            #s/https:\/\/github.com/https:\/\/ghproxy.com\/https:\/\/github.com/
            #s/raw.githubusercontent.com/raw.staticdn.net/
            #' $jsonFile
        }
        Default {
            Write-Host "出现错误，无法下载文件:`n`t${url}" -ForegroundColor Red
        }
    }

    return $StatusCode
}