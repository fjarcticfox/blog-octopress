---
layout: post
title: "npm 命令详解"
date: 2014-07-20 15:57:15 +0800
comments: true
categories: [npm]
---

NPM（Node Packaged Modules），是一个用于管理基于 node.js 编写的 package 的命令行工具。类似于 gem 与 ruby 的关系。

<!-- more -->

## npm 获取配置信息的 6 种方式，优先级由高到低。

```sh

# 命令行参数，将 proxy

```

## npm 常用命令

```sh

# 查看用户本身配置文件路径
npm config get userconfig   # defaults to ~/.npmrc

# 查看全局用户配置文件路径
npm config get globalconfig # defaults to /usr/local/etc/npmrc

# 内置配置文件，在 npm 安装目录下的 npmrc 文件夹中

# 设置 npm 配置
npm config set <key> <value> [--global]
npm config get <key>
npm config delete <key>
npm config list
npm config edit
npm get <key>
npm set <key> <value> [--global]
# 在设置配置属性时属性值默认是被存储于用户配置文件中，如果加上 --global，则被存储在全局配置文件中。

# 查看 npm 的所有配置属性（包括默认配置）
npm config ls -l

# 查看 npm 的各种配置的含义
npm help config

# 为 npm 设置代理
npm config set proxy http://server:port
npm config set https-proxy http://server:port
# 如果代理需要认证的话可以这样来设置
npm config set proxy http://username:password@server:port
npm config set https-proxy http://username:pawword@server:port
# 如果代理不支持 https 的话需要修改 npm 存放 package 的网站地址
npm config set registry "http://registry.npmjs.org/"


# 卸载
sudo npm uninstall npm -g
# 或者，如果上面的命令失败了
sudo make uninstall


```

## 注意事项

~/.npm 为 cache 目录，用于避免重复下载相同的 package。若不需要，可以执行以下命令清空

```

npm cache clean

```






## 参考资料

1. [npm -- node package manager][1]
2. [npm-index][2]



[1]: https://github.com/npm/npm
[2]: https://www.npmjs.org/doc/