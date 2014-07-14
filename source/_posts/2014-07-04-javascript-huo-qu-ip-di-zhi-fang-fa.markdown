---
layout: post
title: "Javascript 获取 IP 地址方法"
date: 2014-07-04 00:11:15 +0800
comments: true
categories: [javascript, ip]
---

Javascript 获取客户端 IP 的方法如下：

<!-- more -->

```html

# 一
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/<A class="infotextkey" href="http://www.jbxue.com/jb/js/" target=_blank>javascript</A>">document.write(returnCitySN["cip"]+','+returnCitySN["cname"])</script>

# 二
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/<A class="infotextkey" href="http://www.jbxue.com/jb/js/" target=_blank>javascript</A>">document.write(returnCitySN["cip"]+','+returnCitySN["cname"])</script>

# 三
<script type="text/javascript" src="http://fw.qq.com/ipaddress" charset="gb2312"></script>
$(document).ready(function() {$("#ip").val(IPData[0]);$("#add").val(IPData[2]);})

```