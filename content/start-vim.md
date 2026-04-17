---
title: "start_vim"
date: 2025-01-07 20:47:41
tags:
  - "vim"
  - "editor"
  - "tutorial"
  - "tools"
  - "Computer Science"
  - "Language"
aliases:
  - "/blog/2025/01/start-vim"
---
cop**y** and **p**aste from [missing semester](https://missing.csail.mit.edu/2020/editors/)
# how to learn vim
Here’s how you learn a new editor:

- Start with a tutorial (i.e. this lecture, plus resources that we point out)  
- Stick with using the editor for all your text editing needs (even if it slows you down initially)  
- Look things up as you go: if it seems like there should be a better way to do something, there probably is  

# vim modes
## i for insert mode
from normal mode:
- `i` to enter insert mode at the cursor
- `o` to enter insert mode on the next line

## esc for normal mode (from insert mode)
- normal mode is for **viewing and editing** text
### moving around
- moving my cursor around using `h`, `j`, `k`, `l` (left, down, up, right)
- `w` to move forward by word, `b` to move back by word
- `e` for end of word. 
- `0` to move to the beginning of the line, `$` to move to the end of the line
- `gg` to move to the beginning of the file, `G` to move to the end of the file
- line moves
- absolute distance from beginning `:10` to move to line 10
- reletive distance from current line `10j` to move down 10 lines, `10k` to move up 10 lines
- page moves
- `ctrl + d` to move down half a page, `ctrl + u` to move up half a page
- `ctrl + f` to move down a page, `ctrl + b` to move up a page
- find moves
- `f` to find a character on the line, `;` to find the next instance of that character
- e.g. `f` then `a` to find the next `a` on the line
- `F` is for backwards find
- `t` is for find up to a character
- `T` is for backwards find up to a character
- 
### editing
- `x` to delete a character (making small changes in normal mode)
- `dd` to delete a line

## : for command mode
- `:q` to quit

## v for visual mode
- `v` to enter visual mode
- visual mode is for selecting text and then doing something (yp) with it
# set up your vimrc file
- `vim ~/.vimrc`
- `set number` to show line numbers
- `set relativenumber` to show relative line numbers
