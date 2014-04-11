---
layout: post
title: "Linux 常用命令"
date: 2014-04-10 21:20:11 +0800
comments: true
categories: [linux]
---

<!-- more -->

初级用户：以下是初学者常用的一些命令。

## ls 命令

ls 命令是列出目录内容(List Directory Contents)的意思。运行它就是列出文件夹里的内容，可能是文件也可能是文件夹。

```sh

root@tecmint:~# ls

Android-Games                     Music
Pictures                          Public
Desktop                           Tecmint.com
Documents                         TecMint-Sync
Downloads                         Templates

# “ls -l”命令以详情模式(long listing fashion)列出文件夹的内容。
root@tecmint:~# ls -l

total 40588
drwxrwxr-x 2 ravisaive ravisaive     4096 May  8 01:06 Android Games
drwxr-xr-x 2 ravisaive ravisaive     4096 May 15 10:50 Desktop
drwxr-xr-x 2 ravisaive ravisaive     4096 May 16 16:45 Documents
drwxr-xr-x 6 ravisaive ravisaive     4096 May 16 14:34 Downloads
drwxr-xr-x 2 ravisaive ravisaive     4096 Apr 30 20:50 Music
drwxr-xr-x 2 ravisaive ravisaive     4096 May  9 17:54 Pictures
drwxrwxr-x 5 ravisaive ravisaive     4096 May  3 18:44 Tecmint.com
drwxr-xr-x 2 ravisaive ravisaive     4096 Apr 30 20:50 Templates

# "ls -a"命令会列出文件夹里的所有内容，包括以"."开头的隐藏文件。
root@tecmint:~# ls -a

.           .gnupg          .dbus           .goutputstream-PI5VVW       .mission-control
.adobe                  deja-dup                .grsync                 .mozilla                    .themes
.gstreamer-0.10         .mtpaint                .thumbnails             .gtk-bookmarks              .thunderbird
.HotShots               .mysql_history          .htaccess       .apport-ignore.xml          .ICEauthority           
.profile                .bash_history           .icons                  .bash_logout                    .fbmessenger
.jedit                  .pulse                  .bashrc                 .liferea_1.8                .pulse-cookie            
.Xauthority     .gconf                  .local                  .Xauthority.HGHVWW      .cache
.gftp                   .macromedia             .remmina                .cinnamon                       .gimp-2.8
.ssh                    .xsession-errors    .compiz                 .gnome                          teamviewer_linux.deb          
.xsession-errors.old    .config                 .gnome2                 .zoncolor

# 注意：在 Linux 中，文件以“.”开头的就是隐藏文件，并且每个文件，文件夹，设备或者命令都是以文件对待。ls -l 命令输出：
    
    1. d (代表了是目录)。
    2. rwxr-xr-x 是文件或者目录对所属用户，同一组用户和其它用户的权限。
    3. 上面例子中第一个ravisaive 代表了文件文件属于用户ravisaive
    4. 上面例子中的第二个ravisaive代表了文件文件属于用户组ravisaive
    5. 4096 代表了文件大小为4096字节。
    6。 May 8 01:06 代表了文件最后一次修改的日期和时间.
    7. 最后面的就是文件/文件夹的名字

```


## lsblk 命令

"lsblk"就是列出块设备。除了 RAM 外，以标准的树状输出格式，整齐地显示块设备。

```sh

root@tecmint:~# lsblk

NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 232.9G  0 disk 
├─sda1   8:1    0  46.6G  0 part /
├─sda2   8:2    0     1K  0 part 
├─sda5   8:5    0   190M  0 part /boot
├─sda6   8:6    0   3.7G  0 part [SWAP]
├─sda7   8:7    0  93.1G  0 part /data
└─sda8   8:8    0  89.2G  0 part /personal
sr0     11:0    1  1024M  0 rom

# “lsblk -l”命令以列表格式显示块设备(而不是树状格式)。
root@tecmint:~# lsblk -l

NAME MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda    8:0    0 232.9G  0 disk 
sda1   8:1    0  46.6G  0 part /
sda2   8:2    0     1K  0 part 
sda5   8:5    0   190M  0 part /boot
sda6   8:6    0   3.7G  0 part [SWAP]
sda7   8:7    0  93.1G  0 part /data
sda8   8:8    0  89.2G  0 part /personal
sr0   11:0    1  1024M  0 rom

# 注意：lsblk 是最有用和最简单的方式来了解新插入的 USB 设备的名字，特别是当你在终端上处理磁盘/块设备时。

```


## md5sum 命令

“md5sum”就是计算和检验 MD5 信息签名。md5 checksum(通常叫做哈希)使用匹配或者验证文件的文件的完整性，因为文件可能因为传输错误，磁盘错误或者无恶意的干扰等原因而发生改变。

```sh

root@tecmint:~# md5sum teamviewer_linux.deb 

47790ed345a7b7970fc1f2ac50c97002  teamviewer_linux.deb

# 注意：用户可以使用官方提供的和 md5sum 生成签名信息匹对以此检测文件是否改变。Md5sum 没有 sha1sum 安全，这点我们稍后讨论。

```


## dd命令

“dd”命令代表了转换和复制文件。可以用来转换和复制文件，大多数时间是用来复制 iso 文件(或任何其它文件)到一个 usb 设备(或任何其它地方)中去，所以可以用来制作 USB 启动器。

```sh

root@tecmint:~# dd if=/home/user/Downloads/debian.iso of=/dev/sdb1 bs=512M; sync

# 注意：在上面的例子中，usb 设备就是 sdb1（你应该使用 lsblk 命令验证它，否则你会重写你的磁盘或者系统），请慎重使用磁盘的名，切忌。

# dd 命令在执行中会根据文件的大小和类型 以及 usb 设备的读写速度，消耗几秒到几分钟不等。

```


## uname 命令

"uname"命令就是 Unix Name 的简写。显示机器名，操作系统和内核的详细信息。

```sh

root@tecmint:~# uname -a

Linux tecmint 3.8.0-19-generic #30-Ubuntu SMP Wed May 1 16:36:13 UTC 2013 i686 i686 i686 GNU/Linux

# 注意： uname 显示内核类别， uname -a 显示详细信息。上面的输出详细说明了 uname -a

    1. “Linux“: 机器的内核名
    2. “tecmint“: 机器的节点名
    3. “3.8.0-19-generic“: 内核发布版本
    4. “#30-Ubuntu SMP“: 内核版本
    5. “i686“: 处理器架构
    6。 “GNU/Linux“: 操作系统名

```


## history 命令

“history”命令就是历史记录。它显示了在终端中所执行过的所有命令的历史。

```sh

root@tecmint:~# history

 1  sudo add-apt-repository ppa:tualatrix/ppa
 2  sudo apt-get update
 3  sudo apt-get install ubuntu-tweak
 4  sudo add-apt-repository ppa:diesch/testing
 5  sudo apt-get update
 6  sudo apt-get install indicator-privacy
 7  sudo add-apt-repository ppa:atareao/atareao
 8  sudo apt-get update
 9  sudo apt-get install my-weather-indicator
 10 pwd
 11 cd && sudo cp -r unity/6 /usr/share/unity/
 12 cd /usr/share/unity/icons/
 13 cd /usr/share/unity

 # 注意：按住“CTRL + R”就可以搜索已经执行过的命令，它可以在你写命令时自动补全。

 (reverse-i-search)‘if': ifconfig

```


## sudo 命令

“sudo”(super user do)命令允许授权用户执行超级用户或者其它用户的命令。通过在 sudoers 列表的安全策略来指定。

```sh

root@tecmint:~# sudo add-apt-repository ppa:tualatrix/ppa

# 注意：sudo 允许用户借用超级用户的权限，然而"su"命令实际上是允许用户以超级用户登录。
# 所以 sudo 比 su 更安全。并不建议使用 sudo 或者 su 来处理日常用途，因为它可能导致严重的错误如果你意外的做错了事。
# 这就是为什么在 linux 社区流行一句话：“To err is human, but to really foul up everything, you need root password.”

```


## mkdir 命令

“mkdir”(Make directory)命令在命名路径下创建新的目录。然而如果目录已经存在了，那么它就会返回一个错误信息"不能创建文件夹，文件夹已经存在了"("cannot create folder, folder already exists")

```sh

root@tecmint:~# mkdir tecmint

# 注意：目录只能在用户拥有写权限的目录下才能创建。mkdir：不能创建目录`tecmint`，因为文件已经存在了。
# （上面的输出中不要被文件迷惑了，你应该记住我开头所说的-在 linux 中，文件，文件夹，驱动，命令，脚本都视为文件）

```


## touch 命令

“touch”命令代表了将文件的访问和修改时间更新为当前时间。touch命令只会在文件不存在的时候才会创建它。如果文件已经存在了，它会更新时间戳，但是并不会改变文件的内容。

```sh

root@tecmint:~# touch tecmintfile

# 注意：touch 可以用来在用户拥有写权限的目录下创建不存在的文件。

```


## chmod 命令

