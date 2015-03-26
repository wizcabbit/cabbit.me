---
title: 前端工程师手中的Sublime Text
description: Sublime Text算是前端开发中最常使用的文本编辑器之一，对于前端工程师来说熟悉手中的编辑器就像熟悉筷子一样重要。Sublime Text的入门文章网上已经太多了，本文只关注能提升前端工程师工作效率的技巧和插件。
keywords: sublime,插件,前端,配色,javascript next,scss,solarized
categories: tool sublime
---

![ninjas onsublime text]({{site.url}}/images/2014-11-27/ninjas-on-sublime-text-logo.jpg)

原文地址：[http://css-tricks.com/sublime-text-front-end-developers/](http://css-tricks.com/sublime-text-front-end-developers/)

Sublime Text算是前端开发中最常使用的文本编辑器之一，对于前端工程师来说熟悉手中的编辑器就像熟悉筷子一样重要。Sublime Text的入门文章网上已经太多了，本文只关注能提升前端工程师工作效率的技巧和插件。

## 语法高亮

一晃已经接近2015年，过去数年里前端开发的发展日新月异：浏览器里充斥着新增加的CSS特性（以及这些特性的N种实现），JavaScript也不像原来那样只用作给单一页面加点特效或者提交Ajax请求这么简单，我们手边有了Jade，Sass，TypeScript等等一打甚至更多种能生成HTML，CSS，JavaScript的语言，默认安装的Sublime Text已经完全无法提供这些新的语言、新的特性所需要的语法高亮和智能感知。这一节介绍了一些Package来辅助Sublime Text实现更好地语法高亮。

### JavaScript Next

[JavaScript Next](https://sublime.wbond.net/packages/JavaScriptNext%20-%20ES6%20Syntax) 提供了比默认JavaScript Package更好的语法高亮，而且他完美支持ECMAScript 6，如果你知道ECMAScript 6，或许也感受过默认安装的Sublime Text不支持modules，succinct methods, arrow functions, classes, generators, and accessors 带来的不便。

![javascript next]({{site.url}}/images/2014-11-27/javascript-next.jpg)

### CSS3

嗯是的，就是[CSS3](https://sublime.wbond.net/packages/CSS3)，默认安装的Sublime Text对CSS3的支持让人抓狂，帧动画？别开玩笑了你只会看到一片白色的纯文本一样的代码。事实上不光CSS3，我建议用CSS3 Package完全替代原来的CSS Package来完成语法高亮。

![css3]({{site.url}}/images/2014-11-27/css3.jpg)

### SCSS

Sass的开发人员们，我建议你们使用[SCSS](https://sublime.wbond.net/packages/SCSS) Package，是的我也觉得有.sass和.scss是很脑残的设定，但是我想大多数Sass开发人员实际上写的都是.scss，毕竟.scss更“像”我们熟悉的原生CSS。

![scss]({{site.url}}/images/2014-11-27/scss.jpg)

当然[Stylus](https://sublime.wbond.net/packages/Stylus)和[LESS](https://sublime.wbond.net/packages/LESS)也是写CSS的好工具，事实上我更喜欢LESS。

### 其他Package

CoffeeScript的开发人员少不了[Better-Coffescript](https://packagecontrol.io/packages/Better%20CoffeeScript)，这个Package比Package Control里官方的CoffeeScript Package要好得多，后者已经很久没有维护更新了。嗯，[TypeScript](https://packagecontrol.io/packages/TypeScript)也是个不错的选择，当然我想Visual Studio或许是更好地TypeScript工具。

[Haml](https://sublime.wbond.net/packages/Haml) Package为默认的工具增加了嵌套语言的支持，包括JavaScript，CSS，Sass等等，语法高亮比以前更方便。[Slim](https://sublime.wbond.net/packages/Ruby%20Slim)和[Jade](https://sublime.wbond.net/packages/Jade)也提供了各自的语法高亮支持，这两种语言我还不是非常了解，如果有更好的插件提供请一定分享出来。

## 插件

Sublime Text有无数有趣又有用的插件，社区的支持也是我一直用Sublime Text的原因。如果我们找一打工程师坐下来讨论Sublime Text的插件，哦算了我们还是聊聊宇宙和平吧…… 前端工程师常用的插件比如CTag不再赘述，这里说几个有趣的。

### Color Highlighter

这个插件我等了很久了，我最早用Sublime Text写CSS时候就在想“这堆颜色码谁知道是什么颜色”… [Color Highlighter](https://sublime.wbond.net/packages/Color%20Highlighter)这个插件会检测CSS文件中的颜色码，不论是Hex码或者RGB码都能很好的显示。Color Highlighter能够设置成用背景色或者边框提示颜色，我一般在Settings里做这样的设置：

```language-http"
{
	"ha_style": "filled",
	"icons": false
}
```

这样设置之后的效果是这样的：

![color highlighter]({{site.url}}/images/2014-11-27/color-highlighter.jpg)

更赞的是最近这个插件也支持了Sass、LESS以及Stylus，这也使他成为我的必备插件之一。

### Emmet

嗯，我个人不喜欢[Emmet](http://emmet.io/)这个名字，反倒是以前他叫做Zen Coding的时候更容易被人记住。大量使用Emmet只有一个坏处，那就是你可能会忘记**把标签成对打两遍**的好习惯。

用Emmet写HTML很快，真的很快。简单的把标签和需要的class名称写清，嵌套结构和闭合标签他会帮你搞定的。Jade、Slim或者Haml的支持也很好。

![emmet html]({{site.url}}/images/2014-11-27/emmet-html.gif)

### Sublime Linter

经常对代码做lint是个好习惯，这不一定是为了检测语法错误，还能减少潜在的冲突、不兼容等。后端工程师有CLint一类的工具，Sublime Text中对JavaScript的Lint支持也很好。[Sublime Linter](https://sublime.wbond.net/packages/SublimeLinter)可以在编译时就很方便的帮助我们lint代码。虽然我们通过grunt等构建工具，也可以在构建网站时强制进行lint检测，但是在编辑时的实时监测总是方便很多。

## 主题/配色

我想合适的主题和配色是能够潜在提高工程师效率的重要工具，虽然用白底黑字的记事本也能写出稳固高效的代码，但是为了我们的心情和眼睛，还是选几款好的配色比较好。前端工程师对设计和美学更加敏锐，虽然不是设计师，但我们知道“什么是美的”。在Sublime Text中改变视觉效果有两部分设置，分别是代码高亮的“配色”以及编辑器本身的“主题”（包括了Tab栏、侧边栏以及Command窗口等）。顺便插播一下，最新版本的Sublime Text 3能够指定侧边栏的文件图标了~

记得知乎上有[为什么大部分程序员都喜欢用黑色界面](http://www.zhihu.com/question/24631380)这样的问题，嗯…… 不管你使用亮色系还是暗色系的主题（事实上我在不同的编辑器分别用了这两种），下面这几种都非常值得推荐：

### Solarized Dark

[Solarized](https://github.com/SublimeColors/Solarized)在事实上设计了一套配色的标准，而非单纯的几个编辑器配色文件。我们可以在[官网](http://ethanschoonover.com/solarized)上找到大量流行IDE的Solarized配色方案，在GitHub等开源网站上更多！几乎所有数的出来的编辑器、终端工具等都可以找到Solarized风格的配色。很多顶级工程师的工具和博客也使用了这一套配色。

![solarized dark]({{site.url}}/images/2014-11-27/solarized-dark.jpg)

### Cobalt2

[Cabalt2](https://github.com/wesbos/cobalt2)这套主题是本文原作者[Wes Bos](http://wesbos.com/)推荐的主题，这套主题经过了5年以上的修改和演进。它的特点在于通过高对比度的方案吸引使用者的眼球，把注意力放在需要注意的地方。

![cabalt2]({{site.url}}/images/2014-11-27/cobalt2.jpg)

### Seti UI

黑，很黑，用来形容[Seti UI](https://sublime.wbond.net/packages/Seti_UI)不算过分，这套主题的蓝色很挑眼，我推荐这款主题只是因为这篇文章太长了需要点儿亮色~

![setiui]({{site.url}}/images/2014-11-27/setiui.jpg)

## Goto Anything

如果你之前用过Coda、Textmate或者Dreamweaver你可能对侧边栏上的文件导航及其依赖。Sublime Text带来了Goto Anything特性，只需要按下简单的 ⌘ (Ctrl on Windows) + P 就可以前往任何你想到达的位置，这是你能想到的打开文件的最快的方法。智能感知的提示框提供了模糊匹配，我们不需要记住准确的文件名，也不需要记住他在哪层文件夹里。

Goto Anything不光支持文件名，事实上他还支持前往某行，你可以使用“jquery.js:205:15”来前往jquery.js文件的205行15列。使用“@”可以前往文件里的函数、方法等等成员，再方便不过。

![goto anything]({{site.url}}/images/2014-11-27/goto.jpg)

+ 题图来源：[http://marcelkalveram.com/2013/11/10-shortcuts-to-become-a-true-sublime-text-ninja/](http://marcelkalveram.com/2013/11/10-shortcuts-to-become-a-true-sublime-text-ninja/)
