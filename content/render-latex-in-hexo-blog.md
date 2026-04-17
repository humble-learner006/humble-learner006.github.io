---
title: "render latex in hexo blog"
date: 2025-07-21 15:58:54
tags:
  - "blog"
  - "latex"
  - "math"
  - "problem-solving"
  - "tutorial"
  - "Project"
  - "Web"
aliases:
  - "/blog/2025/07/hexo-render-latex"
---
从零开始配置Hexo博客的Latex渲染器
## 环境信息

- **操作系统**: Windows 11
- **博客框架**: Hexo
- **主题**: Landscape (默认主题)
- **渲染器**: hexo-renderer-pandoc v0.5.0
- **Shell**: PowerShell 
- **Pandoc版本**: 最新稳定版 (通过MSI安装)

## 前置条件：安装Pandoc

### 1. 下载Pandoc MSI安装包

访问 [Pandoc官方下载页面](https://pandoc.org/installing.html)，下载Windows平台的MSI安装包：

```
https://github.com/jgm/pandoc/releases/latest
```

**重要**: 必须下载 `.msi` 文件，不要使用其他安装方式（如zip包或chocolatey），MSI安装包会自动配置PATH环境变量。

### 2. 安装Pandoc

1. 双击下载的 `.msi` 文件
2. 按照安装向导完成安装
3. 安装完成后重启PowerShell终端

### 3. 验证Pandoc安装

在PowerShell中运行：

```powershell
pandoc --version
```

应该看到类似输出：
```
pandoc 3.x.x
Features: +server +lua
Scripting engine: Lua 5.4
```

如果提示"命令未找到"，需要手动添加Pandoc到PATH环境变量。

## 配置Hexo使用Pandoc渲染器

### 1. 安装hexo-renderer-pandoc

在Hexo项目根目录下运行：

```powershell
npm install hexo-renderer-pandoc --save
```

### 2. 卸载默认渲染器（可选但推荐）

```powershell
npm uninstall hexo-renderer-marked --save
```

### 3. 验证渲染器配置

运行以下命令检查：

```powershell
hexo clean
hexo generate
```

## 配置hexo-filter-mathjax以支持代码块渲染
我没有申请转载，请跳转至[知乎页面](https://zhuanlan.zhihu.com/p/660317970)，或者mathjax官网教程完成这个设置
## 遇到的问题

在配置完pandoc渲染器后，运行 `hexo generate` 时遇到了以下数学公式渲染警告：
```  
[WARNING] Could not convert TeX math  \gamma_{up} = \frac{Q_{up}}{\int_{t_0}^{t_1} P_{0}(t) dt} , rendering as TeX
```
这些警告表示pandoc无法正确转换LaTeX数学公式。
原因是
```
$$\gamma_{up} = \frac{Q_{up}}{\int_{t_0}^{t_1} P_{0}(t) dt}$$
\[ \gamma_{up} = \frac{Q_{up}}{\int_{t_0}^{t_1} P_{0}(t) dt} \]
```
是不一样的
但是这两个的区别不是出问题的根本原因，如果需要渲染公式块
正确的做法是使用双美元符号 `$$` 包裹公式 + mathjax
然后进一步在元数据（博客post模板最上面的定义配置）添加mathjax: true

注意：在添加pardoc渲染器后，mermaid图表渲染需要使用 ````mermaid` 语法块，而不是先前的 `div`标记 

```yaml

## 所有命令行命令
```powershell
# 0. 安装Pandoc MSI包
# 1. 验证pandoc安装
pandoc --version

# 2. 安装pandoc渲染器
npm install hexo-renderer-pandoc --save

# 3. 卸载默认渲染器
npm uninstall hexo-renderer-marked --save

# 4. 清理并重新生成
hexo clean
hexo generate

# 5. 本地预览测试
hexo server

# 6. 根据需要，添加mathjax的配置
```


## 演示
### Markdown代码示例
``` markdown
$E = mc^2$

\(E = mc^3\)

\[E = mc^4\]

$$E = mc^5$$

\begin{equation}
E = mc^6
\end{equation}

\begin{align}
E = mc^7 \\
E = mc^8 \\
E = mc^9
\end{align}
```
### 渲染结果

$E = mc^2$

\(E = mc^3\)

\[E = mc^4\]

$$E = mc^5$$

\begin{equation}
E = mc^6
\end{equation}

\begin{align}
E = mc^7 \\
E = mc^8 \\
E = mc^9
\end{align}

你没有想错，最后两组压根没渲染出来

## 总结
希望这个完整的技术栈配置指南能帮助到需要在Windows环境下配置Hexo+Pandoc数学渲染的朋友们！关键是要使用MSI安装包来安装Pandoc，并严格按照命令序列执行配置步骤。
