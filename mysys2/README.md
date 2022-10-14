1. [使用msys2打造优雅的开发环境](https://www.cnblogs.com/52fhy/p/15158765.html)
2. [我是怎么在Windows下构建Rust开发环境的](https://zhuanlan.zhihu.com/p/237932497)


windows下常用的类似unix终端软件有git fow windows(内置简版msys2)、mingw、msys2、cgwin。

git fow windows： 不想折腾的同学，直接使用该软件就够用了。缺点是自带的预编译的软件包比较少。
mingw： 打包了gcc等编译器，默认没有git，自带的预编译的软件包比较少。
cygwin： 最全的类Unix环境支持。缺点：比较庞大。
msys2：自带大量预编译的软件包，提供pacman便捷安装git、zsh、gcc等软件。推荐使用该软件。
msys2产生的背景：由于 MinGW 万年不更新，MSYS 更是，Cygwin的许多新功能 MSYS 没有同步过来，于是 Alex 等人建立了新一代的 MSYS 项目。仍然是 fork 了 Cygwin（较新版），但有个更优秀的包管理器 pacman，有活跃的开发者跟用户组，有大量预编译的软件包（虽然肯定没有Cygwin多）。

注意：同时安装git fow windows和msys2，y运行命令可能出现"using incompatible versions of the cygwin DLL"问题。

windows 10新增的wsl2也可以作为开发环境备选。但是由于IO性能差，git操作非常慢，所以用的不多，而 msys2带有的 Bash 感觉是个不错的选择。

本文基于 msys2-bash + zsh + oh-my-zsh 搭建类UNIX开发环境，效果：



下面是详细内容。

安装msys2#
官网：https://www.msys2.org/

github: https://github.com/msys2/msys2-installer

镜像地址：https://mirrors.tuna.tsinghua.edu.cn/msys2/distrib/x86_64/

本文安装的版本是：https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-x86_64-20210725.exe

1、下载下来安装到C盘，完整路径：C:\msys64。没有特殊要求，请不要修改路径，后续都是参照这个路径增加功能。

2、配置环境变量。PATH里增加：C:\msys64\usr\bin。

配置pacman镜像#
pacman是arclinux中的软件管理工具，也是widows上msys2默认的软件管理工具。pacman可以直接从网络上的软件仓库下载安装及删除软件，自动处理依赖关系，类似ubuntu中的apt-get。

镜像地址：https://mirrors.tuna.tsinghua.edu.cn/help/msys2/

进入C:\msys64\etc\pacman.d目录，分别进行如下操作：

编辑 /etc/pacman.d/mirrorlist.mingw32 ，在文件开头添加：

Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/i686
编辑 /etc/pacman.d/mirrorlist.mingw64 ，在文件开头添加：

Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/x86_64
编辑 /etc/pacman.d/mirrorlist.ucrt64 ，在文件开头添加：

Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/ucrt64
编辑 /etc/pacman.d/mirrorlist.clang64 ，在文件开头添加：

Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/mingw/clang64
编辑 /etc/pacman.d/mirrorlist.msys ，在文件开头添加：

Server = https://mirrors.tuna.tsinghua.edu.cn/msys2/msys/$arch
点击安装路径的mingw64.exe启动，然后执行 pacman -Sy 刷新软件包数据即可。

配置好pacman 镜像源，就可以安装常用软件了。

安装常用软件#
git#
pacman -S git
命令行里输入git version 可以查看版本：

PS C:\Users\lenovo\Desktop> git version
git version 2.32.0
提示命令找不到可以重启试一下。

Oh My Zsh#
官方网站: http://ohmyz.sh

GitHub: https://github.com/ohmyzsh/ohmyzsh

pacman -S zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 或者 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
所以这时的zsh 基本已经配置完成,你需要一行命令就可以切换到 zsh 模式，终端下输入zsh切换，输入bash切回去。

ohmyzsh插件，路径：

~/.oh-my-zsh/plugins/
~/.oh-my-zsh/custom/plugins/
新增插件示例：

git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
启用插件：修改~/.zshrc文件，示例：

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
默认是plugins=(git)

执行下 source ~/.zshrc激活插件。

配置右键打开终端#
效果：



新建mingw64.reg后缀文件：

Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\mingw64]
@="MinGW64 Here"
"icon"="C:\\msys64\\mingw64.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\mingw64\command]
@="C:\\msys64\\msys2_shell.cmd -mingw64 -here"
双击导入即可。

配置 Windows Terminal 使用 msys2 bash#
核心参数：

名称：msys2

命令行：C:\msys64\usr\bin\bash.exe

icon: C:\msys64\msys2.ico

{
    "guid":"{1c4de342-38b7-51cf-b940-2309a097f589}",
    "hidden":false,
    "name":"Bash",
    "commandline":"C:\\msys64\\usr\\bin\\bash.exe",
    "historySize":9001,
    "closeOnExit":true,
    "useAcrylic":true,
    "acrylicOpacity":0.85,
    "icon":"C:\\msys64\\msys2.ico",
    "startingDirectory":null
}


配置 zsh 为 bash 默认终端#
编辑 ~/.bashrc，加入下面的几行。

# Launch Zsh
if [ -t 1 ]; then
exec zsh
fi
配置idea#
配置终端使用msys2 bash#
点击 File -> Settings -> Tools -> Terminal ，配置shell path:

C:\msys64\usr\bin\bash.exe
或者

C:\msys64\usr\bin\zsh.exe
这样就可以执行bash命令了。例如：

$ cd /d/Download/

$ ls | wc -l
81

$ which mvn
/e/opt/apache-maven-3.6.3/bin/mvn

$ cd ~
附录1: pacman常用命令#
pacman命令较多，作为新手，将个人最常用的命令总结如下：

pacman -Sy: 从服务器下载新的软件包数据库（实际上就是下载远程仓库最新软件列表到本地）。

pacman -Syu: 升级系统及所有已经安装的软件。

pacman -S 软件名: 安装软件。也可以同时安装多个包，只需以空格分隔包名即可。

pacman -Rs 软件名: 删除软件，同时删除本机上只有该软件依赖的软件。

pacman -Ru 软件名: 删除软件，同时删除不再被任何软件所需要的依赖。

pacman -Ssq 关键字: 在仓库中搜索含关键字的软件包，并用简洁方式显示。

pacman -Qs 关键字: 搜索已安装的软件包。

pacman -Qi 软件名: 查看某个软件包信息，显示软件简介,构架,依赖,大小等详细信息。

pacman -Sg: 列出软件仓库上所有的软件包组。

pacman -Sg 软件包组: 查看某软件包组所包含的所有软件包。

pacman -Sc：清理未安装的包文件，包文件位于 /var/cache/pacman/pkg/ 目录。

pacman -Scc：清理所有的缓存文件

附录2：解决vscode不识别git问题#
使用msys2环境安装git，vscode识别不出来git，在源代码管理菜单中显示当前打开的文件夹没有git存储库，打开的文件夹实际存在.git文件夹。

解决办法：

编写 git-wrap.bat：

@echo off
setlocal

rem If you don't add path for msys2 into %PATH%, enable following line.
rem set PATH=c:\msys64\usr\bin;%PATH%

if "%1" equ "rev-parse" goto rev_parse
git %*
goto :eof
:rev_parse
for /f %%1 in ('git %*') do cygpath -w %%1
将 git-wrap.bat放到某个文件夹，例如位于：c:\msys64\git-wrap.bat。

在vscode设置 git.path ：
点击： File -> Preferences -> User Settings, 搜索 git.path 将 git-wrap.bat写到配置文件里：

 "git.path": "C:\\msys64\\git-wrap.bat",
重启vscode

Have fun!

附录3：Windows Terminal右键#
编写wt.reg:

Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\wt]
@="Windows Terminal Here"

