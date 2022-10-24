#! /bin/sh

source ./.common.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib
export PATH=$PATH:/mnt/c/Windows:/mnt/c/Windows/system32
export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin"
export PATH=$PATH:/home/lgf/.local/bin

# export PATH=$PATH:$HOME/.local/bin:/bin:/usr/bin:/usr/local/bin:/mnt/c/Windows:/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin

export PYENV_ROOR="$HOME/.pyenv"
export PATH=~/.pyenv/libexec:$PATH


# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# =====================wsl2 固定 ip==================
# wsl_conf="$(cat \
# <<'EOF'
# [boot]
# systemd=true
# [boot]
# systemd=true
# [network]
# generateResolvConf = false
# EOF
# )"
# echo "${wsl_conf}" > /etc/wsl.conf


# resolv_conf="$(cat \
# <<'EOF'
# nameserver 192.168.8.1
# EOF
# )"
# echo "${resolv_conf}" > /etc/resolv.conf

# cat << 'EOF' > /mnt/e/code/dev-env/wsl2-static-ip_ubuntu-20.04.bat
# @echo off
# %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
# wsl -d Ubuntu-20.04 -u root ip addr del $(ip addr show eth0 ^| grep 'inet\b' ^| awk '{print $2}' ^| head -n 1) dev eth0
# wsl -d Ubuntu-20.04 -u root ip addr add 192.168.8.2/24 broadcast 192.168.8.255 dev eth0
# wsl -d Ubuntu-20.04 -u root ip route add 0.0.0.0/0 via 192.168.8.1 dev eth0
# powershell -c "Get-NetAdapter 'vEthernet (WSL)' | Get-NetIPAddress | Remove-NetIPAddress -Confirm:$False; New-NetIPAddress -IPAddress 192.168.8.1 -PrefixLength 24 -InterfaceAlias 'vEthernet (WSL)'; Get-NetNat | ? Name -Eq WSLNat | Remove-NetNat -Confirm:$False; New-NetNat -Name WSLNat -InternalIPInterfaceAddressPrefix 192.168.8.0/24;"
# exit
# EOF


# # 无变量模式写入文件
# echo "${resolv_conf}" > /etc/resolv.conf

# wsl2设置静态IP: https://blog.csdn.net/witton/article/details/122390421
# cat << 'EOF' >> /etc/zsh/zprofile
# #获得物理网卡
# machine_physics_net=$(ls /sys/class/net/ | grep -v "`ls /sys/devices/virtual/net/`")
# #先过滤网卡，在查找IP，不要再awk中过滤网卡
# local_ip=$(ip addr | grep $machine_physics_net | awk '/^[0-9]+: / {}; /inet.*global/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}' | head -1)
# echo wsl ip is: $local_ip
# #if [ `ip addr | awk '/^[0-9]+: / {}; /inet.*global.*eth/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}'` != 192.168.8.2 ]; then
# #     cmd.exe /c "/mnt/e/code/dev-env/wsl2-static-ip_ubuntu-20.04.bat" 1>nul
# #     cmd.exe /c "E:\\code\\dev-env\\wsl2-static-ip_ubuntu-20.04.bat" 1>nul
# #fi

# if [ $local_ip != "192.168.8.2" ]; then
#   cmd.exe /c "E:\\code\\dev-env\\wsl2-static-ip_ubuntu-20.04.bat" 
# fi
# echo now, wsl ip is: $local_ip
# EOF

# =====================wsl2 固定 ip==================

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

#export DISPLAY=:0.0

#export DISPLAY=:0
#export WAYLAND_DISPLAY=wayland-0
#export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
#export PULSE_SERVER=/mnt/wslg/PulseServer

