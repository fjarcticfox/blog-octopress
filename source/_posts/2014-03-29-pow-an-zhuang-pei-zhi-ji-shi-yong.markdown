---
layout: post
title: "Pow 安装配置及使用"
date: 2014-03-29 01:48:36 +0800
comments: true
categories: [pow, homebrew]
keywords: pow, homebrew
---

Pow，Mac OS X 上零配置的 Rack Server。它使得开发 Rails 及 Rack 应用更为简便。

<!-- more -->

* 官网：<http://pow.cx/>
* Homebrew 的 GitHub 源码：<https://github.com/Homebrew/homebrew>
* Pow 的 GitHub 源码：<https://github.com/basecamp/pow>
* Pow 文档说明：<http://pow.cx/manual.html>
* Pow 安装说明：<https://github.com/basecamp/pow/wiki/Installation>
* Pow 常见错误解决办法：<https://github.com/basecamp/pow/wiki/Troubleshooting>


## 通过官方包安装（**推荐方式**）

```sh

    curl get.pow.cx | sh

```


## 通过源码安装

```sh
    # 若未安装node 先安装node
    brew install node
    # clone 源码
    git clone git@github.com:basecamp/pow.git
    cd pow
    npm --global install
    npm --global run-script pow restart
    # 若你希望在每次登陆时都通过 launchd 启动 Pow 则 
    launchctl load -Fw "$HOME/Library/LaunchAgents/cx.pow.powd.plist"

```


## Homebrew 安装及配置

```sh

    # 安装 pow
    brew install pow
    # 根据 Caveats 配置相关目录
    mkdir -p ~/Library/Application\ Support/Pow/Hosts
    # 创建软链接，若 ~/.pow 目录不存在，则先mkdir ~/.pow
    ln -s ~/Library/Application\ Support/Pow/Hosts ~/.pow

    # Setup port 80 forwarding and launchd agents:
    sudo pow --install-system
    pow --install-local

    # Load launchd agents:
    sudo launchctl load -w /Library/LaunchDaemons/cx.pow.firewall.plist
    launchctl load -w ~/Library/LaunchAgents/cx.pow.powd.plist

```