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

Function weather($city=''){
    Invoke-RestMethod https://wttr.in/$city
}

# 搜索
Function by($KeyWord){
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
}
Function bd($KeyWord){
    Start-Process -FilePath https://www.baidu.com/s?wd=$KeyWord
}
Function gg($KeyWord){
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
}
Function tt($KeyWord){
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
}
# 综合聚合搜索， 百度，必应，谷歌。。。
Function jhzh($KeyWord){
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
    Start-Process -FilePath https://www.baidu.com/s?wd=$KeyWord
}
# 图片聚合搜索， 百度图片，必应图片，谷歌图片，。。。
Function jhtp($KeyWord){
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
    Start-Process -FilePath https://cn.bing.com/search?q=$KeyWord
}

# 利用域名无需魔法访问cloudflare workers(重新实现github加速) https://www.kejiwanjia.com/jiaocheng/105320.html
Function gh-proxy($url='')
{
    git clone  http://gitproxy.ml/$url
}


Function ep(){
    explorer.exe .
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

