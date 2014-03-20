---
layout: post
title: "Mac OS X下Octopress + GitHub Pages发布博客"
date: 2014-03-19 23:22:03 +0800
comments: true
categories: [jekyll, octopress, github, github pages, blog]
---

# 前言

## 优点

* 广泛的使用者及相关文档
* Octopress整合了丰富的第三方插件
* 内置支持Gitub、Twitter、Google Plus One、Pinboard、Delicious、Disqus Comments、Google Analytics、Facebook
* 源码版本信息完全自己通过github控制，可定制高度个性化的个人博客


## 官方文档

## 相关资源

# 安装及配置

## Git安装

## Ruby安装，版本号要求大于1.9.3

* 通过 [rbenv][1] 或者 [RVM][2] 安装。

## 设置Octopress

* 从git复制Octopress

```sh
    git clone git://github.com/imathis/octopress.git octopress
    cd octopress
```


* 下一步，安装依赖

```sh
    gem install bundler     # 若报权限错误，加sudo执行相关命令
    rbenv rehash            # If you use rbenv, rehash to be able to run the bundle command
    bundle install
```


* 安装Octopress默认主题

```sh
    rake install    # 由于默认主题名为“classic” 该命令等效于：rake install['classic]
```

* 或者安装[第三方主题][3]

```sh
    cd octopress
    git clone GIT_URL .themes/THEME_NAME
    rake install['THEME_NAME']
    rake generate
```


* Octopress发布在Github Pages上

```sh
    rake setup_github_pages   # 该命令将进行一系列的github相关配置
    rake generate             # This will generate your blog, copy the generated files into _deploy/
    rake preview              # 本地预览页面，页面默认发布在localhost:4000
    rake deploy               # dd them to git, commit and push them up to the master branch
```


* 将octopress目录下所有代码提交到source分支

```sh
    git add .
    git commit -m '源码提交'
    git push origin source
```


* 自定义域名

```sh
    echo 'your-domain.com' >> source/CNAME
    # 或者
    echo 'www.your-domain.com' >> source/CNAME
    # 然后，你必须访问你得域名注册商或者DNS主机，为你的域名增加一个record
    # 注意最好不要使用顶级域名作为CNAME，另外，DNS解析生效需要比较长的时间
```


* 按规范[发布文章][4]，新发布文章的默认扩展名是markdown，你可以在Rakefile文件中更改扩展名

```sh
    rake new_post["title"]                    # 按规范发布文章，并且为文章自动生成yaml metadata
    rake new_page[super-awesome]              # 创建 /source/super-awesome/index.markdown
    rake new_page[super-awesome/page.html]    # 创建 /source/super-awesome/page.html
```


* [远程更新至本地][5]

```sh
    git pull octopress master     # Get the latest Octopress
    bundle install                # Keep gems updated
    rake update_source            # update the template's source
    rake update_style             # update the template's style
    # rake update命令相当于以上rake update_source和rake update_style两个命令合并执行(该命令无效？？？)
```





[1]: http://octopress.org/docs/setup/rbenv
[2]: http://octopress.org/docs/setup/rvm
[3]: https://github.com/imathis/octopress/wiki/3rd-Party-Octopress-Themes
[4]: http://octopress.org/docs/blogging/
[5]: http://octopress.org/docs/updating/