“chmod”命令就是改变文件的模式位。chmod 会根据要求的模式来改变每个所给的文件，文件夹，脚本等等的文件模式（权限）。

```sh

# 在文件(文件夹或者其它，为了简单起见，我们就使用文件)中存在3中类型的权限

    Read (r)=4
    Write(w)=2
    Execute(x)=1

# 所以如果你想给文件只读权限，就设置为'4';只写权限，设置权限为'2';只执行权限，设置为 1 ; 读写权限，就是 4 + 2 = 6, 以此类推。

# 现在需要设置 3 种用户和用户组权限。第一个是拥有者，然后是用户所在的组，最后是其它用户。
rwxr-x--x   abc.sh

# 这里 root 的权限是 rwx（读写和执行权限），
# 所属用户组权限是 r-x (只有读和执行权限, 没有写权限)，
# 对于其它用户权限是 -x(只有只执行权限)

# 为了改变它的权限，为拥有者，用户所在组和其它用户提供读，写，执行权限。
root@tecmint:~# chmod 777 abc.sh

# 三种都只有读写权限
root@tecmint:~# chmod 666 abc.sh

# 拥有者用户有读写和执行权限，用户所在的组和其它用户只有可执行权限
root@tecmint:~# chmod 711 abc.sh

# 注意：对于系统管理员和用户来说，这个命令是最有用的命令之一了。
# 在多用户环境或者服务器上，对于某个用户，如果设置了文件不可访问，那么这个命令就可以解决，如果设置了错误的权限，那么也就提供了为授权的访问。

```


## chown 命令

“chown”命令就是改变文件拥有者和所在用户组。每个文件都属于一个用户组和一个用户。在你的目录下，使用"ls -l",你就会看到像这样的东西。

```sh

root@tecmint:~# ls -l 

drwxr-xr-x 3 server root 4096 May 10 11:14 Binary 
drwxr-xr-x 2 server server 4096 May 13 09:42 Desktop

# 在这里，目录 Binary 属于用户"server",和用户组"root",而目录"Desktop"属于用户“server”和用户组"server"

# “chown”命令用来改变文件的所有权，所以仅仅用来管理和提供文件的用户和用户组授权。
root@tecmint:~# chown server:server Binary

drwxr-xr-x 3 server server 4096 May 10 11:14 Binary 
drwxr-xr-x 2 server server 4096 May 13 09:42 Desktop

# 注意：“chown”所给的文件改变用户和组的所有权到新的拥有者或者已经存在的用户或者用户组。

```


## apt 命令

Debian 系列以“apt”命令为基础，“apt”代表了 Advanced Package Tool。APT 是一个为 Debian 系列系统（Ubuntu，Kubuntu等等）开发的高级包管理器，在 Gnu/Linux 系统上，它会为包自动地，智能地搜索，安装，升级以及解决依赖。

```sh

root@tecmint:~# apt-get install mplayer

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  java-wrappers
Use 'apt-get autoremove' to remove it.
The following extra packages will be installed:
  esound-common libaudiofile1 libesd0 libopenal-data libopenal1 libsvga1 libvdpau1 libxvidcore4
Suggested packages:
  pulseaudio-esound-compat libroar-compat2 nvidia-vdpau-driver vdpau-driver mplayer-doc netselect fping
The following NEW packages will be installed:
  esound-common libaudiofile1 libesd0 libopenal-data libopenal1 libsvga1 libvdpau1 libxvidcore4 mplayer
0 upgraded, 9 newly installed, 0 to remove and 8 not upgraded.
Need to get 3,567 kB of archives.
After this operation, 7,772 kB of additional disk space will be used.
Do you want to continue [Y/n]? y

root@tecmint:~# apt-get update

Hit http://ppa.launchpad.net raring Release.gpg                                           
Hit http://ppa.launchpad.net raring Release.gpg                                           
Hit http://ppa.launchpad.net raring Release.gpg                      
Hit http://ppa.launchpad.net raring Release.gpg                      
Get:1 http://security.ubuntu.com raring-security Release.gpg [933 B] 
Hit http://in.archive.ubuntu.com raring Release.gpg                                                   
Hit http://ppa.launchpad.net raring Release.gpg                      
Get:2 http://security.ubuntu.com raring-security Release [40.8 kB]   
Ign http://ppa.launchpad.net raring Release.gpg                                                  
Get:3 http://in.archive.ubuntu.com raring-updates Release.gpg [933 B]                            
Hit http://ppa.launchpad.net raring Release.gpg                                                                
Hit http://in.archive.ubuntu.com raring-backports Release.gpg

# 注意：上面的命令会导致系统整体的改变，所以需要 root 密码（查看提示符为"#"，而不是“$”）.和 yum 命令相比，Apt 更高级和智能。

# 见名知义，apt-cache 用来搜索包中是否包含子包 mplayer, apt-get 用来安装，升级所有的已安装的包到最新版。

```

关于 apt-get 和 apt-cache 命令更多信息，请查看 [25 APT-GET和APT-CACHE命令][1]


## tar 命令

“tar”命令是磁带归档(Tape Archive)，对创建一些文件的的归档和它们的解压很有用。

```sh

root@tecmint:~# tar -zxvf abc.tar.gz (记住'z'代表了.tar.gz)

root@tecmint:~# tar -jxvf abc.tar.bz2 (记住'j'代表了.tar.bz2)

root@tecmint:~# tar -cvf archieve.tar.gz(.bz2) /path/to/folder/abc

# 注意： "tar.gz"代表了使用 gzip 归档，“bar.bz2”使用 bzip 压缩的，它压缩的更好但是也更慢。

```

了解更多"tar 命令"的例子，请查看 [18 Tar命名例子][2]


## cal 命令

“cal”（Calender），它用来显示当前月份或者未来或者过去任何年份中的月份。

```sh

root@tecmint:~# cal 

May 2013        
Su Mo Tu We Th Fr Sa  
          1  2  3  4  
 5  6  7  8  9 10 11  
12 13 14 15 16 17 18  
19 20 21 22 23 24 25  
26 27 28 29 30 31

# 显示已经过去的月份，1835 年 2 月
root@tecmint:~# cal 02 1835

   February 1835      
Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7  
 8  9 10 11 12 13 14  
15 16 17 18 19 20 21  
22 23 24 25 26 27 28

# 显示未来的月份，2145 年 7 月。
root@tecmint:~# cal 07 2145

     July 2145        
Su Mo Tu We Th Fr Sa  
             1  2  3  
 4  5  6  7  8  9 10  
11 12 13 14 15 16 17  
18 19 20 21 22 23 24  
25 26 27 28 29 30 31

# 注意： 你不需要往回调整日历 50 年，既不用复杂的数据计算你出生那天，也不用计算你的生日在哪天到来，因为它的最小单位是月，而不是日。

```


## date 命令

“date”命令使用标准的输出打印当前的日期和时间，也可以深入设置。

```sh

root@tecmint:~# date

Fri May 17 14:13:29 IST 2013

root@tecmint:~# date --set='14 may 2013 13:57' 

Mon May 13 13:57:00 IST 2013

# 注意：这个命令在脚本中十分有用，以及基于时间和日期的脚本更完美。而且在终端中改变日期和时间，让你更专业！！！（当然你需要 root 权限才能操作这个，因为它是系统整体改变）

```


## cat 命令

“cat”代表了连结（Concatenation），连接两个或者更多文本文件或者以标准输出形式打印文件的内容。

```sh

root@tecmint:~# cat a.txt b.txt c.txt d.txt abcd.txt

root@tecmint:~# cat abcd.txt
....
contents of file abcd
...

# 注意：“>>”和“>”调用了追加符号。它们用来追加到文件里，而不是显示在标准输出上。“>”符号会删除已存在的文件，然后创建一个新的文件。所以因为安全的原因，建议使用“>>”，它会写入到文件中，而不是覆盖或者删除。

```

在深入探究之前，我必须让你知道通配符(你应该知道通配符，它出现在大多数电视选秀中)。通配符是 shell 的特色，和任何 GUI 文件管理器相比，它使命令行更强大有力！如你所看到那样，在一个图形文件管理器中，你想选择一大组文件，你通常不得不使用你的鼠标来选择它们。这可能觉得很简单，但是事实上，这种情形很让人沮丧！

例如，假如你有一个有很多很多各种类型的文件和子目录的目录，然后你决定移动所有文件名中包含“Linux”字样的 HTML 文件到另外一个目录。如何简单的完成这个？如果目录中包含了大量的不同名的 HTML 文件，你的任务很巨大，而不是简单了。

在 Linux CLI 中，这个任务就很简单，就好像只移动一个 HTML 文件，因为有 shell 的通配符，才会如此简单。这些是特殊的字符，允许你选择匹配某种字符模式的文件名。它帮助你来选择，即使是大量文件名中只有几个字符，而且在大多数情形中，它比使用鼠标选择文件更简单。

这里就是常用通配符列表：

    Wildcard Matches
    *            零个或者更多字符
    ?            恰好一个字符
    [abcde]             恰好列举中的一个字符
    [a-e]          恰好在所给范围中的一个字符
    [!abcde]        任何字符都不在列举中 
    [!a-e]          任何字符都不在所给的范围中
    {debian,linux}      恰好在所给选项中的一整个单词

