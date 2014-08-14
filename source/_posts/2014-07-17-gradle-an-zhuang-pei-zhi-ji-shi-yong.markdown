---
layout: post
title: "Gradle 安装配置及使用"
date: 2014-07-17 14:37:42 +0800
comments: true
categories: [gradle, eclipse]
---

<!-- more -->

## 简介

Gradle 版本：2.0，支持新特性如下：

* 更新至 Groovy 2.3.2
* 支持 Java 8
* 解决 source 和 javadoc artifacts 的新 API
* 可以通过 component metadata rules 使用 Ivy extra info
* 可以通过 plugins.withId() 来整合插件
* 支持 Ivy 以及 Maven repositories 使用 SFTP scheme
* Apache Maven POM profile 现在可以基于系统本身属性信息使用
* 良好的细粒度控制 native 工具的参数传递
* 简化了跨平台编译及个性化设置（GCC based toolchains）
* 为 Ivy repositories 提供新的 'ivy' layout 支持
* 代码质量工具的默认版本更新，以便与当前版本 Gradle 相匹配
> * Checkstyle：5.7
> * CodeNarc：0.21
> * PMD：5.1.1(note that some rulesets were renamed in PMD 5, e.g. basic -> java-basic)
> * Findbugs：2.0.3
> * JaCoCo：0.7.1.201405082137
* Tooling API 改善

更详细的信息，请参考 <http://www.gradle.org/docs/> 对应版本的 Release Notes。

## 与 Eclipse Luna 整合

eclipse 版本：4.4.0（Luna）

## 环境配置

* GRADLE_HOME：Gradle 安装目录
* path：加入 Gradle bin 目录
* GRADLE_OPTS：Gradle 参数选项
* JAVA_OPTS：Java 参数选项

## eclipse 插件安装



















## 参考资料

1. [Gradle 主页][1]
2. [Gradle 下载页][2]
3. [Eclipse 下载页][3]

[1]: http://www.gradle.org/
[2]: http://www.gradle.org/downloads
[3]: http://www.eclipse.org/downloads/