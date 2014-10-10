---
layout: post
title: "HTTP 超文本传输协议详解"
date: 2014-09-22 14:13:22 +0800
comments: true
categories: 
---

HTTP（HyperText Transfer Protocol，超文本传输协议）是互联网上应用最为广泛的一种网络协议。设计 HTTP 最初的目的是为了提供一种发布和接收 HTML 页面的方法。通过 HTTP 或者 HTTPS 协议请求的资源由统一资源标示符（Uniform Resource Identifiers，URI）来标识。

<!-- more -->

## 版本

### HTTP 0.9

已过时。只接受 GET 一种请求办法，没有在通讯中制定版本号，且不支持请求头。由于该版本不支持 POST 方法，因此客户端无法向服务器传递太多信息。

### HTTP 1.0

这是第一个在通讯中指定版本号的 HTTP 协议版本，至今仍被广泛采用，特别是在代理服务器中。

### HTTP 1.1

持久连接被默认采用，并能很好地配合代理服务器工作。还支持以管道方式同时发送多个请求，以便降低线路负载，提高传输速度。HTTP/1.1 相较于 HTTP/1.0 协议的区别主要体现在：

* 缓存处理
* 带宽优化及网络连接的使用
* 错误通知的管理
* 消息在网络中的发送
* 互联网地址的维护
* 安全性及完整性

### HTTP 2






## 参考资料

1. [超文本传输协议][1]


[1]: http://zh.wikipedia.org/wiki/%E8%B6%85%E6%96%87%E6%9C%AC%E4%BC%A0%E8%BE%93%E5%8D%8F%E8%AE%AE