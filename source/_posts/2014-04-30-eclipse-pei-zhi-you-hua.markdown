---
layout: post
title: "Eclipse 配置及优化"
date: 2014-04-30 17:34:25 +0800
comments: true
categories: [eclipse]
keywords: eclipse, 配置, 优化
published: false
---

<!-- more -->


## eclipse 插件配置

1. 安装 Eclipse Color Theme 插件，配置编辑器样式
2. StartExplorer，跨平台的 eclipse 快捷打开文件所在文件夹的插件
3. UML Designer (Eclipse Kepler version) 3.0，UML 设计插件

## eclipse 加速

1. validation 中，关闭 build 下的所有校验（可以保留Classpath Dependency Validator），只开启 manual 手工校验
2. Plug-in Development > Target Platform > plug-in 中关闭无关或暂且不用的 plug-in
3. Preferences > General > Startup and Shutdown 取消无关或暂且不用的 plug-ins
4. 将 Preferences 中的 Dashboard 调整为不随 eclipse 启动

## 编码配置

1. Preferences > General > Workspace 中 Text file encoding 改为 UTF-8
2. Preferences > General > Content Types 中更改 Text 下的 Java Properties File、Java Source File、Javascript Source File、JSP 为 UTF-8，其余 content types 的编码可以根据需要进行调整


## 字体设置

1. Preferences > General > Appearance > Colors and Fonts 中 更改 Basic 下的 Text Font，建议字体：Consolas、Courier new、Inconsolata

## 快捷键设置

1. Preferences > General > Keys 中 Content Assist 快捷键更改为 alt + /

## 标签装饰

1. Preferences > General > Appearance > Label Decorations 设置各种标签装饰

## Console 输出

1. Preferences > Run/Debug > Console 设置 Console buffer size(characters) 为 800000

## 编辑区配置

1. Preferences > General > Editors > Text Editors （或者在文件编辑区域左侧边，点击右键），勾选 Show Line Numbers 开启行号显示

## 拼写检查

1. Preferences > General > Editors > Spelling 中取消勾选 Enable spell checking，关闭拼写检查

## 代码风格及代码模板

1. Preferences > General > Java > Code Style > Formatter 中配置 Java 代码风格
2. Preferences > General > Java > Code Style > Code Templates 中勾选 Automatically add comments for new methods and types 开启 comments
3. Preferences > General > Java > Editor > Templates 中配置代码模板