[HKEY_CLASSES_ROOT\Directory\Background\shell\wt\command]
@="C:\\Users\\你的用户名\\AppData\\Local\\Microsoft\\WindowsApps\\wt.exe"
注意替换"你的用户名"。

参考#
1、MSYS2
https://www.msys2.org/

2、Install Terminal + git-bash + zsh + oh-my-zsh on Windows 10 | MiaoTony's小窝
https://miaotony.xyz/2020/12/13/Server_Terminal_gitbash_zsh/

3、msys2软件包管理工具pacman常用命令_hustlei的专栏

https://blog.csdn.net/hustlei/article/details/86687621

4、玩转 Ubuntu 20 桌面版 - 飞鸿影 - 博客园
https://www.cnblogs.com/52fhy/p/9571463.html

(本文完)

本文优先在公众号"飞鸿影的博客(fhyblog)"发布，欢迎关注公众号及时获取最新文章推送！

作者：飞鸿影

出处：http://52fhy.cnblogs.com/

版权申明：没有标明转载或特殊申明均为作者原创。本文采用以下协议进行授权,自由转载 - 非商用 - 非衍生 - 保持署名 | Creative Commons BY-NC-ND 3.0，转载请注明作者及出处。


 分类: Linux
 1 0
« 上一篇： Iptables教程
» 下一篇： 信息是如何表示和存储的
posted @ 2021-08-18 20:50  飞鸿影  阅读(2503)  评论(1)  编辑  收藏  举报
