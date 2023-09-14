#!/bin/sh

arc=$(uname -a)
cpu=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
vcpu=$(grep "^processor" /proc/cpuinfo | sort -u | wc -l)
tram=$(free --mega | awk '$1 == "Mem:" {print $2}')
fram=$(free --mega | awk '$1 == "Mem:" {print $4}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $2/$3*100}')
fdisk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{t += $2} END {print t}')
udisk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{u += $3} END {print u}')
pdisk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{u += $3} {t+= $2} END {printf("%.1f"), u/t*100}')
cpul=$(top -bn1 | grep '^%Cpu' | cut -c 9- | awk '{printf("%.1f%%"), $1 + $3}')
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')
lvmt=$(lsblk | grep "lvm" | wc -l)
lvmu=$(if [ $lvmt -eq 0 ]; then echo no; else echo yes; fi)
ctcp=$(netstat -at | grep "ESTABLISHED" | wc -l)
ulog=$(who | wc -l)
ip=$(hostname -I)
mac=$(ip a| grep ether | awk '{print $2}')
cmds=$(journalctl _COMM=sudo -q | grep COMMAND | wc -l)

wall "
"#Architecture: " ${arc}
"#CPU physical : " ${cpu}
"#vCPU : " ${vcpu}
"#Memory Usage : " $uram/${fram}MB ($pram%)
"#Disk Usage : " $udisk/${fdisk}Gb ($pdisk%)
"#CPU load : " $cpul
"#Last boot : " $lb
"#LVM use : " $lvmu
"#Connexions TCP : " $ctcp ESTABLISHED
"#User log : " $ulog
"#Network : IP " $ip ($mac)
"#Sudo : " $cmds "cmd"
$ sudo cat /usr/local/bin/monitoring.sh
"


#sudo tail -f /var/log/syslog

#ufw / ssh status::
# $ sudo systemctl status ufw
# $ sudo systemctl status ssh

# checking operating system:
# $ uname -a

# Checking a username with your login:
# $ sudo cat /etc/passwd | grep <username>

# checking a group:
# $ getent group <name-group>

# Create new user:
# $ sudo adduser <username>
# delete user 
# $ sudo userdel <username>

# password policy file:
# sudo vim /etc/pam.d/common-password
# /etc/security/pwquality.conf
# $ sudo crontab -l


# password checking:
# $ chage -l <username>

# password changing dates:
# $ chage <username>

# creating group:
# $ sudo addgroup <group-name>
# delete group 
# $ sudo groupdel <group-name>

# assign the username to a group:
# $ sudo adduser <username> <groupname>

# check hostname login42:
# $ hostname

# modify hostname:
# $ sudo vim /etc/hostname
# sudo hostnamectl set-hostname ....
# $ sudo reboot

# view partitions:
# $ lsblk

# check that sudo/ssh/ufw is installed:
# $ dpkg -l | grep <package-name>

# sudo history:
# $ sudo cat /var/log/sudo/sudo.log
# sudo cat /etc/sudoers


# allowing or creating port:
# $ sudo ufw allow 8080
# $ sudo vim /etc/ssh/sshd_config
# $ sudo service ssh restart

# checking port:
# $ sudo ufw status


# Delete a port:

# $ sudo ufw allow delete 8080


# Log with newly created user with SSH:
# $ ssh <username>@<ip-add> -p 4242
