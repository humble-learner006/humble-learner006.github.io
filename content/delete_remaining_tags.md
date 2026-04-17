---
title: "delete_remaining_tags"
date: 2024-10-09 09:33:52
tags:
  - "problem_solving"
  - "Project"
  - "Web"
aliases:
  - "/blog/2024/10/hexo-delete_remaining_tags"
---
# Delete remaining tags in Hexo old blog
recently I start to write new blogs, due to the inspiration of Ruan Yifeng. 
And I want to change my theme from butterfly to NexT. 

I start the work on the night of October 8th. What I did is 
1. download `NexT` from github
2. change the `_config.yml` file in root path, from `butterfly` to `NexT`
 and it works after I use `hexo clean` and `hexo g`
3. copy the `_config.yml` file in `themes/NexT` to `_config.next.yml` in root path.

However, I found that the old tags **are still there**. Tags are suppose to be deleted after the blog is deleted. But things are not that simple. 

I check all the customized setting in my folder.
1. not every blog writter create a `_config.<theme_name>.yml` file in the root path.
2. I change the theme, maybe it is relate to existing theme config in butterfly.
3. If the remaining_tags have something to do with the source code, searching the tags name in the workspace is a good way.

For first, it is irrelevant influencing factors. For second nothing changed after I switch back to butterfly
for third, I could not find the tags name in the workspace.
  
So I think it maybe something relate to website cache.
1. delete most of the post in `source/_posts`
2. delete folder `public`
3. delete all files on GitHub repository
4. delete `db.json` as GPT suggested.
5. delete `node_modules`
6. regenerate the tags and categories by `hexo new page tags` and `hexo new page categories`
7. delete all the tags and categories in `source/_posts`
8. create this post to test.

日期：2024年10月10日16点33分更新，可能清除`public` folder and `.deploy`即可

It occurred a problem that the tags and categories and tags change from 6 to 7 due to my new tag prose. And both categories and tags are unclicable button on the website.

>在 Hexo 博客的 Next 主题中，分类和标签按钮不可点击的可能原因有以下几种：<br>
主题配置错误：检查 _config.yml 文件中的相关配置，确保分类和标签的设置正确。<br>
数据源问题：确保你的文章确实有分类和标签。没有任何分类或标签的文章可能导致按钮无法显示。

A rediculous mistake: all the `hexo clean` have been typed as `hexo clear` make it no use
After revice that I checked `hexo --config` as instruction it gave.
it gave me error message as follow
```
62589@DESKTOP-OQLQ1BU MINGW64 /d/Desktop/hexo_blog
$ hexo --config
ERROR configPaths.includes is not a function
ERROR Local hexo loading failed in D:\Desktop\hexo_blog
ERROR Try running: 'rm -rf node_modules && npm install --force'
```
So I tried to delete `node_modules` and `npm install --force`
then the error message changed to some render mistake
`$ npm uninstall hexo-renderer-swig` seems that swig is not supported anymore and as Copilot suggested I tried to change to nunjucks `npm install hexo-renderer-nunjucks --save`
no use, then as terminal message said, I tried to run
`npm audit fix --force`
It worked to a certain degree. And the number of categories and tags are correct now. But it is still not clickable.
Then as Copilot suggested, I reinstall the theme NexT. And my website finally - broken. It have some problem with `_config.next.yml` because some costomized setting in various file.

```
FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.htm
l
TypeError: Cannot read properties of undefined (reading 'enable')
    at D:\Desktop\my CSC\Hexo_blog\themes\next\scripts\filters\comment\gitalk.js:10:21
    at Filter.execSync (D:\Desktop\my CSC\Hexo_blog\node_modules\hexo\dist\extend\filter.js:72:36)
    at Hexo.execFilterSync (D:\Desktop\my CSC\Hexo_blog\node_modules\hexo\dist\hexo\index.js:397:35)
    at module.exports (D:\Desktop\my CSC\Hexo_blog\themes\next\scripts\events\lib\injects.js:58:8)
    at Hexo.<anonymous> (D:\Desktop\my CSC\Hexo_blog\themes\next\scripts\events\index.js:9:27)
    at Hexo.emit (node:events:530:35)
    at Hexo._generate (D:\Desktop\my CSC\Hexo_blog\node_modules\hexo\dist\hexo\index.js:374:14)
    at D:\Desktop\my CSC\Hexo_blog\node_modules\hexo\dist\hexo\index.js:265:25
    at tryCatcher (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\util.js:16:23)
    at Promise._settlePromiseFromHandler (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\
promise.js:547:31)
    at Promise._settlePromise (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js:
604:18)
    at Promise._settlePromise0 (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js
:649:10)
    at Promise._settlePromises (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js
:729:18)
    at Promise._fulfill (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js:673:18
)
    at PromiseArray._resolve (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise_arra
y.js:127:19)
    at PromiseArray._promiseFulfilled (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\pro
mise_array.js:145:14)
    at Promise._settlePromise (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js:
609:26)
    at Promise._settlePromise0 (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js
:649:10)
    at Promise._settlePromises (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js
:729:18)
    at Promise._fulfill (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js:673:18
)
    at Promise._settlePromise (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js:
617:21)
    at Promise._settlePromise0 (D:\Desktop\my CSC\Hexo_blog\node_modules\bluebird\js\release\promise.js
:649:10)
```
What I learn is that never getting too deep into something you do not know.

I reinstall Hexo to make sure the `_config.yml` is not polluted, and not planing to make any costomized setting if not neccessary.
After it is a blog, I will frist focus on the **content**.
