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

go env -w GO111MODULE=on
go env -w GOPROXY=https://proxy.golang.com.cn,direct

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
# 鍏充簬symlink锛氫娇鐢≒owerShell鍒涘缓纭�閾炬帴鍜岃蒋閾炬帴 https://www.codenong.com/894430/
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

# 鍒╃敤鍩熷悕鏃犻渶榄旀硶璁块棶cloudflare workers(閲嶆柊瀹炵幇github鍔犻€�) https://www.kejiwanjia.com/jiaocheng/105320.html
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
    # BUG:  鏍囪�扳€�&&鈥濅笉鏄�姝ょ増鏈�涓�鐨勬湁鏁堣��鍙ュ垎闅旂�︺€�
    # git add . && git commit -m "$*" && git push
    git add . ; git commit -m "$args" ; git push
}

# FEAT.
function gfeat() {
    gcap "鉁忥笍 feat: $args"
}

# IMPROVE.
function gimp() {
    gcap "馃搱 improve: $args"
}

# FIX.
function gfix() {
    gcap "馃敡 fix: $args"
}

# RELEASE.
function grls() {
    gcap "馃殌 release: $args"
}

# DOC.
function gdoc() {
    gcap "馃搼 doc: $args"
}

# TEST.
function gtst() {
    gcap "鉁� test: $args"
}

