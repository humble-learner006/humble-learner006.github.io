---
title: "我常用的mermaid图表"
date: 2025-07-30
tags:
  - "blog"
  - "mermaid"
aliases:
  - "/blog/2025/07/mermaid-draw-graph"
---

mermaid图表速查

> Mermaid is a JavaScript based diagramming and charting tool that uses Markdown-inspired text definitions and a renderer to create and modify complex diagrams.

Mermaid 是一个基于 JavaScript 的图表绘制工具，可以在 Markdown 中使用。它支持多种图表类型，包括流程图、序列图、甘特图等。

# 我的使用场景

主要使用 flowchart 和 gantt，其他目前用不到。2025-07-30 花了一个多小时看完了mermaid 官方所有的 tutorial。以下是我的感受：

1. mermaid可以实现多数你知道的图表类型。
2. mermaid的目的是文本表示图表，相比于图片是一种更适合出现在说明文档里的展示形式。
3. 只需要了解mermaid能实现什么，有个大致印象即可，用时在查看文档。

# flowchart

## node

```
flowchart RL
    A@{ shape: manual-file, label: "File Handling"}
    B@{ shape: manual-input, label: "User Input"}
    markdown["`This **is** _Markdown_`"]
    newLines["`Line1
    Line 2
    Line 3`"]
    markdown --> newLines
A --> C
B --> A
```

这个例子是错误的，只是展示了我的构建图表的思路。从以上的例子，观察到有两种声明节点的方式：

1. 使用 `<node_id>@{shape_def:shape; label_def:content}` 语法来声明节点的形状和content。
2. 使用 `<node_id>["content"]` 语法来声明节点的content。

然后再批量用箭头链接节点的 `<id>`。

## edge

| 样式 | 语法 |
|------|------|
| 箭头实线 | `-->` |
| 加粗箭头实线 | `==>` |
| 箭头虚线 | `-.->` |
