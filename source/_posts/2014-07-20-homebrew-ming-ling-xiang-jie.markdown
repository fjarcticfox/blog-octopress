---
layout: post
title: "Homebrew 命令详解"
date: 2014-07-20 16:31:49 +0800
comments: true
categories: [homebrew, command]
---

Homebrew 是 OS X 上的 package 管理工具，用于添加 OS X 中缺失的 package。

<!-- more -->

## 获取 Homebrew

```sh
# 打开终端窗口, 执行以下脚本。
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# 脚本会解释它的作用，然后在您的确认下执行安装。高级安装选项请看 [这里][2]（需要10.5）。

```

## 使用命令

```sh

# Homebrew installs [the stuff you need][1] that Apple didn’t.
$ brew install wget

```

## 安装目录

Homebrew 会将 packages 安装到独立目录，然后 symlinks 其中文件到目录 `/usr/local`.

```sh

$ cd /usr/local
$ find Cellar
Cellar/wget/1.15
Cellar/wget/1.15/bin/wget
Cellar/wget/1.15/share/man/man1/wget.1

$ ls -l bin
bin/wget -> ../Cellar/wget/1.15/bin/wget

```

Homebrew 的所有文件均会被安装到预定义目录下，另外，你可以将 Homebrew 的安装目录设置在你喜欢的任何地方。

## 创建自己的 Homebrew 上的 packages

```sh

$ brew create http://foo.com/bar-1.0.tgz
Created /usr/local/Library/Formula/bar.rb

```

## 维护自己的 packages

Homebrew 基于 git、ruby，所以依据掌握的知识，你可以便捷的撤回你的修改或者合并上游的更新。

```sh

# 打开编辑
$ brew edit wget # opens in $EDITOR!

```

Homebrew 的 formulae 都是简单的 Ruby 脚本。

```sh

require "formula"

class Wget < Formula
  homepage "http://www.gnu.org/software/wget/"
  url "http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz"
  sha1 "f3c925f19dfe5ed386daae4f339175c108c50574"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end

```

Homebrew 使 OS X 更完美。使用 gem 来安装 gems、用 brew 来搞定那些依赖包。




## 参考资料

1. [Homebrew -- The missing package manager for OS X][3]



[1]: https://github.com/Homebrew/homebrew/tree/master/Library/Formula
[2]: https://github.com/Homebrew/homebrew/wiki/Installation
[3]: http://brew.sh/index.html