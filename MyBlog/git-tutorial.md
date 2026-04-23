---
title: "git_tutorial"
date: 2024-10-10 12:32:38
tags:
  - "git"
  - "tutorial"
  - "unfinished"
  - "Computer Science"
  - "Language"
aliases:
  - "/blog/2024/10/git-tutorial"
---
# **About Git**
What is git?
**A system:** Git is a distributed version control system.  
**Version Control:** We can go back to previous version if something screw up in VCS(version control system).    
One of the most widely distributed VCS is [RCS](https://en.wikipedia.org/wiki/Revision_Control_System) ,work by adding patches/ delta between file, develop from its predecessor – SCCS (Source Code Control system)   
**Branching** means you diverge from the main line of development and continue to do work without messing with that main line. 

兴趣阅读：[版本管理系统的发展历史](https://zhuanlan.zhihu.com/p/95179354)
**Git** work by taking snapshot, not difference.

# git commands
## push操作流程
确保这是一个仓库`.git`文件存在
- `git status` 查看当前状态，记得查看branch
- `git add *` 添加所有要更改的文件到暂存区（stage）
- `git commit -m "<message>"` 提交暂存区到仓库区（commit）
- `git push origin main`把本地库的内容推送到远程  
你可以参考 [cs61b lab1 section E](https://sp21.datastructur.es/materials/lab/lab1/lab1) 十分好的 git 教程

## fetch/pull操作流程
如果你只是为了更新本地文件，可以使用 `git pull` 命令从远程仓库获取最新的更改并合并到你的本地分支。以下是步骤：
`git checkout main`
(checkout)切换到你想要更新的分支（通常是 main 或 master 分支）：
`git pull origin main`
拉取远程仓库的最新更改并合并到本地分支：
- `git fetch origin main` 从远程获取最新版本到本地，不会自动merge
- `git pull origin main` 把远程库(origin和远程库的URL等价)的内容拉下来，然后与本地的文件合并
### merge（合并）
1. 本地分支合并：你可以在本地将一个分支合并到另一个分支。
feature-branch 是你要合并的分支，main 是目标分支。一般在freture branch开发新功能或修复bug.
```
git checkout main
git merge feature-branch
```
1. 解决冲突：如果在合并过程中发生冲突，你需要在本地解决这些冲突，然后提交解决后的文件。
```git
give your resolved file to git
git add <resolved-files>
git commit -m "Resolved merge conflicts"
```
1. 推送到远程：合并完成并解决冲突后，你可以将合并后的分支推送到远程仓库。
`git push origin main`

## 分支branch
并行开发必备
- `git branch` 查看分支，确认当前的分支信息
step 1： `git branch <branch-name>` 创建分支
step 2: 在新分支上开发功能
```git
git add *
git commit -m "My new feature"
```
step 3: 推送新分支到远程仓库`git push origin <feature-branch>`
step 4: 切换到主分支`git checkout main`
step 5: 合并分支`git merge <feature-branch>`
step 6: 删除分支`git branch -d <feature-branch>`
step 7: 删除远程分支`git push origin --delete <feature-branch>`

## Configure your git
Git branch, first set up then we discuss how it should be used 
`git config –h`（get the help of config command, show in editor） 
`git help config` （show in browser） 
`git init` （change it into git respository） 
`git status` （know what inside the file/ git repository） 
`git add <name>` 
`git add –A` （add all）`git add .`/`git add --all` 
`git rm –cached <name>` 
`git rm –f <name>`
`git mv <name> <name>`
`git log -oneline` -

# 3 status of your file
`Modified – staged（in the middle）-- committed(.git) `
潜在的unchange data可以比喻为在家里的人。
modified可以被比喻为所有在车站的人，有可能不会上车
staged 可以被比喻为在月台的人，是即将上车的人，但是也可能不上车（日程取消）
committed 可以被比喻为在火车上的人，被送到目的地云端
## 基本操作（按照常用程度排序）
`cd + <location>`（change derectory）
`git branch` 查看分支
`git log` 查看提交历史
`git status` 查看当前状态
`git diff` 查看修改内容
`git add` 添加文件到暂存区
`git add *` 添加所有文件到暂存区
`git commit -m "<message>"` 提交暂存区到仓库区
`git reset HEAD` 把暂存区的修改撤销掉（unstage），重新放回工作区
`git remote -v` 查看远程库信息
`git push origin main` 把本地库的内容推送到远程
```
git push origin main
git pull origin main
```
`git push -u origin main` 以后的推送或者拉取就可以简化命令
`-u` stands for upstream
you can use `--set-upstream` set upstrea (same function as `-u`)
```
git push
git pull
```

# Package manager （Linux系统必要了解） 
软件包管理器：一种计算机程序，负责安装、更新和配置其他软件，维护已安装程序的索引并解决它们之间的依赖关系。
- Knowing your system's package manager is essential for managing software effectively. 
- It ensures you **use the correct commands** and syntax to install, update, and remove packages successfully. 
## two type of package manager 
dnf: This is the default package manager for Fedora and other Red Hat-based systems. 
apt-get: This is the default package manager for Debian, Ubuntu, and other Debian-based systems. 
