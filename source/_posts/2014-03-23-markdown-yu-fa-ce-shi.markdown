---
layout: post
title: "本博客 Markdown 语法测试"
date: 2014-03-23 15:18:12 +0800
comments: true
categories: [markdown]
---

```
    >> 仅支持六级标题（pre code效果）

    # 1. 一级标题

    ## 1.1. 二级标题

    ### 1.1.1. 三级标题

    #### 1.1.1.1. 四级标题

    ##### 1.1.1.1.1. 五级标题

    ###### 1.1.1.1.1.1. 六级标题
```

<!-- more -->

# 1. 一级标题

## 1.1. 二级标题

### 1.1.1. 三级标题

#### 1.1.1.1. 四级标题

##### 1.1.1.1.1. 五级标题

###### 1.1.1.1.1.1. 六级标题

```
    >> 列表

    无序列表可以用 - + * 三种写法

    - 减号1

    - 减号2

    + 加号1

    + 加号2

    * 星号1

    * 星号2

    有序列表用数字表示，序号错了会被自动识别，输出会纠正

    1. 数字1

    2. 数字2

    4. 数字4

    3. 数字3


            /* 列表中两次缩进形成的代码块 */

            var a = 2;

            var b = 4;


    列表之间可以有空行，不过 html 等处理稍有不同
    列表中得文字可以断行，建议换缩进更美观，不缩进也可以
    列表中的文字还允许有空行，至少段首要一个缩进
    列表中也可以放代码块，需要两个缩进
```

无序列表可以用 - + * 三种写法

- 减号1

- 减号2

+ 加号1

+ 加号2

* 星号1

* 星号2

有序列表用数字表示，序号错了会被自动识别，输出会纠正

1. 数字1

2. 数字2

4. 数字4

3. 数字3


        /* 列表中两次缩进形成的代码块 */

        var a = 2;

        var b = 4;

```
    >> 分割线用三个以上的减号或分割线表示，行内不能有空格以外的其他字符

    ---

    ***
```

---

***

```
    >> 强调

    *em 效果*

    **strong 效果**

    _em 效果_

    __strong 效果__
```

*em 效果*

**strong 效果**

_em 效果_

__strong 效果__

```
    >> 代码效果

    行内代码`var a = 1`

    要在代码里包含反引号，你可以使用多个反引号引起来这段代码：``There is a literal backtick (`) here.``

    ```javascript

        /* 代码块 */
        var a = 1;

        var b = 2;

        var c = function(a, b){
            return a + b;
        };

        c(a, b);

    ```
```

行内代码`var a = 1`

要在代码里包含反引号，你可以使用多个反引号引起来这段代码：``There is a literal backtick (`) here.``

```javascript

/* 代码块 */
var a = 1;

var b = 2;

var c = function(a, b){
    return a + b;
};

c(a, b);

```

```
    >> Markdown 用表示链接相同的语法来表示图片，有两种方式：内联和参考。

    内联语法

    这是 Google+ 的图标![Google+](http://www.google.com/images/icons/ui/gprofile_button-32.png)

    ![Google+](http://www.google.com/images/icons/ui/gprofile_button-32.png '标题')

    参考语法

    这是 Google+ 的图标![Google+][1]

    ![Google+][2]

    [1]: http://www.google.com/images/icons/ui/gprofile_button-32.png
    [2]: http://www.google.com/images/icons/ui/gprofile_button-32.png '标题'
```

内联语法

这是 Google+ 的图标![Google+](http://www.google.com/images/icons/ui/gprofile_button-32.png)

![Google+](http://www.google.com/images/icons/ui/gprofile_button-32.png '标题')

参考语法

这是 Google+ 的图标![Google+][1]

![Google+][2]

[1]: http://www.google.com/images/icons/ui/gprofile_button-32.png
[2]: http://www.google.com/images/icons/ui/gprofile_button-32.png '标题'

```
    >> 链接及邮件

    <http://example.com/>

    <address@example.com>
```

<http://example.com/>

<address@example.com>

```
    >> 反斜线转义 Markdown 中的特殊字符

    \as 普通字符不转义

    \*literal asterisks\*

    \\ backslash

    \`   backtick

    \*   asterisk

    \_   underscore

    \{\}  curly braces

    \[\]  square brackets

    \(\)  parentheses

    \#   hash mark

    \+   plus sign

    \-   minus sign (hyphen)

    \.   dot

    \!   exclamation mark
```

\as 普通字符不转义

\*literal asterisks\*

\\ backslash

\`   backtick

\*   asterisk

\_   underscore

\{\}  curly braces

\[\]  square brackets

\(\)  parentheses

\-   minus sign (hyphen)

\+   plus sign

\#   hash mark

\.   dot

\!   exclamation mark