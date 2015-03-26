---
layout: "nojquery"
title: 抛弃jQuery：DOM API之操作元素
description: 这次我们来聊一聊如何使用DOM API创建新元素、修改已有元素的属性或者移动元素的位置。原生的浏览器API已经给我们提供了DOM操作的所有功能，我们能够不借助jQuery或者其他函数库的帮助就完成这些。
keywords:
categories: no-jquery
permalink: /you-dont-need-jquery/manipulation
---

原文链接：[http://blog.garstasio.com/you-dont-need-jquery/dom-manipulation/](http://blog.garstasio.com/you-dont-need-jquery/dom-manipulation/)

## DOM API 之操作元素

在[上一篇文章里]({% post_url /you-dont-need-jquery/2014-12-21-selector %}/)我们讨论了如何在没有jQuery的支持下选择元素，这次我们来聊一聊如何使用DOM API创建新元素、修改已有元素的属性或者移动元素的位置。原生的浏览器API已经给我们提供了DOM操作的所有功能，我们能够不借助jQuery或者其他函数库的帮助就完成这些。

当然有些操作会显得比较冗长，所以我必须再强调一遍，**这系列文章的用意不是让开发人员不分情况的彻底丢弃jQuery**，而是希望我们能够在没有jQuery的帮助时也能完成这些任务。在实际生产中我们依然会使用各种函数库，但是我们可以仔细选择，使用更加适合我们需要的库，而不是不分情况的把整个jQuery都加载到页面里。

+ [创建元素](#create)
+ [在元素前/后插入元素](#insert)
+ [作为子元素插入](#insert-child)
+ [移动元素](#move)
+ [删除元素](#remove)
+ [添加/删除 CSS Classes](#css)
+ [添加/删除/修改元素属性](#attr)
+ [添加/修改内容](#content)
+ [添加/修改 Style](#style)
+ [专用的DOM操作库](#lib)

<h3 id="create">创建元素</h3>

jQuery

如果我们要创建一个 div 元素：

{% highlight javascript %}
$('<div></div>');
{% endhighlight %}


DOM API，createElement这个很常见了：

{% highlight javascript %}
// IE 5.5+
document.createElement('div');
{% endhighlight %}

或许有人会说，jQuery省去了好些字符。这没错，但确实要依照工程实际而定，如果我们只是用到jQuery的小部分功能，那省去的字数可能还没有jQuery自身的文件大。

<h3 id="insert">在元素前/后插入元素</h3>

假设我们已经有了如下HTML结构：

{% highlight html %}
<div id="1"></div>
<div id="2"></div>
<div id="3"></div>
{% endhighlight %}

现在我们要在 id=1 的 div 后面插入一个 id=1.1 的新 div 元素，期望的结果是这样的：

{% highlight html %}
<div id="1"></div>
<div id="1.1"></div>
<div id="2"></div>
<div id="3"></div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#1').after('<div id="1.1"></div>');
{% endhighlight %}

DOM API，有Web开发新人会认为链式调用是jQuery的专利，事实上没有jQuery我们也可以使用链式调用：


{% highlight javascript %}
// IE 4+
document.getElementById('1')
    .insertAdjacentHTML('afterend', '<div id="1.1"></div>');
{% endhighlight %}

哈哈，这可能是DOM API里不多的从IE 4开始就没怎么变化过的函数了~

假设我们希望在 id=1 的 div 前面插入一个 id=0.9 的新 div 元素，期望的结果是这样：

{% highlight html %}
<div id="0.9"></div>
<div id="1"></div>
<div id="2"></div>
<div id="3"></div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#1').before('<div id="0.9"></div>');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 4+
document.getElementById('1')
    .insertAdjacentHTML('beforebegin', '<div id="0.9"></div>');
{% endhighlight %}

同在后面插入相比，只有一个参数不同。不得不说，看到一个函数被IE 4以上所有的浏览器都支持的时候，作为一个前端开发人员我还是挺惊讶的 ^_^

<h3 id="insert-child">作为子元素插入</h3>

假设我们已经有了如下HTML结构：

{% highlight html %}
<div id="parent">
    <div id="oldChild"></div>
</div>
{% endhighlight %}

现在我们希望在 parent 容器的第一个子元素之前插入一个新的 div 元素，就象这样：

{% highlight html %}
<div id="parent">
    <div id="newChild"></div>
    <div id="oldChild"></div>
</div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#parent').prepend('<div id="newChild"></div>');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 4+
document.getElementById('parent')
    .insertAdjacentHTML('afterbegin', '<div id="newChild"></div>');
{% endhighlight %}

如果我们希望在第一个子元素的后面插入那个 div 元素，期望得到这样的结构：

{% highlight html %}
<div id="parent">
    <div id="oldChild"></div>
    <div id="newChild"></div>
</div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#parent').append('<div id="newChild"></div>');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 4+
document.getElementById('parent')
    .insertAdjacentHTML('beforeend', '<div id="newChild"></div>');
{% endhighlight %}

这一节看上去和上一节差不多，总之我们发现使用DOM API操作元素也不是很复杂，而且到目前为止对浏览器的兼容性都很不错，包括古老的IE浏览器也能很好的适应。

<h3 id="move">移动元素</h3>

假设有以下HTML结构：

{% highlight html %}
<div id="parent">
    <div id="c1"></div>
    <div id="c2"></div>
    <div id="c3"></div>
</div>
<div id="orphan"></div>
{% endhighlight %}

在这里希望把 #orphan 移动到 parent 容器中作为最后一个元素，期望的HTML是：

{% highlight html %}
<div id="parent">
    <div id="c1"></div>
    <div id="c2"></div>
    <div id="c3"></div>
    <div id="orphan"></div>
</div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#parent').append($('#orphan'));
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('parent')
    .appendChild(document.getElementById('orphan'));
{% endhighlight %}

也还是蛮好记的对不对？如果我们希望把 #orphan 移动到 parent 容器的第一个元素，类似于：

{% highlight html %}
<div id="parent">
    <div id="orphan"></div>
    <div id="c1"></div>
    <div id="c2"></div>
    <div id="c3"></div>
</div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#parent').prepend($('#orphan'));
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('parent')
    .insertBefore(document.getElementById('orphan'), document.getElementById('c1'));
{% endhighlight %}

直接使用DOM API看上去确实很长，这都是拜 document.getElementById 所赐。

<h3 id="remove">删除元素</h3>

假设我们的HTML元素中有一个 id="foobar" 的元素，我们希望把他从DOM树中删除：

jQuery

{% highlight javascript %}
$('#foobar').remove();
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('foobar')
    .parentNode.removeChild(document.getElementById('foobar'));
{% endhighlight %}

<h3 id="css">添加/删除 CSS Classes</h3>

假设在HTML中有这样一个 div ：

{% highlight html %}
<div id="foo"></div>
{% endhighlight %}

我们希望给他加入名为 bold 的CSS Class，期望DOM变成这样：

{% highlight html %}
<div id="foo" class="bold"></div>
{% endhighlight %}

jQuery

{% highlight javascript %}
$('#foo').addClass('bold');
{% endhighlight %}

DOM API

{% highlight javascript %}
document.getElementById('foo').className += 'bold';
{% endhighlight %}

当然我们还可以把刚刚加上的Class删除掉：

jQuery

{% highlight javascript %}
$('#foo').removeClass('bold');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('foo').className =
    document.getElementById('foo').className.replace(/^bold$/, '');
{% endhighlight %}

<h3 id="attr">添加/删除/修改元素属性</h3>

仍然从简单的 foo 元素开始：

{% highlight html %}
<div id="foo"></div>
{% endhighlight %}

我们希望在 div 元素上设定 role="button" 来让它能够充当一个 button，这样能够在可访问性设备（屏幕阅读器等）上获得较好的可访问性：

jQuery

{% highlight javascript %}
$('#foo').attr('role', 'button');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('foo').setAttribute('role', 'button');
{% endhighlight %}

这两种方法都可以识别元素是否已经具备了这个属性，然后自动创建/更新这个属性。现在让我们再把这个 role 删除掉（我都觉得自己好烦…）

jQuery

{% highlight javascript %}
$('#foo').removeAttr('role');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('foo').removeAttribute('role');
{% endhighlight %}

<h3 id="content">添加/修改内容</h3>

这次的 foo 元素比原来复杂多了（^_^）：

{% highlight html %}
<div id="foo">Hi there!</div>
{% endhighlight %}

如果要把 foo 的内容改成 Goodbye!：

jQuery

{% highlight javascript %}
$('#foo').text('Goodbye!');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('foo').innerHTML = 'Goodbye!';

// IE 5.5+ but NOT Firefox
document.getElementById('foo').innerText = 'GoodBye!';

// IE 9+
document.getElementById('foo').textContent = 'Goodbye!';
{% endhighlight %}

最常见的 innerHTML 属性在各种条件下都工作的很好。但是 innerText 和 textContent 的好处在于他们只是处理目标元素内的文字，而不是像 innerHTML 一样直接插入标签。当插入的内容是用户输入的内容时，这样能够一定程度上避免注入的问题。

<h3 id="style">添加/修改 Style</h3>

一般来说，直接用JavaScript脚本操作DOM元素的 style 是代码中的“坏味道”，当然就像 goto 一样我们总会有些时候需要这样做。

假设HTML的结构是这样的：

{% highlight html %}
<span id="note">Attention!</span>
{% endhighlight %}

可以通过JavaScript代码让这段文字变得醒目一些，比如变成粗体（或者闪烁三下/转体三圈):

jQuery

{% highlight javascript %}
$('#note').css('fontWeight', 'bold');
{% endhighlight %}

DOM API

{% highlight javascript %}
// IE 5.5+
document.getElementById('note').style.fontWeight = 'bold';
{% endhighlight %}

这里很难得我比较喜欢DOM API写法，style.fontWeight 看上去比较像是正常的对象-属性的逻辑。

<h3 id="lib">专用的DOM操作库</h3>

看到这里比上一篇[选择元素]({% post_url /you-dont-need-jquery/2014-12-21-selector %}/)要容易一些，在IE 6及以上的版本中跨浏览器使用DOM API操作元素相对比较容易。jQuery确实使得冗长的DOM API变得简单易懂，但是如果只是把jQuery用作DOM操作，似乎还是有些大材小用。我们可以试试[jBone](https://github.com/kupriyanenko/jbone)和[dom.js](https://github.com/dkraczkowski/dom.js)这两个库，他们都可以在跨浏览器的情况下很好的兼容DOM元素操作，著名的Backbone中使用的正是前者。很多使用jQuery的开发人员觉得原生的DOM API不堪入目，但是我想他们并不真的掌握DOM API，其实DOM API并没有比jQuery复杂太多。

如果我有漏掉什么重要的DOM元素操作，请在评论中告诉我。
