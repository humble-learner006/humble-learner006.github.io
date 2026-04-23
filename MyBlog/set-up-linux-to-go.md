---
title: "set up linux to go"
date: 2024-10-04 08:48:47
tags:
  - "linux"
  - "setup"
  - "tutorial"
  - "Computer Science"
  - "Operating Systems"
aliases:
  - "/blog/2024/10/setup-linux-to-go"
---
# 前言
最近想学习ROS，整一个纯血Linux感受一下。
虽然用wsl2也可以，但是有些时候我就是喜欢整一下可有可无的东西。做一个移动的Linux系统，插上就能用还是很有吸引力的

# 配置Linux to go
本人是Linux技术小白，参考了几篇帖子，在新买的WD-SN580固态硬盘上安装了可移动的Linux系统，即插即用很方便。
十月三号从早上九点到下午三点，一共6小时搞定了Linux to go, 测试了两台电脑均没有问题。算是大获成功。——15点08分
![ubuntu logo](https://s2.loli.net/2024/10/14/kTYN537mVqSovnW.png)
## 问题记录
我正在尝试在我的移动硬盘上安装Linux to go
1. 跟着教程走下来。Linux系统选完时区，弹出一个窗口，点击后自动重启，然后在重启还没有进入到系统的时候提示"remove the install media",我拔掉U盘后就自动进入Windows系统了。（教程中是安装完成ubuntu后会停留在Ubuntu的桌面，手动重启安装。）
2. 接着我重启，进入BIOS，选择boot Ubuntu的时候电脑BIOS界面发出蜂鸣器的beep声音。貌似无法成功boot 
3. 电脑的时间是错乱的
4. 安装时遇到的问题是显卡驱动安装失败。我从NVidia的官网上找到了驱动`.run`文件，但是安装失败。
5. ![ru sure to install?](https://s2.loli.net/2024/10/14/OVkHrTXu6lCegJq.png)
6. ![intallation fail](https://s2.loli.net/2024/10/14/dURMlHhoyJV7IYv.png)
吃饭时候跟着教程走，把图形化界面关掉了，回来看有点后怕。
![no GUI](https://s2.loli.net/2024/10/14/4wHX61mvgOA9GlB.jpg)
午饭前后的阶段，一直是开机进入grub页面，BIOS也没有作用，只能通过插上硬盘，Linux启动界面选择Windows才能进入系统
出过蓝屏的问题，用recovery修复，界面还挺好看![紫色命令行](https://s2.loli.net/2024/10/14/zk9m5XI7CDn8drx.jpg)

## 参考教程
硬盘扇区对齐，4k对齐是什么  
[安装Ubuntu Linux系统时硬盘分区最合理的方法_Ubuntu 系统分区-CSDN博客](https://blog.csdn.net/u012052268/article/details/77145427)  
[PE系统](https://post.smzdm.com/p/a07nx4z8/)选择是什么  
[how to type Chinese in Ubuntu](https://blog.csdn.net/windson_f/article/details/124932523)  
[官方解答如何设置拼音](https://askubuntu.com/questions/1408873/ubuntu-22-04-chinese-simplified-pinyin-input-support/1408874)  
[How to check my graphic card in Linux system](https://www.howtogeek.com/508993/how-to-check-which-gpu-is-installed-on-linux/)  
[The driver from NVIDIA for Linux system](https://www.nvidia.cn/drivers/details/232742/)
Drivers from Ubuntu official, and it is also recommended by NVIDIA official see [link](https://help.ubuntu.com/community/BinaryDriverHowto/Nvidia)  
[llvmpipe (LLVM 256 bits)](https://askubuntu.com/questions/1261722/llvmpipe-llvm-10-0-0-256-bits-is-getting-detected-instead-of-nvidia) means all your graphic section not work, both integrated and dedicated graphic card  

# 再编
## 2025-07-17 08:57:05
1. Linux to go没有想象中那么诱人，每次启动的时候都要进入BIOS选择启动项
2. 目前没有使用Linux系统的需求，暂时放弃了Linux to go的计划 
3. 过去的八个月没怎么用（笑死）
4. 反而是wsl2的体验更好，直接在Windows上就能使用Linux命令行

