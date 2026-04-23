---
title: "GitHub discovery"
date: 2024-10-12 12:19:19
tags:
  - "git"
  - "C/C++"
  - "tutorial"
  - "GitHub"
  - "Project"
  - "Game"
aliases:
  - "/blog/2024/10/GitHub_note"
---
# Intro
本次写这个博客的原因是我修读了CSC3002 C++课程，我的小组大部分人不会使用git和GitHub，所以我决定写一个教程来帮助他们入门
>于我个人而言GitHub是上大学才开始用的，在广东省的义务教育阶段，计算机相关的教育是欠缺的。我身边有同校高排名同学大一一整年没接触GitHub，也有内地名牌985同学依然使用微信传输文件进行项目开发。

>整个大一GitHub我只会clone，push，pull的基础操作。但是GitHub的功能很多，诸如issue, project, release 都很让我好奇，也相应的有各自不可或缺的功能。所以趁着CSC3002 C++ 项目的机会，我决定系统的学习一下GitHub的功能。

>在抄教程部署我的静态博客时意识到参考官方文档的重要性，本次教程主要材料是 [GitHub官方教程](https://www.github-zh.com/getting-started/introduction-to-github)。文内未标注出处默认来自官网。
>在这个教程中，我会把我认为重要的部分记录下来，以便日后查阅。你有不懂的应该上官网查阅

Note that: all the posts with "note" in their title are notes based on some materials (tutorial, lecture, etc.)  I once working on.
# 基础
## repo创建
### repo是什么
- repo就是一个云端的文件夹，可以用来存放代码，文档，图片等等。是repository（仓库）的缩写。
- see more [repo](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories)
### repo的作用
- 最基本：管理项目的文件
- 你可以用GitHub Pages的服务创建个人网站
- 你可以用创建和你用户名一样的repo来展示你的`profile README`，这回显示在你的个人主页上
- [GitHub右上角Watch、Star和Fork详解](https://zhuanlan.zhihu.com/p/103695781)
### repo的类型
- repo 分为public和private两种，public是公开的，private是私有的。private会消耗action minutes
	- Action minute 是GitHub Actions服务 的计算单位（就像话费用时间计算），是用来运行自动化任务的。
- ![[image/GitHub_note.png]]
- 上方图片是自动填写好的字段直接创建默认repo`skills-introduction-to-github`，我就不放图床了，你自己实践。
- README.md 在20s会刷新一次，直接进入到教程的第二阶段 - branch，这个是GitHub Action实现的

## branch创建
- **Fork** 是在远程创建一个仓库副本，适合独立开发和对外部项目的贡献。
- **Branch** 是在同一个仓库内创建的开发线，适合组织和管理团队内部的开发工作。
### 什么是branch
- 把main看作是项目的主线，branch是在主线上的一个分支，可以用来开发新功能，修复bug等等。创建branch的目的是为了不影响main的稳定性。
- see more [branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
- The **main** branch drop-down bar（下拉栏） will reflect your new branch and display the new branch name.
- ![[image/GitHub_note-1.png]]
- 确保名字是`my-first-branch`，会触发GitHub Action去推进教程 
- ![[image/GitHub_note-2.png]]
## commit - 在branch里面
### commit是什么
>**What is a commit?**: A _[commit](https://docs.github.com/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits)_ is a set of changes to the files and folders in your project. A commit exists in a branch. For more information, see "[About commits](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/about-commits)". 
- commit一个`PROFILE.md`文件
- commit一个`PROFILE.md`文件的更新
以上都是commit的操作

## pull request - 创建并完成
>**What is a pull request?**: **Collaboration** happens on a _[pull request](https://docs.github.com/en/get-started/quickstart/github-glossary#pull-request)_. The pull request **shows the changes in your branch to other people** and allows people to accept, reject, or suggest additional changes to your branch. In a side by side comparison, this pull request is going to keep the changes you just made on your branch and propose applying them to the `main` project branch. For more information about pull requests, see "[About pull requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)".

pull request是为了让别人看到你在branch上的变动，然后别人可以接受，拒绝或者建议更改你的branch。这个pull request是为了把你在branch上的变动应用到`main`项目分支上。
- **独立开发**：通常的工作流程是先`fork`一个仓库，然后`clone`你自己的fork到本地进行开发。开发完成后，你可以提交`pull request`到原仓库，请求合并你的代码。
- **团队开发**：在一个团队中，通常会有**一个主仓库**，团队成员会在主仓库的`main`分支上创建自己的分支进行开发。开发完成后，他们会提交`pull request`到`main`分支，请求合并他们的代码。
### 主窗口元素
#### 时间线
[[image/GitHub_note-3.png]]
![](https://s2.loli.net/2024/10/12/avyVprsbjUhTHwX.png)
[[image/GitHub_note-6.png]]
![](https://s2.loli.net/2024/10/12/KD1HhNJnp2Fe7qj.png)
所有的变动都会被记录在主窗口中，你可以看到每次commit的变动（时间，作者），然后对于pull request的变动也会在时间线里面体现。
#### 为什么管理者可以修改评论！？
在一些版本控制平台上，特别是GitHub，用户可以编辑或修改他人的评论通常是出于以下几种原因：
1. **权限设置**：项目的权限可能设置为允许特定角色（例如维护者或项目管理员）编辑任何人的评论。这有助于团队维护清晰和一致的讨论。
2. **修正错误**：有时评论可能包含拼写错误或错误的信息，允许编辑可以确保讨论的准确性。
3. **更新信息**：在持续的讨论中，信息可能会过时或需要补充，编辑评论可以让讨论更加连贯。
4. **审查和维护**：在大型项目中，维护者可能需要编辑评论以整理讨论，确保重要信息突出显示。
如果你在一个项目中发现可以修改他人的评论，确保在这样做之前获得相关人员的同意，以维护良好的合作氛围和信任。
#### 完成merge后删除branch
[[image/GitHub_note-8.png]]
![](https://s2.loli.net/2024/10/12/bn96VK7MLrCvwBX.png)
### 边栏元素
#### reviewer（审查人）和 assignees（指定人）
审查就是设置reviewer在merge前审查，减少错误。assignees被指定完成接下来的任务
CSDN疑似AI的[详细解答](https://blog.csdn.net/qq_39460032/article/details/134589700)
#### labels（标签）
标签的作用是标记issue和pull request的状态，比如这次pull requst的目的是什么。
打开下拉菜单`Apply lables to this pull request` 你会看到
- bug
- documentation
- duplicate
- enhancement
- good first issue：鼓励新手参与
- help wanted
- invalid
- question
- wontfix：描述的问题是一个bug但是将永远不会被修复
- [管理标签 - GitHub 文档](https://docs.github.com/zh/issues/using-labels-and-milestones-to-track-work/managing-labels)
#### projects（项目）和 milestone（里程碑）
- 把pull request加入到项目中，可以更好的管理项目
- 把pull request加入到里程碑中，可以更好的管理项目，你可以理解为这次pull request是项目的一个阶段的结束。
#### lock conversation（锁定对话）
![[image/GitHub_note-7.png]]
![](https://s2.loli.net/2024/10/12/tTeMUV8dBIEbmqr.png)
重要信息能被看到

### 完成教程
(https://github.com/cailikelog/skills-introduction-to-github?tab=readme-ov-file#finish)这是GitHub里面标题锚点设置方法
### Finish存档

_Congratulations, you've completed this course and joined the world of developers!_
Here's a recap of your accomplishments:
- You learned about GitHub, repositories, branches, commits, and pull requests.
- You created a branch, a commit, and a pull request.
- You merged a pull request.
- You made your first **contribution**! 🎉
所以说contribution是被接受的pull request。那那个改了一个空行能被接受的小红书用户真是牛逼。
#### What's next? 给出了接下来可以学什么
#### profile README是一个在你个人主页的readme
If you'd like to make a profile README, use the quickstart instructions below or follow the instructions in the [Managing your profile README](https://docs.github.com/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme) article.
1. Make a new public repository with a name that matches your GitHub username.
2. Create a file named `README.md` in its root. The "root" means not inside any folder in your repository.
3. Edit the contents of the `README.md` file.
4. If you created a new branch for your file, open and merge a pull request on your branch.
5. Lastly, we'd love to hear what you thought of this course [in our discussion board](https://github.com/orgs/skills/discussions/categories/introduction-to-github).
##### Check out these resources to learn more or get involved:
- Are you a student? Check out the [Student Developer Pack](https://education.github.com/pack).
- onboarding preferences for student[教程网址](https://education.github.com/learner/learn)
![[image/GitHub_note-13.png]]
- [Take another GitHub Skills course](https://github.com/skills).
- [Read the GitHub Getting Started docs](https://docs.github.com/en/get-started).
- To find projects to contribute to, check out [GitHub Explore](https://github.com/explore).
# 进阶
## GitHub Issue：提出议题，想法
[关于议题 - GitHub 文档](https://docs.github.com/zh/issues/tracking-your-work-with-issues/about-issues)

## GitHub Project：管理进度
[关于 Projects - GitHub 文档](https://docs.github.com/zh/issues/planning-and-tracking-with-projects/learning-about-projects/about-projects)
此处的project是指GitHub的项目管理功能，可以用来管理任务，协作等等。与其说是project，不如说是dashboard或者kanban更合适。
[[image/GitHub_note-12.png]]
![](https://s2.loli.net/2024/10/12/9Jx5PitcnNpz8RT.png)
_Kanban originate from Japanese 看板 # Japanese influences on industry_
- 是一个和issue，pull request，milestone等等一起工作的工具，可以用来管理任务，协作等等。
- 高级todo list

## GitHub release：发行程序
### 什么是release （发行版）
- release是一个软件的发布版本，可以包含软件的源代码，二进制文件，文档等等。
- 你可以在release里面发布软件的更新。
- 更新时候一定要标注好版本
- [[image/GitHub_note-9.png]]
- ![](https://s2.loli.net/2024/10/12/MiSReLwFGOmHJAl.png)

- 在截图中右边你可以看到tagging suggestion，让你注意版本号要写清楚
- 在Semantic versioning（语义化的版本控制）中，版本号的格式是`MAJOR.MINOR.PATCH`，这个版本号是根据你的软件的变动来决定的。详情请看[Semantic versioning](https://semver.org/lang/zh-CN/)
- ![[image/GitHub_note-10.png]]
- 发布即可

## Package：发布npm等类型的包
![[image/GitHub_note-11.png]]
[Working with the npm registry - GitHub Docs](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry)
发布npm包，使得你的项目可以被其他人直接通过npm下载使用。
这是release之后考虑的事情

## GitHub Guide
[问题指南 - GitHub 文档](https://docs.github.com/zh/issues/guides)
这里面有issue和project互动教程
- 跟着实操了一遍，感觉还是有点抽象。这种东西需要老带新，多用才会。

# 结语
GitHub强大全面的功能不愧是最好的项目开发网站


