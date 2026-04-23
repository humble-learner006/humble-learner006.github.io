---
title: "Blog Building"
date: 2024-10-09 09:33:52
tags:
  - "blog"
  - "hexo"
  - "tutorial"
  - "Project"
  - "Web"
aliases:
  - "/blog/2024/10/hexo-blog-building"
---
# 记录博客配置过程

philosophy: use the default theme and record the change, to make sure the change is controllable. - that's the reason why I choose landscape theme.
# 基础信息设置
**why can't I find landscape folder in theme folder**
landscape 主题是通过 npm 安装的，在 package.json 中可以看到
## 站点配置文件的`_config.yml` 配置
站点配置文件在站点根目录下，是整个博客的配置文件，用来配置整个博客的站点信息，如网站标题、副标题、作者、语言、时区等。
``` yml
# Site
title: LIke's blog
subtitle: 'Write down my thoughts'
description: 'Knowledege is not free, you have to pay attention.'
keywords:
author: Like Cai
language: zh-CN
timezone: 'Asia/Shanghai'
```
### 留意到改变`description`和`keywords`,网站的渲染效果没变化：作用是什么？
it is used for search engine optimization(SEO)
- **description**: This field provides a brief summary of the site's content. It is often used in the meta description tag in the HTML head section, which search engines use to display a snippet of the page in search results.
  - in `next` tutorial, description is used for display sentence you like
- **keywords**: This field lists relevant keywords for the site. These keywords can be used in the meta keywords tag in the HTML head section, which some search engines use to understand the content of the page. 
  - However, note that many modern search engines **do not** heavily rely on the meta keywords tag anymore.
### url setting
``` yml
# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://cailikelog.github.io/
```
this makes the default share link become correct   
## add *table of content* [ToC] for theme landscape
如何添加文章目录
- https://fengzhenhua-vip.github.io/2021/05/20/%E5%BE%AE%E8%B0%83landscape%E4%B8%BB%E9%A2%98/
- https://jnnjiang.github.io/2019/01/14/hexo/hexo+config.html
- https://mrcuijt.github.io/2019/06/04/hexo/hexo-customer/#%E6%B7%BB%E5%8A%A0%E6%96%87%E7%AB%A0%E7%9B%AE%E5%BD%95  
- https://blog.csdn.net/weixin_29304021/article/details/118232564  
I found that those who share landscape theme, they don't use the theme now.
- The next 4 second header are my demand for the blog, landscape theme is **too difficult** to set up to meet my demand.  
when I checking for this, I found that the landscape theme is just **too basic**, so I decide to change it to next theme.  
- The [previous tutorial](https://theme-next.iissnan.com/getting-started.html) of NexT theme is too old, so I decide to use the [new one.](https://theme-next.js.org/docs/getting-started/)
- Don't drink water from fire hose
- **一定要选择官方文档！**
# next 主题设置
## pin/rank the post to the top of the page
`npm install hexo-generator-index-pin-top --save`
在[这里](https://blog.csdn.net/as480133937/article/details/100138838)解决
## add search function 
`npm install hexo-generator-searchdb --save`
在[这里](https://blog.csdn.net/as480133937/article/details/100138838)解决
官网上也有，但是按照官网的写法，我部署后搜索还是有渲染问题。
## add comment function 
暂时不加，没写有用的东西
## add RSS function to the theme: next
掘金上看到[一篇](https://juejin.cn/post/7012255009593098254)
在NexT主题文档官网看到[一篇](https://hexo-next.readthedocs.io/zh-cn/latest/next/advanced/RSS%E6%94%AF%E6%8C%81/)
讨厌需要登陆复制的网站，我有可能只用你一次你还让我登录。还是记住老一点一定**优先查看官网**
## add latex renderer function to the theme: next
在`config.next.yml`主题配置文件中，你可以找到对应的设置方式以及能指导你配置的选项。官网就是好用啊。2024-10-20 11:23:29
而且在更新完渲染部分后，我的网页在部署后可以正常渲染。  
这告诉我一个道理：如果这个东西只是膈应你，并不影响使用，那就不需要改，以后可能在升级的时候会自己解决。
## 至此，博客配置差不多完成了，以后学了前端再看看能玩出什么花样
## reference
[from landscape to all]([教你定制Hexo的landscape打造自己的主题 - 代码先锋网 (codeleading.com)](https://www.codeleading.com/article/4478454305/))  
[sample of fluid theme]([认识 LLVM - zkqiang's blog](https://zkqiang.cn/posts/5c980bc0/))  
[git tutorial from next builder]([Pro Git 简体中文版 (iissnan.com)](https://iissnan.com/progit/))  
[it is same as the book from official website](https://git-scm.com/book/zh/v2)  
[Next startup]([开始使用 - NexT 使用文档 (iissnan.com)](https://theme-next.iissnan.com/getting-started.html))  
[Hexo + GitHub = Blog]([使用 Hexo+GitHub 搭建个人免费博客教程（小白向） - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/60578464))  
[依然在更新的next geminie主题的博客，有DDIA精读系列作品](https://www.qtmuniao.com/)

# 小比样的，一直不更新
## 2025-07-14
在去北京办面签的路上完成了
1. https://www.cai-like.com 的域名购买
2. 更新了hexo的主题，从next换为landscape
3. 折腾，把hexo重新部署到github上

## 2025-07-17 12:00:56
完成mermaid设置
但是 latex 渲染有问题

## 2025-07-18 15:08:59
今天部署的时候发现
1. 不用管理员权限的时候，回合OneDrive正在同步的进程冲突
2. 所有的categories要用一种标记方式，这样稳定性会好很多
3. 大小写的问题一定要注意。目前我的原则是categories使用大写字母开头，tags用小写字母
4. 如果需要修改widget的配置，要进入 `node_modules/hexo-theme-landscape/config.yml` 文件中修改