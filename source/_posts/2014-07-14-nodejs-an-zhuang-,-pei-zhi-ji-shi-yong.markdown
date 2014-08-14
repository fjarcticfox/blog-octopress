---
layout: post
title: "NodeJS 安装、配置及使用"
date: 2014-07-14 09:40:39 +0800
comments: true
categories: [nodejs]
---

<!-- more -->

## Windows 下安装及配置 NodeJS

直接通过 [NodeJS 主页][1] 中的 INSTALL 按钮下载并安装。当前 NodeJS 最新版本为 v0.10.29。配置环境变量NODEJS_HOME，并加入path。

* Windows 下安装 PostgreSQL 的 pg Module，可用于 NodeJS 连接 PostgreSQL 数据库

1）安装 node-gyp Module

```sh

# nodejs 目录下执行
npm install node-gyp

```

2）node-gyp（0.13.1）的执行需要依赖 Python 以及 vc++。根据 node-gyp 的 `README.md` 文件选择合适的 [Python（v2.7.3）][2]版本安装。。根据操作系统版本及 `README.md` 说明，选择合适的 [vc++ （Win7 下，选择 vc++ 2012）][3]版本安装。

3）安装 pg Module。安装 PostgreSQL 的 Module 之前，请确认 PostgreSQL 的环境变量已经配置好。否则会出现 pg_config 命令无法执行的错误。

```sh

# nodejs 目录下执行
npm install pg

```

* Windows 下安装 PostgreSQL 的 pg.js Module，可用于 NodeJS 连接 PostgreSQL 数据库

1）安装 pg.js Module 仅需执行以下操作

```sh

# nodejs 目录下执行
npm install pg.js

```





## 使用







## 参考资料

1. [NodeJS 主页][1]

[1]: http://www.nodejs.org/
[2]: https://www.python.org/downloads/release/python-273/
[3]: http://go.microsoft.com/?linkid=9816758