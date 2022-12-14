# # https://ohmyposh.dev/docs/migrating
# #oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
# #oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" | Invoke-Expression
# Invoke-Expression (&starship init powershell)
# Import-Module PSReadLine
# Set-PSReadLineOption -PredictionSource History
# Set-PSReadlineKeyHandler -Key Tab -Function Complete
# Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
# Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# go env -w GO111MODULE=on
# go env -w GOPROXY=https://proxy.golang.com.cn,direct

# Function update()
# {
#     cd ~\.dotfiles
#     git pull
#     cd ~
# }
# Function Remove-SymLink ($link)
# {
#     if (test-path -pathtype container $link)
#     {
#         $command ="cmd /c rmdir"
#         invoke-expression "$command $link"
#     }
#     elseif (test-path -pathtype Leaf $link)
#     {
#         $command ="cmd /c del"
#         invoke-expression "$command $link"
#     }
#     echo "no such file or folder"
# }
# # Function ln ($target, $link) {
# #     New-Item -Path $link -ItemType HardLink  -Value $target
# # }
# Function ln ($target, $link)
# {
#     if (test-path -pathtype container $link)
#     {
#         $command ="cmd /c rmdir"
#         invoke-expression "$command $link"
#     }
#     elseif (test-path -pathtype Leaf $link)
#     {
#         $command ="cmd /c del"
#         invoke-expression "$command $link"
#     }
#     else
#     {
#         echo "no such file or folder"
#     }
#     if ($PSVersionTable.PSVersion.Major -ge 5)
#     {
#         New-Item -Path $link -ItemType HardLink -Value $target
#     }
#     else
#     {
#         $command ="cmd /c mklink /h"
#         invoke-expression "$command""$link""""$target"""
#     }
# }
# # Function ln-s ($target, $link) {
# #     New-Item -Path $link -ItemType SymbolicLink -Value $target
# # }
# # ??????symlink?????????PowerShell??????????????????????????? https://www.codenong.com/894430/
# Function ln-s ($target, $link)
# {
#     if (test-path -pathtype container $link)
#     {
#         $command ="cmd /c rmdir"
#         invoke-expression "$command $link"
#     }
#     elseif (test-path -pathtype Leaf $link)
#     {
#         $command ="cmd /c del"
#         invoke-expression "$command $link"
#     }
#     else
#     {
#         echo "no such file or folder"
#     }
#     if ($PSVersionTable.PSVersion.Major -ge 5)
#     {
#         New-Item -Path $link -ItemType SymbolicLink -Value $target
#     }
#     else
#     {
#         $command ="cmd /c mklink /d"
#         invoke-expression "$command""$link""""$target"""
#     }
# }
# Function oms
# {
#     Invoke-Expression (& 'C:\ProgramData\chocolatey\lib\starship\tools\starship.exe' init powershell --print-full-init | Out-String)
# }
# Function omp
# {
#     oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\clean-detailed.omp.json | Invoke-Expression
# }
# Function zz
# {
#     Import-Module ZLocation
# }
# Function lgf
# {
#     cd C:\Users\13662
# }
# Function dl
# {
#     cd C:\Users\13662\Downloads
# }
# Function dt
# {
#     cd C:\Users\13662\Desktop
# }
# Function od
# {
#     cd C:\Users\13662\OneDrive
# }
# Function ap
# {
#     cd C:\Users\13662\AppData
# }

# Function weather($city=''){
#     Invoke-RestMethod https://wttr.in/$city
# }

# # ??????
# Function by($KeyWord){
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
# }
# Function bd($KeyWord){
#     Start-Process -FilePath https://www.baidu.com/s?wd=$KeyWord
# }
# Function gg($KeyWord){
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
# }
# Function tt($KeyWord){
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
# }
# # ????????????????????? ?????????????????????????????????
# Function jhzh($KeyWord){
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
#     Start-Process -FilePath https://www.baidu.com/s?wd=$KeyWord
# }
# # ????????????????????? ??????????????????????????????????????????????????????
# Function jhtp($KeyWord){
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
#     Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
# }