! 叫做非，带'!'的反向字符串为真

更多请阅读Linux cat 命令的实例 [13 Linux中cat命令实例][3]


## cp 命令

“copy”就是复制。它会从一个地方复制一个文件到另外一个地方。

```sh

root@tecmint:~# cp /home/user/Downloads abc.tar.gz /home/user/Desktop (Return 0 when sucess)

# 注意： cp，在 shell 脚本中是最常用的一个命令，而且它可以使用通配符（在前面一块中有所描述），来定制所需的文件的复制。

```


## mv 命令

“mv”命令将一个地方的文件移动到另外一个地方去。

```sh

root@tecmint:~# mv /home/user/Downloads abc.tar.gz /home/user/Desktop (Return 0 when sucess)

# 注意：mv 命令可以使用通配符。mv 需谨慎使用，因为移动系统的或者未授权的文件不但会导致安全性问题，而且可能系统崩溃。

```


## pwd 命令

“pwd”（print working directory），在终端中显示当前工作目录的全路径。

```sh

root@tecmint:~# pwd 

/home/user/Desktop

# 注意： 这个命令并不会在脚本中经常使用，但是对于新手，当从连接到 nux 很久后在终端中迷失了路径，这绝对是救命稻草。

```


## cd 命令

最后，经常使用的“cd”命令代表了改变目录。它在终端中改变工作目录来执行，复制，移动，读，写等等操作。

```sh

root@tecmint:~# cd /home/user/Desktop

server@localhost:~$ pwd

/home/user/Desktop

# 注意： 在终端中切换目录时，cd 就大显身手了。“cd ～”会改变工作目录为用户的家目录，而且当用户发现自己在终端中迷失了路径时，非常有用。“cd ..”从当前工作目录切换到(当前工作目录的)父目录。

```


中级用户：下面你将学会如何进行自定义搜索，知道正在进行的进程和停掉进程，如何使用Linux的强势功能和如何在系统内编译C，C++和JAVA程序。

## 命令: find

搜索指定目录下的文件，从开始于父目录，然后搜索子目录。

```sh

root@tecmint:~# find -name *.sh 

./Desktop/load.sh 
./Desktop/test.sh 
./Desktop/shutdown.sh 
./Binary/firefox/run-mozilla.sh 
./Downloads/kdewebdev-3.5.8/quanta/scripts/externalpreview.sh 
./Downloads/kdewebdev-3.5.8/admin/doxygen.sh 
./Downloads/kdewebdev-3.5.8/admin/cvs.sh 
./Downloads/kdewebdev-3.5.8/admin/ltmain.sh 
./Downloads/wheezy-nv-install.sh

# 注意： `-name‘选项是搜索大小写敏感。可以使用`-iname‘选项，这样在搜索中可以忽略大小写。（* 是通配符，可以搜索所有的文件；‘.sh‘你可以使用文件名或者文件名的一部分来制定输出结果）

root@tecmint:~# find -iname *.SH ( find -iname *.Sh /  find -iname *.sH)

./Desktop/load.sh 
./Desktop/test.sh 
./Desktop/shutdown.sh 
./Binary/firefox/run-mozilla.sh 
./Downloads/kdewebdev-3.5.8/quanta/scripts/externalpreview.sh 
./Downloads/kdewebdev-3.5.8/admin/doxygen.sh 
./Downloads/kdewebdev-3.5.8/admin/cvs.sh 
./Downloads/kdewebdev-3.5.8/admin/ltmain.sh 
./Downloads/wheezy-nv-install.sh

root@tecmint:~# find -name *.tar.gz 

/var/www/modules/update/tests/aaa_update_test.tar.gz 
./var/cache/flashplugin-nonfree/install_flash_player_11_linux.i386.tar.gz 
./home/server/Downloads/drupal-7.22.tar.gz 
./home/server/Downloads/smtp-7.x-1.0.tar.gz 
./home/server/Downloads/noreqnewpass-7.x-1.2.tar.gz 
./usr/share/gettext/archive.git.tar.gz 
./usr/share/doc/apg/php.tar.gz 
./usr/share/doc/festival/examples/speech_pm_1.0.tar.gz 
./usr/share/doc/argyll/examples/spyder2.tar.gz 
./usr/share/usb_modeswitch/configPack.tar.gz

# 注意：以上命令查找根目录下和所有文件夹以及加载的设备的子目录下的所有包含‘tar.gz'的文件。

```

’find'命令的更详细信息请参考 [35 Find Command Examples in Linux][8]


## 命令: grep

‘grep‘命令搜索指定文件中包含给定字符串或者单词的行。举例搜索‘/etc/passwd‘文件中的‘tecmint'

```sh

root@tecmint:~# grep tecmint /etc/passwd 

tecmint:x:1000:1000:Tecmint,,,:/home/tecmint:/bin/bash

# 使用’-i'选项将忽略大小写。
root@tecmint:~# grep -i TECMINT /etc/passwd 

tecmint:x:1000:1000:Tecmint,,,:/home/tecmint:/bin/bash

# 使用’-r'选项递归搜索所有自目录下包含字符串 “127.0.0.1“.的行。

root@tecmint:~# grep -r "127.0.0.1" /etc/ 

/etc/vlc/lua/http/.hosts:127.0.0.1
/etc/speech-dispatcher/modules/ivona.conf:#IvonaServerHost "127.0.0.1"
/etc/mysql/my.cnf:bind-address      = 127.0.0.1
/etc/apache2/mods-available/status.conf:    Allow from 127.0.0.1 ::1
/etc/apache2/mods-available/ldap.conf:    Allow from 127.0.0.1 ::1
/etc/apache2/mods-available/info.conf:    Allow from 127.0.0.1 ::1
/etc/apache2/mods-available/proxy_balancer.conf:#    Allow from 127.0.0.1 ::1
/etc/security/access.conf:#+ : root : 127.0.0.1
/etc/dhcp/dhclient.conf:#prepend domain-name-servers 127.0.0.1;
/etc/dhcp/dhclient.conf:#  option domain-name-servers 127.0.0.1;
/etc/init/network-interface.conf:   ifconfig lo 127.0.0.1 up || true
/etc/java-6-openjdk/net.properties:# localhost & 127.0.0.1).
/etc/java-6-openjdk/net.properties:# http.nonProxyHosts=localhost|127.0.0.1
/etc/java-6-openjdk/net.properties:# localhost & 127.0.0.1).
/etc/java-6-openjdk/net.properties:# ftp.nonProxyHosts=localhost|127.0.0.1
/etc/hosts:127.0.0.1    localhost

# 注意：您还可以使用以下选项：
    
    1. -w 搜索单词 (egrep -w ‘word1|word2‘ /path/to/file)。
    2. -c 用于统计满足要求的行 (i.e., total number of times the pattern matched) (grep -c ‘word‘ /path/to/file)。
    3. –color 彩色输出 (grep –color server /etc/passwd)。

```


## 命令: man

‘man‘是系统帮助页。Man 提供命令所有选项及用法的在线文档。几乎所有的命令都有它们的帮助页，例如：

```sh

root@tecmint:~# man man

MAN(1)                                                               Manual pager utils                                                              MAN(1)

NAME
       man - an interface to the on-line reference manuals

SYNOPSIS
       man  [-C  file]  [-d]  [-D]  [--warnings[=warnings]]  [-R  encoding]  [-L  locale]  [-m  system[,...]]  [-M  path]  [-S list] [-e extension] [-i|-I]
       [--regex|--wildcard] [--names-only] [-a] [-u] [--no-subpages] [-P pager] [-r prompt] [-7] [-E encoding] [--no-hyphenation] [--no-justification]  [-p
       string] [-t] [-T[device]] [-H[browser]] [-X[dpi]] [-Z] [[section] page ...] ...
       man -k [apropos options] regexp ...
       man -K [-w|-W] [-S list] [-i|-I] [--regex] [section] term ...
       man -f [whatis options] page ...
       man -l [-C file] [-d] [-D] [--warnings[=warnings]] [-R encoding] [-L locale] [-P pager] [-r prompt] [-7] [-E encoding] [-p string] [-t] [-T[device]]
       [-H[browser]] [-X[dpi]] [-Z] file ...
       man -w|-W [-C file] [-d] [-D] page ...
       man -c [-C file] [-d] [-D] page ...
       man [-hV]

# 上面是 man 命令的系统帮助页，类似的有 cat 和 ls 的帮助页。
# 注意：系统帮助页是为了命令的使用和学习而设计的。

```


## 命令: ps

ps命令给出正在运行的某个进程的状态，每个进程有特定的 id 成为 PID。

