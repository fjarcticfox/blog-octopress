---
layout: post
title: "Ubuntu 11.04 下使用 Nexus 搭建 Maven 仓库"
date: 2014-04-30 10:03:33 +0800
comments: true
categories: [ubuntu, nexus, maven]
keywords: ubuntu, nexus, maven
---

## 仓库管理器优点

1. 时间及带宽的节省，加速组织内部项目构建。
2. 可控制 Maven 下载的机制，为组织的总体架构和政策实施提供了依赖方面的控制（例如，避免不小心添加 GPL 许可证的依赖等等）。
3. 为开发人员和部门之间提供一种共享内部项目构件的快照版本和发布版本的机制，避免组织内的每个成员单独下载并构建各自的内部项目。

<!-- more -->


## Java 下载及安装

1. 根据需求，在 <http://www.oracle.com/technetwork/java/javase/downloads/index.html> 下载对应 JDK 版本。或者通过 wget 命令将下载中的 JDK 链接地址通过命令行下载。
2. 将 JDK 压缩包复制至指定目录，解压 JDK 压缩包，并配置环境变量。

```sh

# 创建 Java JDK 目标目录
sudo mkdir -p /usr/lib/java

# 将 JDK 压缩包复制至 /usr/lib/java 目录
sudo cp jdk-7u55-linux-x64.tar.gz /usr/lib/java

# 解压 JDK
cd /usr/lib/java
sudo tar zxvf jdk-7u55-linux-x64.tar.gz

# 给当前用户赋予可执行权限
sudo chmod u+x jdk1.7.0_55

# Windows 下可以采用 gedit 编辑器（或其他编辑器）配置环境变量
sudo gedit /etc/profile
# 或类 Unix 环境下，采用 nano 或 vi 等编辑器配置环境变量
sudo nano /etc/profile
# 将如下内容添加至文件中，保存并关闭文件
    # JDK environment
    export JAVA_HOME=/usr/lib/java/jdk1.7.0_55
    export JRE_HOME=$JAVA_HOME/jre
    export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
    export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# 重新登陆使配置生效，或执行以下命令使配置生效
source /etc/profile

# 测试 JAVA 版本
java -version

```


## Nexus 下载及安装

进入 [Nexus 下载页面][1]，下载安装 Nexus，并配置环境。

```sh

# 下载 nexus oss（nexus pro 收费）当前版本 2.8.0
wget http://www.sonatype.org/downloads/nexus-latest-bundle.zip

# 复制至/usr/lcoal
sudo cp nexus-latest-bundle.zip /usr/local

# 解压
unzip nexus-latest-bundle.zip

# 创建软连接
ln -s nexus-2.8.0-05 nexus

# 编辑 /etc/profile 文件，配置 Nexus 环境
sudo vi /etc/profile
# 在文件中加入如下内容
    # Nexus environment
    export NEXUS_HOME=/usr/local/nexus

# 重新登陆，或执行以下命令使配置生效
source /etc/profile

# 为 nexus-2.8.0_05 及 sonatype-work 赋权
sudo chmod -R a+rwx nexus-2.8.0_05
sudo chmod -R a+rwx sonatype-work

```


## 启动 Nexus

简单启动 nexus

```sh

# console 启动
cd /usr/local/nexus
./bin/nexus console

# 后台启动
./bin/nexus start
# 查看日志
tail -f logs/wrapper.log

```

以服务启动 nexus

```sh

# 假设 nexus 用户具有运行 nexus 服务的权限

# 复制 $NEXUS_HOME/bin/nexus 到 /etc/init.d/nexus，或创建一个symlink
sudo ln -s $NEXUS_HOME/bin/nexus /etc/init.d/nexus

# 给/etc/init.d/nexus 脚本赋可执行权限
chmod 755 /etc/init.d/nexus

# 更改 /etc/init.d/nexus 脚本中的内容
    1. 设置 NEXUS_HOME="/usr/local/nexus"
    2. 设置 RUN_AS_USER=nexus 或其他具有权限的用户来执行 Nexus 服务，避免使用 root 来运行 Nexus 服务
    3. 



```



## 参考资料

* [Repository Management with Nexus][2]
* [Configuring Nexus as a Service][3]





[1]: http://www.sonatype.org/nexus/archived
[2]: http://books.sonatype.com/nexus-book/reference/index.html
[3]: http://books.sonatype.com/nexus-book/reference/install-sect-service.html