# # ??????????????????????????????cloudflare workers(????????????github??????) https://www.kejiwanjia.com/jiaocheng/105320.html
# Function gh-proxy($url='')
# {
#     git clone  http://gitproxy.ml/$url
# }
# function pi()
# {
#     if (Test-Path -Path '.\package-lock.json')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            npm install
#         }
#         echo "npm install $args"
#         echo "all dependencies"
#         npm install $args
#         npm list
#     }
#     elseif (Test-Path -Path '.\yarn.lock')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            yarn install
#         }
#         echo "yarn add $args"
#         $args | foreach { yarn add $($_) }
#         echo "all dependencies"
#         yarn list 
#     }
#     elseif (Test-Path -Path '.\pnpm-lock.yaml')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            pnpm install
#         }
#         echo "pnpm add $args"
#         pnpm config set auto-install-peers true
#         $args | foreach { pnpm add $($_) }
#         echo "dependencies"
#         pnpm list -P
#         echo "devDependencies"
#         pnpm list -D
#     }
#     else
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            npm install
#         }
#         echo "npm install $args"
#         npm install $args
#         echo "all dependencies"
#         npm list
#     }
# }
# function pid()
# {
#     if (Test-Path -Path '.\package-lock.json')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            npm install
#         }
#         echo "npm install $args"
#         echo "all dependencies"
#         npm install -D $args
#         npm list
#     }
#     elseif (Test-Path -Path '.\yarn.lock')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            yarn install
#         }
#         echo "yarn add $args"
#         $args | foreach { yarn add -D $($_) }
#         echo "all dependencies"
#         yarn list 
#     }
#     elseif (Test-Path -Path '.\pnpm-lock.yaml')
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            pnpm install
#         }
#         echo "pnpm add $args"
#         pnpm config set auto-install-peers true
#         $args | foreach { pnpm add -D $($_) }
#         echo "dependencies"
#         pnpm list -P
#         echo "devDependencies"
#         pnpm list -D
#     }
#     else
#     {
#         if (!(Test-Path  '.\node_modules\'))
#         {
# 	echo "install all dependencies list on package.json file"
#            npm install
#         }
#         echo "npm install $args"
#         npm install -D $args
#         echo "all dependencies"
#         npm list
#     }
# }

# Function ep(){
#     explorer.exe .
# }

# Function ob_plugin_download($Repo="SilentVoid13/Templater"){
#     $Plugin_Name=$Repo.split("/")[1]
#     $Plugin_Path=".\$Plugin_Name\"
#     $TRUE_FALSE=(Test-Path $Plugin_Path)
#     if($TRUE_FALSE -eq "True")
#     {
#         remove-Item -Recurse -Force $Plugin_Path
#     }
#     # Remove-Item -Path .\$Plugin_Name\ -Recurse
#     $Proxy_Url="https://ghproxy.com"
#     # $Repo="SilentVoid13/Templater"
#     $Release_Url="https://api.github.com/repos/$Repo/releases/latest"
#     $Response=Invoke-WebRequest -URI $Release_Url
#     $Tag=$Response.Content | ConvertFrom-Json | Select tag_name
#     $Latest_TagName=$Tag.tag_name
#     mkdir -p $Plugin_Name
#     Invoke-WebRequest -Uri "$Proxy_Url/https://github.com/$Repo/releases/download/$Latest_TagName/main.js" -OutFile .\$Plugin_Name\main.js
#     Invoke-WebRequest -Uri "$Proxy_Url/https://github.com/$Repo/releases/download/$Latest_TagName/manifest.json" -OutFile .\$Plugin_Name\manifest.json
#     Invoke-WebRequest -Uri "$Proxy_Url/https://github.com/$Repo/releases/download/$Latest_TagName/styles.css" -OutFile .\$Plugin_Name\styles.css
#     # $Latest_Release_Zip_Url="https://ghproxy.com/https://github.com/$Repo/archive/refs/tags/$Latest_TagName.zip"
#     # Invoke-WebRequest -Uri $Latest_Release_Zip_Url -OutFile .\$Latest_TagName.zip
# }