```sh

root@tecmint:~# ps

 PID TTY          TIME CMD
 4170 pts/1    00:00:00 bash
 9628 pts/1    00:00:00 ps

 # 使用‘-A‘选项可以列出所有的进程及其 PID。

root@tecmint:~# ps -A

 PID TTY          TIME CMD
    1 ?        00:00:01 init
    2 ?        00:00:00 kthreadd
    3 ?        00:00:01 ksoftirqd/0
    5 ?        00:00:00 kworker/0:0H
    7 ?        00:00:00 kworker/u:0H
    8 ?        00:00:00 migration/0
    9 ?        00:00:00 rcu_bh
....

# 注意：当你要知道有哪些进程在运行或者需要知道想杀死的进程 PID 时 ps 命令很管用。你可以把它与‘grep‘合用来查询指定的输出结果，例如：
root@tecmint:~# ps -A | grep -i ssh

 1500 ?        00:09:58 sshd
 4317 ?        00:00:00 sshd

 # ps 命令与 grep 命令用管道线分割可以得到我们想要的结果。

```


## 命令: kill

也许你从命令的名字已经猜出是做什么的了,kill 是用来杀死已经无关紧要或者没有响应的进程.它是一个非常有用的命令,而不是非常非常有用.你可能很熟悉 Windows 下要杀死进程可能需要频繁重启机器因为一个在运行的进程大部分情况下不能够杀死,即使杀死了进程也需要重新启动操作系统才能生效.但在 linux 环境下,事情不是这样的.你可以杀死一个进程并且重启它而不是重启整个操作系统.

杀死一个进程需要知道进程的 PID.

```sh

# 假设你想杀死已经没有响应的‘apache2'进程,运行如下命令:
root@tecmint:~# ps -A | grep -i apache2

1285 ?        00:00:00 apache2

# 搜索‘apache2'进程,找到 PID 并杀掉它.例如:在本例中‘apache2'进程的 PID 是 1285..
root@tecmint:~# kill 1285 (to kill the process apache2)

# 注意:每次你重新运行一个进程或者启动系统,每个进程都会生成一个新的 PID.你可以使用 ps 命令获得当前运行进程的 PID.

# 另一个杀死进程的方法是:
root@tecmint:~# pkill apache2

# 注意:kill 需要 PID 作为参数,pkill 可以选择应用的方式,比如指定进程的所有者等.

```


## 命令: whereis

whereis的作用是用来定位命令的二进制文件\资源\或者帮助页.举例来说,获得ls和kill命令的二进制文件/资源以及帮助页:

```sh

root@tecmint:~# whereis ls 

ls: /bin/ls /usr/share/man/man1/ls.1.gz

root@tecmint:~# whereis kill

kill: /bin/kill /usr/share/man/man2/kill.2.gz /usr/share/man/man1/kill.1.gz

# 注意:当需要知道二进制文件保存位置时有用.

```


## 命令: service

‘service‘命令控制服务的启动、停止和重启，它让你能够不重启整个系统就可以让配置生效以开启、停止或者重启某个服务。

```sh

# 在 Ubuntu 上启动 apache2 server：
root@tecmint:~# service apache2 start

 * Starting web server apache2                                                                                                                                 apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName
httpd (pid 1285) already running                        [ OK ]

# 重启 apache2 server：
root@tecmint:~# service apache2 restart

* Restarting web server apache2                                                                                                                               apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName
 ... waiting .apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName  [ OK ]

 # 停止 apache2 server：
root@tecmint:~# service apache2 stop

 * Stopping web server apache2                                                                                                                                 apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName
 ... waiting                                                                [ OK ]

 # 注意：要想使用 service 命令，进程的脚本必须放在‘/etc/init.d‘，并且路径必须在指定的位置。
 # 如果要运行“service apache2 start”实际上实在执行“service /etc/init.d/apache2 start”.

```


## 命令: alias

alias 是一个系统自建的 shell 命令，允许你为名字比较长的或者经常使用的命令指定别名。

```sh

# 我经常用‘ls -l‘命令，它有五个字符（包括空格）。于是我为它创建了一个别名‘l'。
root@tecmint:~# alias l='ls -l'

# 试试它是否能用：
root@tecmint:~# l

total 36 
drwxr-xr-x 3 tecmint tecmint 4096 May 10 11:14 Binary 
drwxr-xr-x 3 tecmint tecmint 4096 May 21 11:21 Desktop 
drwxr-xr-x 2 tecmint tecmint 4096 May 21 15:23 Documents 
drwxr-xr-x 8 tecmint tecmint 4096 May 20 14:56 Downloads 
drwxr-xr-x 2 tecmint tecmint 4096 May  7 16:58 Music 
drwxr-xr-x 2 tecmint tecmint 4096 May 20 16:17 Pictures 
drwxr-xr-x 2 tecmint tecmint 4096 May  7 16:58 Public 
drwxr-xr-x 2 tecmint tecmint 4096 May  7 16:58 Templates 
drwxr-xr-x 2 tecmint tecmint 4096 May  7 16:58 Videos

# 去掉’l'别名，要使用 unalias 命令：
root@tecmint:~# unalias l

# 再试试：
root@tecmint:~# l

bash: l: command not found

```


## 命令: df

报告系统的磁盘使用情况。在跟踪磁盘使用情况方面对于普通用户和系统管理员都很有用。 ‘df‘ 通过检查目录大小工作，但这一数值仅当文件关闭时才得到更新。

```sh

root@tecmint:~# df

Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1       47929224 7811908  37675948  18% /
none                   4       0         4   0% /sys/fs/cgroup
udev             1005916       4   1005912   1% /dev
tmpfs             202824     816    202008   1% /run
none                5120       0      5120   0% /run/lock
none             1014120     628   1013492   1% /run/shm
none              102400      44    102356   1% /run/user
/dev/sda5         184307   79852     94727  46% /boot
/dev/sda7       95989516   61104  91045676   1% /data
/dev/sda8       91953192   57032  87218528   1% /personal

```

‘df’命令的更多例子请参阅 [12 df Command Examples in Linux.][9]


## 命令: du

估计文件的空间占用。 逐层统计文件（例如以递归方式）并输出摘要。

```sh

root@tecmint:~# du

8       ./Daily Pics/wp-polls/images/default_gradient
8       ./Daily Pics/wp-polls/images/default
32      ./Daily Pics/wp-polls/images
8       ./Daily Pics/wp-polls/tinymce/plugins/polls/langs
8       ./Daily Pics/wp-polls/tinymce/plugins/polls/img
28      ./Daily Pics/wp-polls/tinymce/plugins/polls
32      ./Daily Pics/wp-polls/tinymce/plugins
36      ./Daily Pics/wp-polls/tinymce
580     ./Daily Pics/wp-polls
1456    ./Daily Pics
36      ./Plugins/wordpress-author-box
16180   ./Plugins
12      ./May Articles 2013/Xtreme Download Manager
4632    ./May Articles 2013/XCache

# 注意: ‘df‘只显示文件系统的使用统计，但‘du‘统计目录内容。

```

‘du‘命令的更详细信息请参阅 [10 du (Disk Usage) Commands][10].


## 命令: rm

'rm' 标准移除命令。 rm 可以用来删除文件和目录。

```sh

# 删除目录
root@tecmint:~# rm PassportApplicationForm_Main_English_V1.0

rm: cannot remove 'PassportApplicationForm_Main_English_V1.0': Is a directory

# 'rm' 不能直接删除目录,需要加上相应的'-rf'参数才可以。
root@tecmint:~# rm -rf PassportApplicationForm_Main_English_V1.0

# 警告: "rm -rf" 命令是一个破坏性的命令,假如你不小心删除一个错误的目录。一旦你使用'rm -rf' 删除一个目录,在目录中所有的文件包括目录本身会被永久的删除,所以使用这个命令要非常小心。

```


## 命令: echo

echo 的功能正如其名，就是基于标准输出打印一段文本。它和 shell 无关，shell 也不读取通过 echo 命令打印出的内容。然而在一种交互式脚本中，echo 通过终端将信息传递给用户。它是在脚本语言，交互式脚本语言中经常用到的命令。

```sh

root@tecmint:~# echo "Tecmint.com is a very good website" 

Tecmint.com is a very good website

# 创建一小段交互式脚本
    
    1. 在桌面上新建一个文件，命名为 ‘interactive_shell.sh‘  (记住必须带 ‘.sh‘扩展名)。
    2. 复制粘贴如下脚本代码，确保和下面的一致。

        #!/bin/bash
        echo "Please enter your name:"
        read name
        echo "Welcome to Linux $name"

    3. 接下来，设置执行权限并运行脚本。

        root@tecmint:~# chmod 777 interactive_shell.sh

        root@tecmint:~# ./interactive_shell.sh

        Please enter your name:
        Ravi Saive
        Welcome to Linux Ravi Saive

# 注意: ‘#!/bin/bash‘ 告诉 shell 这是一个脚本，并且在脚本首行写上这句话是个好习惯。. ‘read‘ 读取给定的输出.

```


## 命令: passwd

这是一个很重要的命令，在终端中用来改变自己密码很有用。显然的，因为安全的原因，你需要知道当前的密码。

