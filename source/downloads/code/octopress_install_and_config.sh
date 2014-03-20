# 从git复制Octopress http://octopress.org/docs/deploying/， 最新版本Octopress https://github.com/octopress/octopress
git clone git://github.com/imathis/octopress.git octopress
cd octopress
# 下一步，安装依赖
gem install bundler   # 若报权限错误，加sudo执行相关命令
rbenv rehash    # If you use rbenv, rehash to be able to run the bundle command
bundle install
# 安装Octopress默认主题
rake install    # 由于默认主题名为“classic” 该命令等效于：rake install['classic]
# 安装第三方主题 https://github.com/imathis/octopress/wiki/3rd-Party-Octopress-Themes
cd octopress
git clone GIT_URL .themes/THEME_NAME
rake install['THEME_NAME']
rake generate

# Octopress发布在Github Pages上 http://octopress.org/docs/deploying/github/
rake setup_github_pages   # 该命令将进行一系列的github相关配置
rake generate             # This will generate your blog, copy the generated files into _deploy/
rake deploy               # dd them to git, commit and push them up to the master branch
# 将octopress目录下所有代码提交到source分支
git add .
git commit -m '源码提交'
git push origin source


# 自定义域名 http://octopress.org/docs/deploying/github/
echo 'your-domain.com' >> source/CNAME
# OR
echo 'www.your-domain.com' >> source/CNAME
# 然后，你必须访问你得域名注册商或者DNS主机，为你的域名增加一个record。
# 注意最好不要使用顶级域名作为CNAME，另外，DNS解析生效需要比较长的时间。

# 按规范发布文章，新发布文章的默认扩展名是markdown，你可以在Rakefile文件中更改扩展名 http://octopress.org/docs/blogging/
rake new_post["title"]                    # 按规范发布文章，并且为文章自动生成yaml metadata
rake new_page[super-awesome]              # 创建 /source/super-awesome/index.markdown
rake new_page[super-awesome/page.html]    # 创建 /source/super-awesome/page.html

# 远程更新至本地 http://octopress.org/docs/updating/
git pull octopress master     # Get the latest Octopress
bundle install                # Keep gems updated
rake update_source            # update the template's source
rake update_style             # update the template's style
# rake update命令相当于以上rake update_source和rake update_style两个命令合并执行(该命令无效？？？)

# 自动生成页面，预览后发布
rake generate
rake preview
rake deploy

# 多台设备开发
# clone GitHub上source分支代码至本地octopress文件夹
git clone -b source git@github.com:username/username.github.io.git octopress
# clone GitHub上master分支代码至octopress子文件夹_deploy中
cd octopress
git clone git@github.com:username/username.github.com.git _deploy
# 更新插件，执行相关配置
gem install bundler
bundle install
rake setup_github_pages
# 从远程GitHub上更新source及master分支到本地对应的octopress
目录及_deploy目录下
git pull origin source
cd _deploy
git pull origin master