# # obsidian init
# Function ob_init($projectName=''){
#     mkdir -p $projectName/.obsidian/plugins,$projectName/.obsidian/themes
#     cd $projectName
#     git init
#     git config --local user.name "lgf-136"
#     git config --local user.email "lgf_136@163.com"
#     git config --local core.autocrlf false
#     # ????????????
#     git config --local core.quotepath false
#     git config --local http.sslVerify false
#     git config --local https.sslVerify false
#     cd .obsidian
#     cd plugins
#     # ????????????
#     # git clone  http://gitproxy.ml/https://github.com/tgrosinger/advanced-tables-obsidian
#     # git clone  http://gitproxy.ml/https://github.com/blacksmithgu/obsidian-dataview
#     # git clone  http://gitproxy.ml/https://github.com/mgmeyers/obsidian-kanban
#     # git clone  http://gitproxy.ml/https://github.com/liamcain/obsidian-calendar-plugin
#     # git clone  http://gitproxy.ml/https://github.com/zsviczian/obsidian-excalidraw-plugin
#     # git clone  http://gitproxy.ml/https://github.com/SilentVoid13/Templater
#     # # git clone  http://gitproxy.ml/
#     ob_plugin_download "SilentVoid13/Templater"
#     ob_plugin_download "blacksmithgu/obsidian-dataview"
#     ob_plugin_download "tgrosinger/advanced-tables-obsidian"
#     ob_plugin_download "mgmeyers/obsidian-kanban"
#     ob_plugin_download "liamcain/obsidian-calendar-plugin"
#     ob_plugin_download "zsviczian/obsidian-excalidraw-plugin"
#     cd ..
#     cd ..

# }

# # git operate
# Function gcl($git_url='', $target=''){
#     git clone --depth=1 `
#         -c core.eol=lf `
#         -c core.autocrlf=false `
#         -c fsck.zeroPaddedFilemode=ignore `
#         -c fetch.fsck.zeroPaddedFilemode=ignore `
#         -c receive.fsck.zeroPaddedFilemode=ignore `
#         $git_url $target
# }

# Function gpcl($git_url='', $target=''){
#     git clone --depth=1 `
#         -c core.eol=lf `
#         -c core.autocrlf=false `
#         -c fsck.zeroPaddedFilemode=ignore `
#         -c fetch.fsck.zeroPaddedFilemode=ignore `
#         -c receive.fsck.zeroPaddedFilemode=ignore `
#         http://gitproxy.ml/$git_url $target
# }

# # git log