```sh

root@tecmint:~# passwd 

Changing password for tecmint. 
(current) UNIX password: ******** 
Enter new UNIX password: ********
Retype new UNIX password: ********
Password unchanged   [这里表示密码未改变，例如：新密码=旧密码]
Enter new UNIX password: #####
Retype new UNIX password:#####

```


## 命令: lpr

这个命令用来在命令行上将指定的文件在指定的打印机上打印。

```sh

root@tecmint:~# lpr -P deskjet-4620-series 1-final.pdf

# 注意： "lpq"命令让你查看打印机的状态（是开启状态还是关闭状态）和等待打印中的工作(文件)的状态。

```


## 命令: cmp

比较两个任意类型的文件并将结果输出至标准输出。如果两个文件相同， ‘cmp‘默认返回0；如果不同，将显示不同的字节数和第一处不同的位置。

```sh

# 以下面两个文件为例：
# file1.txt
root@tecmint:~# cat file1.txt

Hi My name is Tecmint

# file2.txt
root@tecmint:~# cat file2.txt

Hi My name is tecmint [dot] com

# 比较一下这两个文件，看看命令的输出。
root@tecmint:~# cmp file1.txt file2.txt 

file1.txt file2.txt differ: byte 15, line 1

```


## 命令: wget

Wget是用于非交互式（例如后台）下载文件的免费工具.支持HTTP, HTTPS, FTP协议和 HTTP 代理。

```sh

# 使用wget下载ffmpeg
root@tecmint:~# wget http://downloads.sourceforge.net/project/ffmpeg-php/ffmpeg-php/0.6.0/ffmpeg-php-0.6.0.tbz2

--2013-05-22 18:54:52--  http://downloads.sourceforge.net/project/ffmpeg-php/ffmpeg-php/0.6.0/ffmpeg-php-0.6.0.tbz2
Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
HTTP request sent, awaiting response... 302 Found
Location: http://kaz.dl.sourceforge.net/project/ffmpeg-php/ffmpeg-php/0.6.0/ffmpeg-php-0.6.0.tbz2 [following]
--2013-05-22 18:54:54--  http://kaz.dl.sourceforge.net/project/ffmpeg-php/ffmpeg-php/0.6.0/ffmpeg-php-0.6.0.tbz2
Resolving kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)... 92.46.53.163
Connecting to kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)|92.46.53.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 275557 (269K) [application/octet-stream]
Saving to: ‘ffmpeg-php-0.6.0.tbz2’

100%[===========================================================================>] 2,75,557    67.8KB/s   in 4.0s   

2013-05-22 18:55:00 (67.8 KB/s) - ‘ffmpeg-php-0.6.0.tbz2’ saved [275557/275557]

```


## 命令: mount

mount 是一个很重要的命令，用来挂载不能自动挂载的文件系统。你需要 root 权限挂载设备。

```sh

# 在插入你的文件系统后，首先运行"lsblk"命令，识别出你的设备，然后把分配的设备名记下来。
root@tecmint:~# lsblk 

NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT 
sda      8:0    0 931.5G  0 disk 
├─sda1   8:1    0 923.6G  0 part / 
├─sda2   8:2    0     1K  0 part 
└─sda5   8:5    0   7.9G  0 part [SWAP] 
sr0     11:0    1  1024M  0 rom  
sdb      8:16   1   3.7G  0 disk 
└─sdb1   8:17   1   3.7G  0 part

# 从这个输出上来看，很明显我插入的是 4GB 的 U 盘，因而“sdb1”就是要挂载上来的文件系统。以 root 用户操作，然后切换到 /dev 目录，它是所有文件系统挂载的地方。
root@tecmint:~# su
Password:

root@tecmint:~# cd /dev

# 创建一个任何名字的目录，但是最好和引用相关。
root@tecmint:~# mkdir usb

# 现在将“sdb1”文件系统挂载到“usb”目录.
root@tecmint:~# mount /dev/sdb1 /dev/usb

```


## 命令: gcc

gcc 是 Linux 环境下 C 语言的内建编译器。下面是一个简单的 C 程序，在桌面上保存为 Hello.c （记住必须要有‘.c‘扩展名）。

```c

#include <stdio.h>
int main()
{
  printf("Hello world\n");
  return 0;
}

```

```sh

# 编译
root@tecmint:~# gcc Hello.c

# 运行
root@tecmint:~# ./a.out 

Hello world

# 注意: 编译 C 程序时，输出会自动保存到一个名为“a.out”的新文件，因此每次编译C程序“a.out”都会被修改。 因此编译期间最好定义输出文件名.，这样就不会有覆盖输出文件的风险了。

# 用这种方法编译
root@tecmint:~# gcc -o Hello Hello.c

# 这里‘-o‘将输出写到‘Hello‘文件而不是 ‘a.out‘。再运行一次。
root@tecmint:~# ./Hello

Hello world

```


## 命令: g++

g++ 是 C++ 的内建编译器。下面是一个简单的 C++ 程序，在桌面上保存为 Add.cpp （记住必须要有‘.cpp‘扩展名）。

```cpp

#include <iostream>

using namespace std;

int main() 
{
    int a;
    int b;
    cout<<"Enter first number:\n";
    cin >> a;
    cout <<"Enter the second number:\n";
    cin>> b;
    cin.ignore();
    int result = a + b;
    cout<<"Result is"<<"  "<<result<<endl;
    cin.get();
    return 0;
}

```

```sh

# 编译
root@tecmint:~# g++ Add.cpp

# 运行
root@tecmint:~# ./a.out

Enter first number: 
...
...

# 注意：编译 C++ 程序时，输出会自动保存到一个名为“a.out”的新文件，因此每次编译 C++ 程序 “a.out”都会被修改。 因此编译期间最好定义输出文件名.，这样就不会有覆盖输出文件的风险了。

# 用这种方法编译
root@tecmint:~# g++ -o Add Add.cpp

# 运行
root@tecmint:~# ./Add 

Enter first number: 
...
...

```


## 命令：java

Java 是世界上使用最广泛的编程语言之一. 它也被认为是高效, 安全和可靠的编程语言. 现在大多数基于网络的服务都使用 Java实 现.

拷贝以下代码到一个文件就可以创建一个简单的 Java 程序. 不妨把文件命名为 tecmint.java (记住：'.java'扩展名是必需的).

```java

class tecmint {
  public static void main(String[] arguments) {
    System.out.println("Tecmint ");
  }
}

```

```sh

# 用 javac 编译 tecmint.java
root@tecmint:~# javac tecmint.java

# 运行
root@tecmint:~# java tecmint

# 注意：几乎所有的 Linux 发行版都带有 gcc 编译器, 大多数发行版都内建了 g++ 和 java 编译器, 有些也可能没有. 你可以用 apt 或 yum 安装需要的包.

```


高级用户：以下将解释管理 Linux 服务器所需的一些命令。

## 命令：ifconfig

ifconfig 用来配置常驻内核的网络接口信息。在系统启动必要时用来设置网络适配器的信息。之后，它通常是只需要在调试时或当系统需要调整时使用。

```sh

# 检查活动网络适配器
[avishek@tecmint ~]$ ifconfig 

eth0      Link encap:Ethernet  HWaddr 40:2C:F4:EA:CF:0E  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0 
          inet6 addr: fe80::422c:f4ff:feea:cf0e/64 Scope:Link 
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1 
          RX packets:163843 errors:0 dropped:0 overruns:0 frame:0 
          TX packets:124990 errors:0 dropped:0 overruns:0 carrier:0 
          collisions:0 txqueuelen:1000 
          RX bytes:154389832 (147.2 MiB)  TX bytes:65085817 (62.0 MiB) 
          Interrupt:20 Memory:f7100000-f7120000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0 
          inet6 addr: ::1/128 Scope:Host 
          UP LOOPBACK RUNNING  MTU:16436  Metric:1 
          RX packets:78 errors:0 dropped:0 overruns:0 frame:0 
          TX packets:78 errors:0 dropped:0 overruns:0 carrier:0 
          collisions:0 txqueuelen:0 
          RX bytes:4186 (4.0 KiB)  TX bytes:4186 (4.0 KiB)

# 检查所有的网络适配器
# “-a”参数用来显示所有网络适配器(网卡)的详细信息,包括那些停用的适配器。
[avishek@tecmint ~]$ ifconfig -a

eth0      Link encap:Ethernet  HWaddr 40:2C:F4:EA:CF:0E  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0 
          inet6 addr: fe80::422c:f4ff:feea:cf0e/64 Scope:Link 
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1 
          RX packets:163843 errors:0 dropped:0 overruns:0 frame:0 
          TX packets:124990 errors:0 dropped:0 overruns:0 carrier:0 
          collisions:0 txqueuelen:1000 
          RX bytes:154389832 (147.2 MiB)  TX bytes:65085817 (62.0 MiB) 
          Interrupt:20 Memory:f7100000-f7120000 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0 
          inet6 addr: ::1/128 Scope:Host 
          UP LOOPBACK RUNNING  MTU:16436  Metric:1 
          RX packets:78 errors:0 dropped:0 overruns:0 frame:0 
          TX packets:78 errors:0 dropped:0 overruns:0 carrier:0 
          collisions:0 txqueuelen:0 
          RX bytes:4186 (4.0 KiB)  TX bytes:4186 (4.0 KiB) 

virbr0    Link encap:Ethernet  HWaddr 0e:30:a3:3a:bf:03  
          inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

# 停用网络适配器
[avishek@tecmint ~]$ ifconfig eth0 down

# 启用网络适配器
[avishek@tecmint ~]$ ifconfig eth0 up

# 指定 IP 地址到网络适配器，为网络适配器 eth0 设定 IP 地址“192.168.1.12”。
[avishek@tecmint ~]$ ifconfig eth0 192.168.1.12

# 更改网络适配器 eth0 的子网掩码
[avishek@tecmint ~]$ ifconfig eth0 netmask 255.255.255.

# 更改网络适配器 eth0 的广播地址
[avishek@tecmint ~]$ ifconfig eth0 broadcast 192.168.1.255

# 为网络适配器 eth0 指定 IP 地址,子网掩码，广播地址
[avishek@tecmint ~]$ ifconfig eth0 192.168.1.12 netmask 255.255.255.0 broadcast 192.168.1.255

# 注：如果你设置一块无线网卡的信息，你可以使用的命令是“iwconfig”。

```

