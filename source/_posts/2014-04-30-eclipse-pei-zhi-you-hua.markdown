---
layout: post
title: "Eclipse 配置及优化"
date: 2014-04-30 17:34:25 +0800
comments: true
categories: [eclipse]
keywords: eclipse, 配置, 优化
published: true
---

<!-- more -->

## Windows 环境配置

1. HOME
2. JAVA_HOME
3. PATH

## eclipse 插件配置

1. 安装 Eclipse Color Theme 插件，配置编辑器样式
2. StartExplorer，跨平台的 eclipse 快捷打开文件所在文件夹的插件
3. Subversive - SVN Team Provider 插件，
4. Enide Studio 插件，Node.js，JavaScript 等开发插件
5. UML Designer (Eclipse Kepler version) 3.0，UML 设计插件

## eclipse 加速

1. validation 中，关闭 build 下的所有校验（可以保留Classpath Dependency Validator），只开启 manual 手工校验
2. Plug-in Development > Target Platform > plug-in 中关闭无关或暂且不用的 plug-in
3. Preferences > General > Startup and Shutdown 取消无关或暂且不用的 plug-ins
4. 将 Preferences 中的 Dashboard 调整为不随 eclipse 启动

## 编码配置

1. Preferences > General > Workspace 中 Text file encoding 改为 UTF-8
2. Preferences > General > Content Types 中更改 Text 下的 Java Properties File、Java Source File、Javascript Source File、JSP 为 UTF-8，其余 content types 的编码可以根据需要进行调整


## 字体设置

1. Preferences > General > Appearance > Colors and Fonts 中 更改 Basic 下的 Text Font，建议字体：Consolas、Courier new、Inconsolata，脚本改为：中欧字符

## 快捷键设置

1. Preferences > General > Keys 中 Content Assist 快捷键更改为 alt + /

## 标签装饰

1. Preferences > General > Appearance > Label Decorations 设置各种标签装饰

## Console 输出

1. Preferences > Run/Debug > Console 设置 Console buffer size(characters) 为 800000

## 编辑区配置

1. Preferences > General > Editors > Text Editors （或者在文件编辑区域左侧边，点击右键），勾选 Show Line Numbers 开启行号显示

## 拼写检查

1. Preferences > General > Editors > Text Editors > Spelling 中取消勾选 Enable spell checking，关闭拼写检查

## 代码风格及代码模板

1. Preferences > Java > Code Style > Formatter 中配置 Java 代码风格
2. Preferences > Java > Code Style > Code Templates 中勾选 Automatically add comments for new methods and types 开启 comments
3. Preferences > Java > Editor > Templates 中配置代码模板

## 常见警告解决办法

* git 工具未安装：安装 git <http://git-scm.com/> 工具，按说明配置 System Settings；或者取消警告消息

```sh
# 错误消息
EGit couldn't detect the installation path "gitPrefix" of native Git. Hence EGit can't respect system level Git settings which might be configured in ${gitPrefix}/etc/gitconfig under the native Git installation directory. The most important of these settings is core.autocrlf. Git for Windows by default sets this parameter to true in this system level configuration. The Git installation location can be configured on the Team > Git > Configuration preference page's 'System Settings' tab. This warning can be switched off on the Team > Git > Confirmations and Warnings preference page.
```

* HOME 环境变量未设置：设置 HOME 环境变量；或者取消告警消息

```sh
# 错误消息
Warning: The environment variable HOME is not set. The following directory will be used to store the Git
user global configuration and to define the default location to store repositories: 'C:\Documents and Settings\Wizard'. If this is
not correct please set the HOME environment variable and restart Eclipse. Otherwise Git for Windows and
EGit might behave differently since they see different configuration options.
This warning can be switched off on the Team > Git > Confirmations and Warnings preference page.
```

## 常见错误解决办法