# CHORE.
function gchore() {
    gcap "馃搶 chore: $args"
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

# scoop鎻愰€燂細瑙ｅ喅scoop杞�浠朵笅杞芥參鐨勯棶棰� : https://blog.csdn.net/weixin_42250302/article/details/124733053
function kscoop {
    <#
    .SYNOPSIS
    鍔犻€熸墭绠″湪github涓婄殑scoop杞�浠剁殑涓嬭浇鍙婃洿鏂�

    .DESCRIPTION
    鍔犻€熸墭绠″湪github涓婄殑scoop杞�浠剁殑涓嬭浇鍙婃洿鏂般€傛敮鎸佽蒋浠剁殑瀹夎�呫€佹洿鏂般€佹悳绱�锛屽強
    閫氳繃鏈�鍑芥暟瀹夎�呰蒋浠剁殑鏌ヨ��銆傚嚱鏁版秹鍙婁袱涓�涓昏�佸彉閲�:
        # 灏嗘�ゅ€兼洿鏀逛负鑷�宸辩數鑴戜笂鐩稿簲璺�寰�
        $basePath = "E:/toolbox/scoop/apps/"
        # 瀛樺偍閫氳繃鏈�鍑芥暟瀹夎�呯殑杞�浠朵俊鎭�鐨勬枃浠�
        $appListFile = Join-Path ${basePath} "AAAppsList.json"

    鏇存柊鏃讹紝姝ゆ柟娉曞彧鑳芥洿鏂扮敤 kscoop -install 鏂瑰紡瀹夎�呯殑杞�浠讹紝鑻ヨ�佹洿鏂皊coop鍘熺敓鏂瑰紡瀹夎�呯殑
    杞�浠讹紝闇€鍏堝嵏杞藉師鏉ヨ蒋浠讹紙scoop uninstall ***锛夛紝鍐嶄娇鐢� kscoop -install 瀹夎��

    .PARAMETER install
    瑕佸畨瑁呰蒋浠剁殑鍏ㄩ檺瀹氬悕锛屾垨鑰呰蒋浠舵竻鍗曟枃浠�(xx.json)瀵瑰簲鐨刄rl

    .PARAMETER bucket
    杞�浠舵墍鍦ㄧ殑 bucket

    .PARAMETER arch
    杞�浠剁殑鏋舵瀯锛�32bit 鎴� 64bit锛岄粯璁ゅ畨瑁� 64bit 鐨勮蒋浠讹紝浣跨敤 -arch 32bit 瀹夎��32浣嶇殑杞�浠�

    .PARAMETER noCache
    瀹夎�呮椂鏄�鍚︿娇鐢ㄧ紦瀛橈紝榛樿�や娇鐢ㄧ紦瀛橈紝鑻ュ紑鍚�姝ゅ紑鍏冲垯涓嶄娇鐢�

    .PARAMETER update
    瑕佹洿鏂拌蒋浠剁殑鍏ㄩ檺瀹氬悕锛屾垨 * 銆傝嫢鍙傛暟鍊间负 * 锛屽垯鏇存柊 $appListFile 涓�鎵€鏈夎蒋浠�

    .PARAMETER search
    瑕佹悳绱㈢殑杞�浠剁殑鍚嶅瓧锛屼笉蹇呮槸杞�浠剁殑鍏ㄩ檺瀹氬悕锛岃嫢鍚嶅瓧鏈夌┖鏍煎垯鐢ㄥ紩鍙锋嫭浣�

    .PARAMETER list
    鑻ュ紑鍚�姝ゅ紑鍏筹紝鍒欏垪鍑洪€氳繃鏈�鍑芥暟瀹夎�呰繃鐨勮蒋浠�

    .EXAMPLE
    kscoop -install grep -bucket main -noCache
    涓嶄娇鐢ㄧ紦瀛�

    .EXAMPLE
    kscoop -install grep -bucket main
    浣跨敤缂撳瓨

    .EXAMPLE
    kscoop -install grep -bucket main -arch 32bit -noCache
    瀹夎��32浣嶇殑杞�浠�

    .EXAMPLE
    kscoop -install https://github.com/ScoopInstaller/Main/blob/master/bucket/psutils.json -noCache
    閫氳繃 Url 瀹夎�呬竴涓�杞�浠�

    .EXAMPLE
    kscoop -update llvm
    鏇存柊 $appListFile 涓�鐨勬煇涓�杞�浠�

    .EXAMPLE
    kscoop -update *
    鏇存柊 $appListFile 涓�鐨勬墍鏈夎蒋浠�

    .EXAMPLE
    kscoop -search grep
    浣跨敤娴忚�堝櫒鍦╯coop浠撳簱涓�鎼滅储 grep

    .EXAMPLE
    kscoop -list
    鍒楀嚭 $appListFile 涓�鐨勮蒋浠朵俊鎭�
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
        #灏嗘�ゅ€兼洿鏀逛负鑷�宸辩數鑴戜笂鐩稿簲璺�寰�
        $basePath = "E:/toolbox/scoop/apps/"
        #瀛樺偍宸插畨瑁呰蒋浠朵俊鎭�鐨勬枃浠�
        $appListFile = Join-Path ${basePath} "AAAppsList.json"
        if (!(Test-Path $appListFile)) {
			New-Item $appListFile -Force
        }

        #璇诲彇浣跨敤鏈�鏂规硶瀹夎�呯殑杞�浠跺垪琛�
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
                #鍙傛暟涓簎rl
                if ($install -match "^https://github\.com/ScoopInstaller(/.+){5}\.json$") {
                    $bucket = $install.Split('/')[4]
                    $appName = $install.Substring($install.LastIndexOf('/') + 1).Replace(".json", '')
                }
                #鍙傛暟涓鸿蒋浠跺悕
                if ($install -notmatch "^https://github\.com/ScoopInstaller.*json$") {
                    $appName = $install
                    #濡傛灉娌℃湁鎸囨槑bucket锛屾�€鏌ヨ�ヨ蒋浠朵箣鍓嶆槸鍚﹀畨瑁呰繃
                    if ([String]::IsNullOrEmpty($bucket)) {
                        if ($installedApps.Contains($appName)) {
                            $arch = $installedApps[$appName].arch
                            $bucket = $installedApps[$appName].bucket
                        } else {
                            Write-Host "${appListFile} 涓�鎵句笉鍒拌蒋浠� ${appName}锛岃�锋寚鏄庤蒋浠� bucket" -ForegroundColor Red
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

                #灏嗘柊杞�浠惰�板綍鍒版枃浠朵腑
                if (-not $installedApps.Contains($appName)) {
                    $installedApps.Add($appName, @{ 'bucket' = $bucket; 'arch' = $arch })
                    $installedApps |ConvertTo-Json |Out-File $appListFile
                }
            }
            "UpdateApp" {
                $appName = $update
                #鏇存柊鎵€鏈夎蒋浠�
                if ($appName -eq '*' ) {
                    foreach ($appName in $installedApps.keys) {
                        $bucket, $arch = $installedApps[$appName].bucket, $installedApps[$appName].arch
                        scoop uninstall $appName

                        $jsonFile = Join-Path $basePath "${appName}.json"
                        $url = $urlPattern -f $bucket, $appName
                        $statusCode = k-scoop-down-helper -url $url -file $jsonFile

                        scoop install $jsonFile -a $arch -k
                    }
                    Write-Host "`n涓€鍏辨洿鏂� $($installedApps.count) 涓�杞�浠讹細" -ForegroundColor Green
                    $installedApps.Keys | ForEach-Object { Write-Output "`t$_" }
                }
                #鏇存柊鏌愪釜杞�浠�
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
                        $prompt = "鏂囦欢 ${appListFile} 涓嶅瓨鍦ㄨ蒋浠� ${appName}锛岃�风‘璁よ蒋浠跺悕绉版槸鍚︽�ｇ‘"
                        Write-Host $prompt -ForegroundColor Red
                    }
                }
            }
            "SearchApp" {
                Start-Process msedge "https://scoop.sh/#/apps?q=${search}&s=0&d=1&o=true"
            }
            "ListApp" {
                Write-Host "${appListFile} 涓�鐨勮蒋浠讹細`n"
                $installedApps
            }
        }
    }
}
function k-scoop-down-helper ($url, $file) {
    <#
    .DESCRIPTION
    鏍规嵁scoop浠撳簱涓�杞�浠剁殑 URL 鍦板潃锛屽皢杞�浠跺�瑰簲鐨� json 鏂囦欢涓嬭浇鍒版湰鍦�
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
            Write-Host "鍑虹幇閿欒��锛屾棤娉曚笅杞芥枃浠�:`n`t${url}" -ForegroundColor Red
        }
    }

    return $StatusCode
}