欲知更多 ifconfig 命令的例子和使用方法，读 [15个有用的ifconfig 命令][11]。


## 命令：netstat

netstat 命令显示各种网络相关的信息，如网络连接，路由表，接口统计，伪装连接，组播成员身份等....

```sh

# 列出所有的网络端口
[avishek@tecmint ~]$ netstat -a

Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   Path
unix  2      [ ACC ]     STREAM     LISTENING     741379   /run/user/user1/keyring-I5cn1c/gpg
unix  2      [ ACC ]     STREAM     LISTENING     8965     /var/run/acpid.socket
unix  2      [ ACC ]     STREAM     LISTENING     18584    /tmp/.X11-unix/X0
unix  2      [ ACC ]     STREAM     LISTENING     741385   /run/user/user1/keyring-I5cn1c/ssh
unix  2      [ ACC ]     STREAM     LISTENING     741387   /run/user/user1/keyring-I5cn1c/pkcs11
unix  2      [ ACC ]     STREAM     LISTENING     20242    @/tmp/dbus-ghtTjuPN46
unix  2      [ ACC ]     STREAM     LISTENING     13332    /var/run/samba/winbindd_privileged/pipe
unix  2      [ ACC ]     STREAM     LISTENING     13331    /tmp/.winbindd/pipe
unix  2      [ ACC ]     STREAM     LISTENING     11030    /var/run/mysqld/mysqld.sock
unix  2      [ ACC ]     STREAM     LISTENING     19308    /tmp/ssh-qnZadSgJAbqd/agent.3221
unix  2      [ ACC ]     STREAM     LISTENING     436781   /tmp/HotShots
unix  2      [ ACC ]     STREAM     LISTENING     46110    /run/user/ravisaive/pulse/native
unix  2      [ ACC ]     STREAM     LISTENING     19310    /tmp/gpg-zfE9YT/S.gpg-agent
....

# 显示所有 tcp 相关端口
[avishek@tecmint ~]$ netstat -at

Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State      
tcp        0      0 localhost:mysql         *:*                     LISTEN     
tcp        0      0 *:5901                  *:*                     LISTEN     
tcp        0      0 *:5902                  *:*                     LISTEN     
tcp        0      0 *:x11-1                 *:*                     LISTEN     
tcp        0      0 *:x11-2                 *:*                     LISTEN     
tcp        0      0 *:5938                  *:*                     LISTEN     
tcp        0      0 localhost:5940          *:*                     LISTEN     
tcp        0      0 ravisaive-OptiPl:domain *:*                     LISTEN     
tcp        0      0 ravisaive-OptiPl:domain *:*                     LISTEN     
tcp        0      0 localhost:ipp           *:*                     LISTEN     
tcp        0      0 ravisaive-OptiPle:48270 ec2-23-21-236-70.c:http ESTABLISHED
tcp        0      0 ravisaive-OptiPle:48272 ec2-23-21-236-70.c:http TIME_WAIT  
tcp        0      0 ravisaive-OptiPle:48421 bom03s01-in-f22.1:https ESTABLISHED
tcp        0      0 ravisaive-OptiPle:48269 ec2-23-21-236-70.c:http ESTABLISHED
tcp        0      0 ravisaive-OptiPle:39084 channel-ecmp-06-f:https ESTABLISHED
...

# 显示所有连接的统计信息

[avishek@tecmint ~]$ netstat -s

Ip:
    4994239 total packets received
    0 forwarded
    0 incoming packets discarded
    4165741 incoming packets delivered
    3248924 requests sent out
    8 outgoing packets dropped
Icmp:
    29460 ICMP messages received
    566 input ICMP message failed.
    ICMP input histogram:
        destination unreachable: 98
        redirects: 29362
    2918 ICMP messages sent
    0 ICMP messages failed
    ICMP output histogram:
        destination unreachable: 2918
IcmpMsg:
        InType3: 98
        InType5: 29362
        OutType3: 2918
Tcp:
    94533 active connections openings
    23 passive connection openings
    5870 failed connection attempts
    7194 connection resets received
....

# 好的！由于某些原因如果你不想解析 netstat 输出的主机、端口和用户名称的话。
[avishek@tecmint ~]$ netstat -an

# 好，你可能需要获取的 netstat 持续输出的动态信息，通过传递中断输出指令 (ctrl + c)来停止。
[avishek@tecmint ~]$ netstat -c

```

更多关于“netstat”的例子和使用方法，浏览文章 [20 个 netstat 的使用案例][12]。


## 命令：nslookup

网络实用程序，用于获得互联网服务器的信息。顾名思义，该实用程序将发现通过查询 DNS 域的名称服务器信息。

```sh

[avishek@tecmint ~]$ nslookup tecmint.com

Server:     192.168.1.1 
Address:    192.168.1.1#53 

Non-authoritative answer: 
Name:   tecmint.com 
Address: 50.16.67.239

# 查询邮件、交换器记录
[avishek@tecmint ~]$ nslookup -query=mx tecmint.com

Server:     192.168.1.1
Address:    192.168.1.1#53

Non-authoritative answer: 
tecmint.com mail exchanger = 0 smtp.secureserver.net. 
tecmint.com mail exchanger = 10 mailstore1.secureserver.net. 

Authoritative answers can be found from:

# 查询域名服务器
[avishek@tecmint ~]$ nslookup -type=ns tecmint.com 

Server:     192.168.1.1 
Address:    192.168.1.1#53 

Non-authoritative answer: 
tecmint.com nameserver = ns3404.com. 
tecmint.com nameserver = ns3403.com. 

Authoritative answers can be found from:

# 查询 DNS 记录
[avishek@tecmint ~]$ nslookup -type=any tecmint.com 

Server:     192.168.1.1 
Address:    192.168.1.1#53 

Non-authoritative answer: 
tecmint.com mail exchanger = 10 mailstore1.secureserver.net. 
tecmint.com mail exchanger = 0 smtp.secureserver.net. 
tecmint.com nameserver = ns06.domaincontrol.com. 
tecmint.com nameserver = ns3404.com. 
tecmint.com nameserver = ns3403.com. 
tecmint.com nameserver = ns05.domaincontrol.com. 

Authoritative answers can be found from:

# 查询 起始 授权机构
[avishek@tecmint ~]$ nslookup -type=soa tecmint.com 

Server:     192.168.1.1 
Address:    192.168.1.1#53 

Non-authoritative answer: 
tecmint.com 
    origin = ns3403.hostgator.com 
    mail addr = dnsadmin.gator1702.hostgator.com 
    serial = 2012081102 
    refresh = 86400 
    retry = 7200 
    expire = 3600000 
    minimum = 86400 

Authoritative answers can be found from:

# 查询端口号，更改使用你想要连接的端口号
[avishek@tecmint ~]$ nslookup -port 56 tecmint.com

Server:     tecmint.com
Address:    50.16.76.239#53

Name:   56
Address: 14.13.253.12

```

更多阅读 [8个 Nslookup 命令][13]


## 命令：dig

dig 是查询 DNS 域名服务器的工具，可以查询的主机地址、 邮件交流、 域名服务器相关的信息。在任何 Linux (Unix) 或 Macintosh OS X 操作系统上，都可以使用该工具。dig 的最典型的用法是单个主机的查询。

