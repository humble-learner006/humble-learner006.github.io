---
title: "Qt 教程"
date: 2024-10-09 23:00:00
tags:
  - "tutorial"
  - "setup"
  - "Qt"
  - "Project"
  - "Game"
aliases:
  - "/blog/2024/10/Qt_tutorial"
---
# Qt版本：Qt 6.7.2 项目配置

本教程参考哔哩哔哩系列[视频](https://www.bilibili.com/video/BV1km4y1k7CW/?p=6&spm_id_from=pageDriver&vd_source=113cb04caaabeca910d6d5580d23d578)
`help -> about qt creater`查看版本
![](https://s2.loli.net/2024/10/10/ujXJRtxQGUE9c2N.png)

## 在Qt中创建一个GUI项目
### step 1: choose a template
![](https://s2.loli.net/2024/10/10/1cUm6pMF2vZCOys.png)

选择一个模板，这里选择一个空的模板
`Qt widgets application`
- 可以看到有图标，根据图标大概能知道这个模板是什么模板
- 右边也会有对模板的描述
### step 2: Project location
![](https://s2.loli.net/2024/10/10/jBR2MHCDKpc8yYg.png)

选择你的文件位置，命名的你文件名字

### step 3: Define Build System
![](https://s2.loli.net/2024/10/10/cXmviKfrLSExnpR.png)
- 选择CMake，可以参考[这里](https://slaptijack.com/programming/cmake-for-cpp.html)
- 什么是[[CSC3002/01_CSC3002_note/Build system|Build system]]
- 我跟教程走，选择qmake
- 项目管理文件qmake -> .pro文件; cmake -> CMakeLists.txt文件
### step 4: class information
![](https://s2.loli.net/2024/10/10/RT6dwcZ98DtyVSO.png)

widget: used to refer to any small device that you do not know the name of（不知名的）小器物，小装置，小玩意儿( informal ) *from oxford*
- widget空窗口（只有窗口标题）
	- mianWindow主窗口（菜单栏等）
	- dialog对话框（有Yes or no的选项)
- 建议类名选择大写开头
- 勾选后有widget.ui的文件，这个文件会有ui的信息
选择翻译后的语言，存储在zh_CN.qm文件中，我们用英文开发，有中文的语言包
![](https://s2.loli.net/2024/10/10/EPra8uAYgikH7dS.png)

### step 5: Kit selection 
编译套件的选择，选择Qt自带的编译器 MinGW 64-bit
![](https://s2.loli.net/2024/10/10/rEuBatbvcfyRWI5.png)
### step 6: 版本控制系统选择
代码同步工具
- SVN
- GIT
### finish
完成！
如果高版本的Qt可能出现**报错和警告**，尝试：`help -- about plugins -- c++ -- ClangCodeModle`取消勾选，重启软件。
![](https://s2.loli.net/2024/10/10/miBu3RPaWjdvzlS.png)

![](https://s2.loli.net/2024/10/10/gTeIA1pixdWRbNu.png)


## 效果展示：Hello world in Window
in `widget.ui `design中的窗口设计, 选择一个`label`和一个`push button`(the advantage of qt is that you can drag and drop to design the window))
![](https://s2.loli.net/2024/10/10/jUvFDIQn24WE8rx.png)

## trouble shooting
### 点击`.pro`多数能打开项目，因为`qmake`是默认的构建系统
### 点击`CMakeLists.txt`无法正常打开项目
#### 确认cmake是否安装
1. type `cmake --version` in cmd， 你会得到cmake的版本号
2. else安装cmake from [here](https://cmake.org/download/)
#### 确认环境变量是否配置正确
2. type `echo %PATH%` in cmd， 你会得到目前你所有的 PATH，检查qt是否在里面
3. ![](https://s2.loli.net/2024/10/10/VT7t9nawDfiWXge.png)
4. **注意**：区分QtCreator 和 Qt，QtCreator是IDE，Qt是库
5. **注意**：Path在*用户变量*有时不会正常生效（Kimi的观点）设置在*系统变量*
#### 在`issue`查看configuration fail的原因
每个人的原因可能不一样
![](https://s2.loli.net/2024/10/10/gHB8dAFYKXsZiDv.png)
我的是`build type`的问题，我选择了`debug`，但是我的`debug`没有配置
1. **清理构建目录**`clear CMake configuration`：清理您的构建目录，以确保与构建缓存和配置无关的干净状态。您可以在 Qt Creator 中通过“构建”菜单中的“清理项目”选项清理构建目录。
2.  **重新配置项目**`run CMake`：重新配置项目
### 尝试Qt自带的案例`examples`，感受项目的效果
![](https://s2.loli.net/2024/10/10/3fTwkE5tAyCJc7V.png)
*p.s.*
- in left sidebar `projects`you see the `calqlatre` is in bold font, that means it is the current **active** project
- you can see the compiling process in the `compile output` in the bottom
- you can see the `issues` in the bottom, if there is any error, you can see it here
- the calculator window will pop up after compiling
- 先build （锤子）后 run （绿三角）

## AI生成的回答（仅参考）
### build debug /release 区别
#### Debug 构建：

1. **编译优化**：通常不进行优化或仅进行最小优化，以便于调试。
2. **调试信息**：包含完整的调试信息，如符号信息，这有助于调试器定位代码中的问题。
3. **执行速度**：由于没有优化，执行速度通常较慢。
4. **错误检查**：包含额外的错误检查和断言，有助于在开发过程中发现问题。
5. **内存使用**：可能会使用更多的内存，因为优化较少。
6. **日志记录**：可能会包含更详细的日志记录，以帮助追踪问题。
7. **符号名称**：变量和函数名称不会被优化掉，保持源代码中的名称，便于调试。

#### Release 构建：

1. **编译优化**：进行高度优化，以提高应用程序的性能。
2. **调试信息**：通常不包含调试信息，或只包含非常有限的调试信息。
3. **执行速度**：由于进行了优化，执行速度较快。
4. **错误检查**：错误检查和断言可能会被禁用或减少，以避免影响性能。
5. **内存使用**：优化内存使用，以减少应用程序的内存占用。
6. **日志记录**：日志记录可能会被禁用或减少，以避免影响性能。
7. **符号名称**：变量和函数名称可能会被缩短，以减少二进制文件的大小。

#### 为什么需要不同的构建方式？

- **开发和调试**：Debug 构建提供了必要的调试信息和工具，帮助开发者在开发过程中发现和修复错误。
- **性能测试**：Release 构建通过优化提供了应用程序的最佳性能，这对于性能测试和最终用户是非常重要的。
- **部署**：最终用户通常使用 Release 构建，因为它提供了更好的性能和更小的二进制文件大小。

在实际开发过程中，开发者可能会在 Debug 模式下编写和测试代码，然后切换到 Release 模式进行性能测试和部署。
### build和compile的区别
#### 编译（Compile）：

1. **定义**：编译是将源代码（通常是单个文件，如 `.c`、`.cpp` 文件等）转换成机器码的过程，生成的目标文件通常具有 `.obj` 或 `.o` 扩展名。
2. **编译器**：编译过程通常由编译器完成，如 GCC、Clang、MSVC 等。
3. **单个文件**：编译通常针对单个源文件，将其从高级语言转换为低级语言。
4. **语法检查**：编译过程中，编译器会检查语法错误。
5. **优化**：编译器可能会对代码进行优化，以提高性能或减少生成的机器代码的大小。

#### 构建（Build）：

1. **定义**：构建是一个更广泛的过程，它包括编译、链接等多个步骤，将多个源文件和资源（如库文件、资源文件等）组合成一个可执行文件或库文件。
2. **构建系统**：构建过程通常由构建系统或构建工具管理，如 Make、CMake、MSBuild、Ant 等。
3. **多个文件**：构建过程涉及多个源文件和可能的库文件。
4. **依赖管理**：构建系统会管理文件之间的依赖关系，并确定编译的顺序。
5. **链接**：构建过程包括链接步骤，将编译后的目标文件与库文件链接在一起，生成最终的可执行文件或库文件。
6. **自动化**：构建过程可以自动化，通常通过编写构建脚本来定义构建的规则和步骤。

#### 区别：

- **范围**：编译是构建过程中的一个步骤，构建是一个更全面的过程。
- **目标**：编译的目标是生成目标文件，而构建的目标是生成可执行文件或库文件。
- **过程**：编译过程关注单个源文件的转换，构建过程关注整个项目从源代码到可执行文件的完整流程。