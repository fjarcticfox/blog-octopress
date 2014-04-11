---
layout: post
title: "Linux 查看系统配置常用命令"
date: 2014-04-10 12:47:27 +0800
comments: true
categories: [linux]
---

<!-- more -->

## 系统

```sh

uname -an                   # 查看内核/操作系统/ CPU 信息
head -n 1 /etc/issue        # 查看操作系统版本
cat /proc/cpuinfo           # 查看 CPU 信息
hostname                    # 查看计算机名
lspci -tv                   # 列出所有 PCI 设备
lsusb -tv                   # 列出所有 USB 设备
ismod                       # 列出加载的内核模块
env                         # 查看环境变量

```


## 资源

```sh

free  -m                    # 查看内存使用量和交换区使用量
df -h                       # 查看各分区使用情况
du -sh <目录名>              # 查看指定目录的大小
grep MemTotal /proc/meminfo # 查看内存总量
grep MemFree /proc/meminfo  # 查看空闲内存量
uptime                      # 查看系统运行时间、用户数、负载
cat /proc/loadavg           # 查看系统负载

```


## 磁盘和分区

```sh

mount | column -t           # 查看挂接的分区状态
fdisk  -l                   # 查看所有分区
swapon -s                   # 查看所有交换分区
hdparm -i /dev/hda          # 查看磁盘参数（仅适用于 IDE 设备）
dmesg | grep IDE            # 查看启动时 IDE 设备检测状况

```


## 网络

```sh

ifconfig                    # 查看所有网络接口的属性
iptables -L                 # 查看防火墙设置
route -n                    # 查看路由表
netstat -lntp               # 查看所有监听端口
netstat -antp               # 查看所有已经建立的连接
netstat -s                  # 查看网络统计信息

```


## 进程

```sh

ps -ef                      # 查看所有进程
top                         # 实时显示进程状态

```


## 用户

```sh

w                           # 查看活动用户
id <用户名>                  # 查看指定用户信息
last                        # 查看用户登录日志
cut -d: -f1 /etc/passwd     # 查看系统所有用户
cut -d: -f1 /etc/group      # 查看系统所有组
crontab -l                  # 查看当前用户的计划任务

```


## 服务

```sh

chkconfig --list            # 列出所有系统服务
chkconfig --list | grep on  # 列出所有启动的系统服务

```


## 程序

```sh

rpm -qa                     # 查看所有安装的软件包

```


## 其他

```sh

# 查看主板序列号
dmidecode | grep -i 'serial number'

# 用硬件检测程序 kuduz 探测新硬件
service kudzu start
service kudzu restart

# 查看 CPU 信息
cat /proc/cpuinfo
dmesg | grep -i 'cpu'
dmidecode -t processor

# 查看内存信息
cat /proc/meminfo
free -m
vmstat

# 查看板卡信息
cat /proc/pci

# 查看显卡/声卡信息
ispci | grep -i 'VGA'
dmesg | grep -i 'VGA'

# 查看网卡信息
dmesg | grep -i 'eth'
cat /etc/sysconfig/hwconf
grep -i 'eth'
lspci | grep -i 'eth'

# 查看 PCI 信息
lspci
cat /proc/pci

# 查看 USB 设备
cat /proc/bus/usb/devices

# 查看键盘和鼠标
cat /proc/bus/input/devices

# 查看系统硬盘信息和使用情况
fdisk
disk -l
df

# 查看各设备的中断请求（IRQ）
cat /proc/interrupts

# 查看系统体系结构
uname -an

# 查看及启动系统的 32 位或 64 位内核模式
isalist -v
isainfo -v
isainfo -b

# 查看硬件信息，包括 bios、cpu、内存等信息
dmidecode

# 测定当前的显示器刷新频率
/usr/sbin/ffbconfig -rev \?

# 查看系统配置
/usr/platform/sun4u/sbin/prtdiag -v

# 查看当前系统中已经应用的补丁
showrev -p

# 显示当前的运行级别
who -rH

# 查看当前的 bind 版本信息
nslookup -class=chaos -q=txt version.bind

# 查看硬件信息
dmesg | more

# 显示外设信息，如 usb、网卡等信息
lspci

# 查看已加载的驱动
lsnod
lshw

# 查看当前处理器的类型和速度（主频）
psrinfo -v

# 打印当前的 OBP 版本号
prtconf -v

# 查看硬盘物理信息（vendor、RPM、Capacity）
iostat -E

# 查看磁盘的几何参数和分区信息
prtvtoc /dev/rdsk/c0t0d0s

# 显示已经使用和未使用的 i-node 数目
df -F ufs -o i
isalist -v

# 对于“/proc”中文件可使用文件查看命令浏览其内容，文件中包含系统特定信息

    主机 CPU 信息：Cpuinfo
    主机 DMA 通道信息：Dma
    文件系统信息：Filesystems
    主机中断信息：Interrupts
    主机 I/O 端口号信息：Ioports
    主机内存信息：Meninfo
    Linux 内存版本信息：Version

    # 备注：proc - process infomation pseudo-filesystem 进程信息伪装文件系统

```


## 参考资料

[Linux 系统配置常用命令][1]


 [1]: http://7177526.blog.51cto.com/7167526/1392066