# Function glg(){
#     git log --graph --oneline --all
# }
# # git emojis
# function gcap() {
#     # BUG:  ?????????&&????????????????????????????????????????????????
#     # git add . && git commit -m "$*" && git push
#     git add . ; git commit -m "$args" ; git push
# }
# # FEAT.
# function gfeat() {
#     gcap "?????? feat: $args"
# }
# # IMPROVE.
# function gimp() {
#     gcap "???? improve: $args"
# }
# # FIX.
# function gfix() {
#     gcap "???? fix: $args"
# }
# # RELEASE.
# function grls() {
#     gcap "???? release: $args"
# }
# # DOC.
# function gdoc() {
#     gcap "???? doc: $args"
# }
# # TEST.
# function gtst() {
#     gcap "??? test: $args"
# }
# # CHORE.
# function gchore() {
#     gcap "???? chore: $args"
# }
# Function touch(){
#     foreach ($file in $args){
#         if($file -eq $null) {
#             throw "No filename supplied"
#         }
#         if(Test-Path $file)
#         {
#             (Get-ChildItem $file).LastWriteTime = Get-Date
#         }
#         else
#         {
#             echo $null > $file
#         }
#     }
# }
# Function ..(){
#     cd ..
# }
# Function ...(){
#     cd ..; cd ..
# }
# Function ....(){
#     cd ..; cd ..; cd ..
# }
# # scoop???????????????scoop???????????????????????? : https://blog.csdn.net/weixin_42250302/article/details/124733053
# function kscoop {
#     <#
#     .SYNOPSIS
#     ???????????????github??????scoop????????????????????????
#     .DESCRIPTION
#     ???????????????github??????scoop????????????????????????????????????????????????????????????????????????
#     ?????????????????????????????????????????????????????????????????????:
#         # ?????????????????????????????????????????????
#         $basePath = "E:/toolbox/scoop/apps/"
#         # ???????????????????????????????????????????????????
#         $appListFile = Join-Path ${basePath} "AAAppsList.json"
#     ???????????????????????????????????? kscoop -install ????????????????????????????????????scoop?????????????????????
#     ????????????????????????????????????scoop uninstall ***??????????????? kscoop -install ??????
#     .PARAMETER install
#     ?????????????????????????????????????????????????????????(xx.json)?????????Url
#     .PARAMETER bucket
#     ??????????????? bucket
#     .PARAMETER arch
#     ??????????????????32bit ??? 64bit??????????????? 64bit ?????????????????? -arch 32bit ??????32????????????
#     .PARAMETER noCache
#     ?????????????????????????????????????????????????????????????????????????????????
#     .PARAMETER update
#     ???????????????????????????????????? * ?????????????????? * ???????????? $appListFile ???????????????
#     .PARAMETER search
#     ???????????????????????????????????????????????????????????????????????????????????????????????????
#     .PARAMETER list
#     ???????????????????????????????????????????????????????????????
#     .EXAMPLE
#     kscoop -install grep -bucket main -noCache
#     ???????????????
#     .EXAMPLE
#     kscoop -install grep -bucket main
#     ????????????
#     .EXAMPLE
#     kscoop -install grep -bucket main -arch 32bit -noCache
#     ??????32????????????
#     .EXAMPLE
#     kscoop -install https://github.com/ScoopInstaller/Main/blob/master/bucket/psutils.json -noCache
#     ?????? Url ??????????????????
#     .EXAMPLE
#     kscoop -update llvm
#     ?????? $appListFile ??????????????????
#     .EXAMPLE
#     kscoop -update *
#     ?????? $appListFile ??????????????????
#     .EXAMPLE
#     kscoop -search grep
#     ??????????????????scoop??????????????? grep
#     .EXAMPLE
#     kscoop -list
#     ?????? $appListFile ??????????????????
#     #>
#     param (
#         [Parameter(Mandatory, ParameterSetName = 'InstallApp')]
#         [string]$install,
#         [Parameter(ParameterSetName = 'InstallApp')]
#         [string]$bucket,
#         [Parameter(ParameterSetName = 'InstallApp')]
#         [string]$arch = "64bit",
#         [Parameter(ParameterSetName = 'InstallApp')]
#         [Switch]$noCache,
#         [Parameter(Mandatory, ParameterSetName = 'UpdateApp')]
#         [string]$update,
#         [Parameter(Mandatory, ParameterSetName = 'SearchApp')]
#         [string]$search,
#         [Parameter(Mandatory, ParameterSetName = 'ListApp')]
#         [Switch]$list
#     )
#     begin {
#         #?????????????????????????????????????????????
#         $basePath = "E:/toolbox/scoop/apps/"
#         #????????????????????????????????????
#         $appListFile = Join-Path ${basePath} "AAAppsList.json"
#         if (!(Test-Path $appListFile)) {
# 			New-Item $appListFile -Force
#         }
#         #??????????????????????????????????????????
#         $appList = Get-Content $appListFile | ConvertFrom-Json
#         $installedApps = @{}
#         foreach ($app in $appList.psobject.Properties) {
#             $installedApps.add($app.name, $app.value)
#         }
#         $urlPattern = "https://ghproxy.com/https://github.com/ScoopInstaller/{0}/blob/master/bucket/{1}.json"
#     }
#     process {
#         switch ($PsCmdlet.ParameterSetName) {
#             "InstallApp" {
#                 $install = $install.Trim()
#                 #?????????url
#                 if ($install -match "^https://github\.com/ScoopInstaller(/.+){5}\.json$") {
#                     $bucket = $install.Split('/')[4]
#                     $appName = $install.Substring($install.LastIndexOf('/') + 1).Replace(".json", '')
#                 }
#                 #??????????????????
#                 if ($install -notmatch "^https://github\.com/ScoopInstaller.*json$") {
#                     $appName = $install
#                     #??????????????????bucket???????????????????????????????????????
#                     if ([String]::IsNullOrEmpty($bucket)) {
#                         if ($installedApps.Contains($appName)) {
#                             $arch = $installedApps[$appName].arch
#                             $bucket = $installedApps[$appName].bucket
#                         } else {
#                             Write-Host "${appListFile} ?????????????????? ${appName}?????????????????? bucket" -ForegroundColor Red
#                             return
#                         }
#                     }
#                 }
#                 $url = $urlPattern -f $bucket, $appName
#                 $jsonFile = Join-Path $basePath "${appName}.json"
#                 if ($noCache -or !(Test-Path $jsonFile)) {
#                     $statusCode = k-scoop-down-helper -url $url -file $jsonFile
#                     if ($statusCode -ne 200) { return }
#                     scoop install $jsonFile -a $arch -k
#                 } else {
#                     scoop install $jsonFile -a $arch
#                 }
#                 #??????????????????????????????
#                 if (-not $installedApps.Contains($appName)) {
#                     $installedApps.Add($appName, @{ 'bucket' = $bucket; 'arch' = $arch })
#                     $installedApps |ConvertTo-Json |Out-File $appListFile
#                 }
#             }
#             "UpdateApp" {
#                 $appName = $update
#                 #??????????????????
#                 if ($appName -eq '*' ) {
#                     foreach ($appName in $installedApps.keys) {
#                         $bucket, $arch = $installedApps[$appName].bucket, $installedApps[$appName].arch
#                         scoop uninstall $appName
#                         $jsonFile = Join-Path $basePath "${appName}.json"
#                         $url = $urlPattern -f $bucket, $appName
#                         $statusCode = k-scoop-down-helper -url $url -file $jsonFile
#                         scoop install $jsonFile -a $arch -k
#                     }
#                     Write-Host "`n???????????? $($installedApps.count) ????????????" -ForegroundColor Green
#                     $installedApps.Keys | ForEach-Object { Write-Output "`t$_" }
#                 }
#                 #??????????????????
#                 else {
#                     if ($installedApps.contains($appName)) {
#                         $bucket, $arch = $installedApps[$appName].bucket, $installedApps[$appName].arch
#                         scoop uninstall $appName
#                         $jsonFile = Join-Path $basePath "${appName}.json"
#                         $url = $urlPattern -f $bucket, $appName
#                         $statusCode = k-scoop-down-helper -url $url -file $jsonFile
#                         scoop install $jsonFile -a $arch -k
#                     }
#                     else {
#                         $prompt = "?????? ${appListFile} ??????????????? ${appName}????????????????????????????????????"
#                         Write-Host $prompt -ForegroundColor Red
#                     }
#                 }
#             }
#             "SearchApp" {
#                 Start-Process msedge "https://scoop.sh/#/apps?q=${search}&s=0&d=1&o=true"
#             }
#             "ListApp" {
#                 Write-Host "${appListFile} ???????????????`n"
#                 $installedApps
#             }
#         }
#     }
# }
# function k-scoop-down-helper ($url, $file) {
#     <#
#     .DESCRIPTION
#     ??????scoop?????????????????? URL ??????????????????????????? json ?????????????????????
#     #>
#     try {
#         $Response = Invoke-WebRequest -Uri $url
#         $StatusCode = $Response.StatusCode
#     } catch {
#         $StatusCode = $_.Exception.Response.StatusCode.value__
#     }
#     switch ($StatusCode) {
#         200 {
#             $sbResCont = [System.Text.StringBuilder]::new($Response.Content)
#             [void]$sbResCont.Replace("https://github.com/","https://ghproxy.com/https://github.com/")
#             [void]$sbResCont.Replace("https://raw.githubusercontent.com","https://ghproxy.com/https://raw.githubusercontent.com")
#             Set-Content -Path $jsonFile -Value $sbResCont
#             #sed -i '
#             #s/https:\/\/github.com/https:\/\/ghproxy.com\/https:\/\/github.com/
#             #s/raw.githubusercontent.com/raw.staticdn.net/
#             #' $jsonFile
#         }
#         Default {
#             Write-Host "?????????????????????????????????:`n`t${url}" -ForegroundColor Red
#         }
#     }
#     return $StatusCode
# }

. ~/.dotfiles/powershell/.common-alias.ps1
. ~/.dotfiles/powershell/.git-alias.ps1
. ~/.dotfiles/powershell/.busybox-win32-alias.ps1
. ~/.dotfiles/powershell/.starship.ps1
