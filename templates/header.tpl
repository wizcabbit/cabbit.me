<!DOCTYPE html>
<html>
  <head>
    <title>{$PAGE_TITLE|default:'Portfolio @wizcabbit'}</title>
    <meta charset="utf-8">
    <meta name="author" content="wizcabbit,frontfreewzy@gmail.com">
    <meta name="keywords" content="wizcabbit,Wang Zhi Yong,portfolio,resume,frontfree,{$PAGE_KEYWORDS|default:''}">
    <meta name="description" content="wizcabbit (WANG Zhi Yong)'s portfolio, resume.">
    <meta name="viewport" content="width=device-width">
    <link rel="shortcut icon" href="{$WEB_ROOT}/favicon.ico" />
{if !$IS_DEBUG}
{literal}
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create','UA-55766499-1','auto');ga('send','pageview');
    </script>
{/literal}
{/if}
    <!-- Stylesheet -->
{if $IS_DEBUG}
    <link rel="stylesheet" href="{$WEB_ROOT}/styles/common.css">
    <link rel="stylesheet" href="{$WEB_ROOT}/styles/index.css">
    <link rel="stylesheet" href="{$WEB_ROOT}/styles/project.css">
    <link rel="stylesheet" href="{$WEB_ROOT}/styles/static.css">
{else}
    <link rel="stylesheet" href="{$WEB_ROOT}/styles/all.min.css">
{/if}
  </head>
  <body>
    <div id="container"><!-- BEGIN container -->
      <div id="header-wrapper">
        <div id="header"><!-- BEGIN header -->
          <div id="banner">
            <div id="logo"><!-- BEGIN logo -->
              <a href="{$WEB_ROOT}">
                <img src="{$WEB_ROOT}/images/logo_80.jpg" alt="WANG Zhi Yong">
                <h1>wizcabbit</h1>
              </a>
            </div><!-- BEGIN logo -->
          </div>
          <div id="nav"><!-- BEGIN navigation -->
            <ul class="nav-links">
              <li><a href="//blog.cabbit.me">Blog</a></li>
              <li><a id="projects" href="{$WEB_ROOT}">Portfilio</a></li>
              <li><a id="resume" href="{$WEB_ROOT}/resume">Resume</a></li>
            </ul>
          </div><!-- BEGIN navigation -->
        </div><!-- END header -->
      </div>
      <div id="main-wrapper">
        <div id="main"><!-- BEGIN main -->