```sh

[avishek@tecmint ~]$ dig tecmint.com

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com 
;; global options: +cmd 
;; Got answer: 
;; ->>HEADER<

# 关闭注释行
[avishek@tecmint ~]$ dig tecmint.com +nocomments 

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com +nocomments 
;; global options: +cmd 
;tecmint.com.           IN  A 
tecmint.com.        14400   IN  A   40.216.66.239 
;; Query time: 418 msec 
;; SERVER: 192.168.1.1#53(192.168.1.1) 
;; WHEN: Sat Jun 29 13:53:22 2013 
;; MSG SIZE  rcvd: 45

# 关闭认证块
[avishek@tecmint ~]$ dig tecmint.com +noauthority 

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com +noauthority 
;; global options: +cmd 
;; Got answer: 
;; ->>HEADER<

# 关闭 其他 块
[avishek@tecmint ~]$ dig  tecmint.com +noadditional 

; <<>> DiG 9.9.2-P1 <<>> tecmint.com +noadditional
;; global options: +cmd
;; Got answer:
;; ->>HEADER<

# 关闭 统计块
[avishek@tecmint ~]$ dig tecmint.com +nostats 

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com +nostats 
;; global options: +cmd 
;; Got answer: 
;; ->>HEADER<

# 关闭回复块
[avishek@tecmint ~]$ dig tecmint.com +noanswer 

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com +noanswer 
;; global options: +cmd 
;; Got answer: 
;; ->>HEADER<

# 关闭所有块
[avishek@tecmint ~]$ dig tecmint.com +noall 

; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6 <<>> tecmint.com +noall 
;; global options: +cmd

```

阅读更多 [10 个 Linux Dig 命令实例][14]。


## 命令：uptime

你连接到你的 Linux 服务器时发现一些不寻常或恶意的东西，你会做什么？猜测......不，绝不！你可以运行 uptime 来验证当服务器无人值守时到底发生了什么事情。

```sh

[avishek@tecmint ~]$ uptime

14:37:10 up  4:21,  2 users,  load average: 0.00, 0.00, 0.04

```


## 命令：wall

对系统管理员来说一个最重要的命令。wall 发送一条消息到大家登录端将其 mesg 权限设置为"yes"。这条信息可以被 wall 作为参数，或者可以将它作为 wall 的标准输入。

```sh

[avishek@tecmint ~]$ wall "we will be going down for maintenance for one hour sharply at 03:30 pm"

Broadcast message from root@localhost.localdomain (pts/0) (Sat Jun 29 14:44:02 2013): 

we will be going down for maintenance for one hour sharply at 03:30 pm

```


## 命令：mesg

其他人们可以使用"wtrite"命令,将在在向您发送文本到屏幕上。你可以控制是否显示。

```sh

mesg [n|y]
n - prevents the message from others popping up on the screen.
y – Allows messages to appear on your screen.

```


## 命令：write

如果 'mesg' 是 'y'，让你的文本直接发送到另一台 Linux 机器的屏幕。

```sh

[avishek@tecmint ~]$ write ravisaive

```


## 命令：talk

增强的 write 命令，talk 命令可让你与其他登录的用户交谈。

```sh

[avishek@tecmint ~]$ talk ravisaive

# 注：如果 talk 命令没安装的话，可以通过 apt 或 yum 安装所需的包。

[avishek@tecmint ~]$ yum install talk
OR
[avishek@tecmint ~]$ apt-get install talk

```


## 命令：w

是否觉得命令'w'很滑稽？但是事实上不是的。它是一个命令，尽管只有一个字符长！命令"w"是 uptime 和 who 命令，以前后的顺序组合在一起。

```sh

[avishek@tecmint ~]$ w

15:05:42 up  4:49,  3 users,  load average: 0.02, 0.01, 0.00 
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT 
server   tty7     :0               14:06    4:43m  1:42   0.08s pam: gdm-passwo 
server   pts/0    :0.0             14:18    0.00s  0.23s  1.65s gnome-terminal 
server   pts/1    :0.0             14:47    4:43   0.01s  0.01s bash

```


## 命令：rename

见名知意，这个命令重命名文件。rename 将会通过从文件名的首字符开始替换，重命名为指定的文件名。

```sh

Give the file names a1, a2, a3, a4.....1213

# 仅仅写这些命令：[@Lesus 注： 在 Ubuntu上 不支持这种格式， rename 与 mv 不同的是，rename 可以批量修改，如同带了 while 的 mv 操作。]
rename a1 a0 a?
rename a1 a0 a??

```


## 命令：top

显示 CPU 进程信息。这个命令自动刷新，默认是持续显示 CPU 进程信息，除非使用了中断指令。

```sh

[avishek@tecmint ~]$ top

top - 14:06:45 up 10 days, 20:57,  2 users,  load average: 0.10, 0.16, 0.21
Tasks: 240 total,   1 running, 235 sleeping,   0 stopped,   4 zombie
%Cpu(s):  2.0 us,  0.5 sy,  0.0 ni, 97.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem:   2028240 total,  1777848 used,   250392 free,    81804 buffers
KiB Swap:  3905532 total,   156748 used,  3748784 free,   381456 cached

  PID USER      PR  NI  VIRT  RES  SHR S  %CPU %MEM    TIME+ COMMAND                                                                                                           
23768 ravisaiv  20   0 1428m 571m  41m S   2.3 28.9  14:27.52 firefox                                   
24182 ravisaiv  20   0  511m 132m  25m S   1.7  6.7   2:45.94 plugin-containe                       
26929 ravisaiv  20   0  5344 1432  972 R   0.7  0.1   0:00.07 top                                      
24875 ravisaiv  20   0  263m  14m  10m S   0.3  0.7   0:02.76 lxterminal                              
    1 root      20   0  3896 1928 1228 S   0.0  0.1   0:01.62 init                                            
    2 root      20   0     0    0    0 S   0.0  0.0   0:00.06 kthreadd                                      
    3 root      20   0     0    0    0 S   0.0  0.0   0:17.28 ksoftirqd/0                                 
    5 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 kworker/0:0H                               
    7 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 kworker/u:0H                               
    8 root      rt   0     0    0    0 S   0.0  0.0   0:00.12 migration/0                                 
    9 root      20   0     0    0    0 S   0.0  0.0   0:00.00 rcu_bh                                       
   10 root      20   0     0    0    0 S   0.0  0.0   0:26.94 rcu_sched                                  
   11 root      rt   0     0    0    0 S   0.0  0.0   0:01.95 watchdog/0                                 
   12 root      rt   0     0    0    0 S   0.0  0.0   0:02.00 watchdog/1                                 
   13 root      20   0     0    0    0 S   0.0  0.0   0:17.80 ksoftirqd/1                               
   14 root      rt   0     0    0    0 S   0.0  0.0   0:00.12 migration/1                               
   16 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 kworker/1:0H                                 
   17 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 cpuset                                       
   18 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 khelper                                    
   19 root      20   0     0    0    0 S   0.0  0.0   0:00.00 kdevtmpfs                                 
   20 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 netns                                     
   21 root      20   0     0    0    0 S   0.0  0.0   0:00.04 bdi-default                             
   22 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 kintegrityd                               
   23 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 kblockd                                       
   24 root       0 -20     0    0    0 S   0.0  0.0   0:00.00 ata_sff

```

另查看 [12 TOP命令例子][18]。[@Lesus 注：htop 比 top 命令更好用，不过需要自己安装
]


## 命令：mkfs.ext4

这个命令在指定的设备上创建一个新的 ext4 文件系统，如果这个命令后面跟的是个错误的设备，那么整个设备就会被擦除和格式化，所以建议不要运行这个命令，除非你清楚自己正在干什么。

```sh

Mkfs.ext4 /dev/sda1 (sda1 block will be formatted)
mkfs.ext4 /dev/sdb1 (sdb1 block will be formatted)

```

更多查看：[Ext4是什么及怎么创建和转换][19]


## vi/emac/nano 命令

vi (visual), emac, nano 是 linux 中最常用的一些编辑器。它们经常用于编辑文本，配置,… 等文件. A quick guide to work around vi and nano is, emac is a.

```sh

# vi 编辑器：
[avishek@tecmint ~]$ touch a.txt (创建一个名为a.txt的文本文件) 
[avishek@tecmint ~]$ vi a.txt (用vi打开a.txt)

# 按下‘i’键进入插入模式, 否则你不能输入任何内容
echo "Hello"  (这里的文本会存到文件中)

    1. alt+x (退出插入模式, 记得在最后的字符间留有一些空格。
    2. ctrl+x 命令或你上一个单词将被删除)。
    3. :wq! (以当前的文本保存文件, 记住‘!’ 是覆盖的意思)。

# nano 编辑器：
[avishek@tecmint ~]$ nano a.txt (用nano打开 a.txt)

edit, with the content, required

# ctrl +x (关闭编辑器)。它会显示如下的提示输出信息：
Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ?                    
 Y Yes 
 N No           ^C Cancel

# 点击‘y’ 选择 yes 并输入文件名，就完成编辑了。

```


## 命令：rsync

Rsync 复制文件，参数 -P 开启进度条。如果你已经安装了 rsync，你可以使用一个简单的别名。

```sh

alias cp='rsync -aP'

# 现在尝试在终端复制一个大文件，这样将会看到显示剩余部分的输出，与进度条类似。
# 而且，保持和维护备份是系统管理员不得不做的最重要、最无聊的工作之一。Rsync 是一个用于新建和维护备份的非常好用的终端工具（也存在许多其它工具）。

[avishek@tecmint ~]$ rsync -zvr IMG_5267\ copy\=33\ copy\=ok.jpg ~/Desktop/ 

sending incremental file list 
IMG_5267 copy=33 copy=ok.jpg 

sent 2883830 bytes  received 31 bytes  5767722.00 bytes/sec 
total size is 2882771  speedup is 1.00

# 注意: -z 表示压缩， -v 表示详细信息，-r 表示递归。

```


## 命令：free

跟踪内存的使用和资源一样重要，就像管理员执行的任何其它任务，可以使用 'free' 命令来在这里救援.

```sh

# 当前内存使用状态Current Usage Status of Memory
[avishek@tecmint ~]$ free

             total       used       free     shared    buffers     cached
Mem:       2028240    1788272     239968          0      69468     363716
-/+ buffers/cache:    1355088     673152
Swap:      3905532     157076    3748456

# 设置输出单位为KB，MB或GB
[avishek@tecmint ~]$ free -b

             total       used       free     shared    buffers     cached
Mem:    2076917760 1838272512  238645248          0   71348224  372670464
-/+ buffers/cache: 1394253824  682663936
Swap:   3999264768  160845824 3838418944

[avishek@tecmint ~]$ free -k

             total       used       free     shared    buffers     cached
Mem:       2028240    1801484     226756          0      69948     363704
-/+ buffers/cache:    1367832     660408
Swap:      3905532     157076    3748456

[avishek@tecmint ~]$ free -m

             total       used       free     shared    buffers     cached
Mem:          1980       1762        218          0         68        355
-/+ buffers/cache:       1338        641
Swap:         3813        153       3660

[avishek@tecmint ~]$ free -g

             total       used       free     shared    buffers     cached
Mem:             1          1          0          0          0          0
-/+ buffers/cache:          1          0
Swap:            3          0          3

# 以可读的格式显示，检查当前内存使用
[avishek@tecmint ~]$ free -h

             total       used       free     shared    buffers     cached
Mem:          1.9G       1.7G       208M         0B        68M       355M
-/+ buffers/cache:       1.3G       632M
Swap:         3.7G       153M       3.6G

# 设定 时间间隔 后 ，持续检查 使用状态
[avishek@tecmint ~]$ free -s 3

             total       used       free     shared    buffers     cached
Mem:       2028240    1824096     204144          0      70708     364180
-/+ buffers/cache:    1389208     639032
Swap:      3905532     157076    3748456

             total       used       free     shared    buffers     cached
Mem:       2028240    1824192     204048          0      70716     364212
-/+ buffers/cache:    1389264     638976
Swap:      3905532     157076    3748456

```

阅读更多 [10 个 Free 命令使用实例][20]。


## 命令：mysqldump

好了，现在你从名字上就能明白这个命令所代表的作用。mysqldump 命令会转储(备份)数据库的全部或特定一部分数据到一个给定的文件中。例如：

```sh

[avishek@tecmint ~]$ mysqldump -u root -p --all-databases > /home/server/Desktop/backupfile.sql

```

注意： mysqldump 需要 mysql 在运行中并且有正确的授权密码。我们在 [用 mysqldump 命令备份数据库][21]中讨论了一些有用的 “mysqldump” 命令用法。


## 命令：mkpasswd

根据指定的长度，产生一个难猜的随机密码。

```sh

[avishek@tecmint ~]$ mkpasswd -l 10

zI4+Ybqfx9

[avishek@tecmint ~]$ mkpasswd -l 20 

w0Pr7aqKk&hmbmqdrlmk

# 注意： -l 10 产生一个 10 个字符的随机密码，而 -l 20 产生 20 个字符的密码，它可以设置为任意长度来取得所希望的结果。
# 这个命令很有用，经常在脚本语言里使用来产生随机的密码。你可能需要 yum 或 apt ‘expect’ 包来使用这个命令。
[avishek@tecmint ~]$ yum install expect 
# 或
[avishek@tecmint ~]$ apt-get install expect

```


## 命令：paste

合并两个或多个文本文件，按行来进行合并。

```sh

# 如果 file1 的内容是：
1 
2 
3 

# file2 是这样的: 
a 
b 
c 
d

[avishek@tecmint ~]$ paste file1 file2 > file3
# 结果file3将是: 
1    a 
2    b 
3    c 
     d

```


## 命令：lsof

lsof 是"list open files"("列表中打开的文件") 的缩写，显示您的系统当前已打开的所有文件。这是非常有用的对于想找出哪些进程使用某一特定文件，或显示为单个进程打开所有文件。一些有用的 [10 个 lsof 命令示例][22]，你可能会感兴趣阅读。

```sh

[avishek@tecmint ~]$ lsof 

COMMAND     PID   TID            USER   FD      TYPE     DEVICE SIZE/OFF       NODE NAME
init          1                  root  cwd       DIR        8,1     4096          2 /
init          1                  root  rtd       DIR        8,1     4096          2 /
init          1                  root  txt       REG        8,1   227432     395571 /sbin/init
init          1                  root  mem       REG        8,1    47080     263023 /lib/i386-linux-gnu/libnss_files-2.17.so
init          1                  root  mem       REG        8,1    42672     270178 /lib/i386-linux-gnu/libnss_nis-2.17.so
init          1                  root  mem       REG        8,1    87940     270187 /lib/i386-linux-gnu/libnsl-2.17.so
init          1                  root  mem       REG        8,1    30560     263021 /lib/i386-linux-gnu/libnss_compat-2.17.so
init          1                  root  mem       REG        8,1   124637     270176 /lib/i386-linux-gnu/libpthread-2.17.so
init          1                  root  mem       REG        8,1  1770984     266166 /lib/i386-linux-gnu/libc-2.17.so
init          1                  root  mem       REG        8,1    30696     262824 /lib/i386-linux-gnu/librt-2.17.so
init          1                  root  mem       REG        8,1    34392     262867 /lib/i386-linux-gnu/libjson.so.0.1.0
init          1                  root  mem       REG        8,1   296792     262889 /lib/i386-linux-gnu/libdbus-1.so.3.7.2
init          1                  root  mem       REG        8,1    34168     262840 /lib/i386-linux-gnu/libnih-dbus.so.1.0.0
init          1                  root  mem       REG        8,1    95616     262848 /lib/i386-linux-gnu/libnih.so.1.0.0
init          1                  root  mem       REG        8,1   134376     270186 /lib/i386-linux-gnu/ld-2.17.so
init          1                  root    0u      CHR        1,3      0t0       1035 /dev/null
init          1                  root    1u      CHR        1,3      0t0       1035 /dev/null
init          1                  root    2u      CHR        1,3      0t0       1035 /dev/null
init          1                  root    3r     FIFO        0,8      0t0       1714 pipe
init          1                  root    4w     FIFO        0,8      0t0       1714 pipe
init          1                  root    5r     0000        0,9        0       6245 anon_inode
init          1                  root    6r     0000        0,9        0       6245 anon_inode
init          1                  root    7u     unix 0xf5e91f80      0t0       8192 @/com/ubuntu/upstart
init          1                  root    8w      REG        8,1     3916        394 /var/log/upstart/teamviewerd.log.1 (deleted)

```


## 参考资料

1. [对 Linux 新手非常有用的 20 个命令][5]
2. [20 Useful Commands for Linux Newbies][6]
3. [对中级 Linux 用户非常有用的 20 个命令][17]
4. [20 Advanced Commands for Middle Level Linux Users][7]
5. [对 Linux 专家非常有用的 20 个命令][15]
6. [20 Advanced Commands for Linux Experts][16]


[1]: http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[2]: http://www.tecmint.com/18-tar-command-examples-in-linux/
[3]: http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[4]: http://www.tecmint.com/20-advanced-commands-for-middle-level-linux-users/
[5]: http://www.oschina.net/translate/useful-linux-commands-for-newbies?cmp
[6]: http://www.tecmint.com/useful-linux-commands-for-newbies/
[7]: http://www.tecmint.com/20-advanced-commands-for-middle-level-linux-users/
[8]: http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[9]: http://www.tecmint.com/how-to-check-disk-space-in-linux/
[10]: http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[11]: http://www.tecmint.com/ifconfig-command-examples/
[12]: http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[13]: http://www.tecmint.com/8-linux-nslookup-commands-to-troubleshoot-dns-domain-name-server/
[14]: http://www.tecmint.com/10-linux-dig-domain-information-groper-commands-to-query-dns/
[15]: http://www.oschina.net/translate/20-advanced-commands-for-linux-experts
[16]: http://www.tecmint.com/20-advanced-commands-for-linux-experts/
[17]: http://www.oschina.net/translate/20-advanced-commands-for-middle-level-linux-users
[18]: http://www.tecmint.com/12-top-command-examples-in-linux/
[19]: http://www.tecmint.com/what-is-ext2-ext3-ext4-and-how-to-create-and-convert-linux-file-systems/
[20]: http://www.tecmint.com/10-examples-of-linux-free-command/
[21]: http://www.tecmint.com/mysql-backup-and-restore-commands-for-database-administration/
[22]: http://www.tecmint.com/10-lsof-command-examples-in-linux/