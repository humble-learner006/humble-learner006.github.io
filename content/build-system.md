---
title: "build_system"
date: 2024-10-20 11:41:24
tags:
  - "tutorial"
  - "build system"
  - "C/C++"
  - "Computer Science"
  - "Language"
aliases:
  - "/blog/2024/10/cpp-build-system"
---
分享一下关于构建系统的一些知识
# 什么是build system（构建系统）？
翻译自：https://bazel.build/basics/build-systems
本质上讲，所有的构建系统有一个直接点目的：将工程师写的源代码转换为二进制可执行文件。构建系统不仅负责编译源代码，还负责链接库等，这个过程中系统也会自己生成代码。多数的构建过程是自动触发的，而不是被工程师手动触发。

# 常见的构建系统
Make：一个非常流行的构建系统，使用Makefile定义构建规则。  
CMake：一个跨平台的构建系统生成器，可以生成各种平台的构建脚本，包括Makefile和Visual Studio项目。  
Ninja：一个专注于速度的构建系统，通常与CMake一起使用。  
SCons：基于Python脚本的构建工具，提供了更多的灵活性  

根据[此处](https://medium.com/swlh/a-brief-introduction-to-build-systems-1e45cb1cf667)的描述：自从DAG([directed acyclic graph](https://en.wikipedia.org/wiki/Directed_acyclic_graph) *有向无环图* ) 在 Make中被第一次介绍，多数构建系统的核心算法并没有太大改变

# 使用构建系统
当使用构建系统时，需要自己写一个`makefile`文件  
这个文件定义了构建规则。构建系统会读取这个文件，并根据规则构建项目。 
*文件要放在项目的根目录`root directory`下*

ref:https://cognitivewaves.wordpress.com/makefiles/

以下由AI生成
# C++ project结构参考
通常会有多个目录和文件，每个目录和文件都有其特定的作用。示例如下
```
my_project/
├── bin/
├── build/
├── include/
│   ├── main.hpp
│   └── utils.hpp
├── src/
│   ├── main.cpp
│   └── utils.cpp
├── obj/
├── lib/
├── CMakeLists.txt
├── Makefile
└── README.md
```

### 各目录和文件的作用

1. **bin/**：
   - 这个目录通常用于存放生成的可执行文件。当你编译项目后，最终的可执行文件会放在这里。
   - bin是binary的缩写，用于存放二进制文件。轻松找到生成的可执行文件，方便管理和查找。

2. **build/**：目录通常用于存放中间**构建文件**
   如CMake生成的构建文件以保持项目根目录的整洁。生成以下文件：
   - CMakeCache.txt：
    一个由CMake生成的文件，存储了CMake的缓存变量。它包含了构建配置的所有设置信息。
   - CMakeFiles/：
    一个子目录，包含各种CMake生成的文件和中间文件，包括构建依赖信息、构建规则等。
    - 还有很多，到时候实践出真知

3. **include/**：用于存放项目的头文件。头文件中通常包含函数声明、类定义和宏定义等。
   - 示例文件：
     - `main.hpp`
     - `utils.hpp`

4. **src/**：用于存放项目的源文件，包含具体的函数实现和逻辑。
   - 示例文件：
     - `main.cpp`
     - `utils.cpp` //utilities（工具、实用程序）的缩写
     - utils.cpp 文件中的内容通常是一些独立的、通用的函数或类，这些函数或类不依赖于项目的特定逻辑，可以在项目的各个部分重用

5. **obj/**：
   - 这个目录用于存放编译后的目标文件（`.o`或`.obj`）。每个源文件在编译后会生成对应的目标文件，这些目标文件会在链接阶段合并成最终的可执行文件。

6. **lib/**：
   - 这个目录用于存放项目依赖的库文件（`.a`、`.so`、`.lib`等）。如果项目依赖于第三方库，通常会将这些库文件放在这里。

7. **CMakeLists.txt**：
   - 这是CMake的配置文件，用于定义项目的构建过程和依赖关系。
   - 示例内容：
     ```cmake
     cmake_minimum_required(VERSION 3.10)
     project(MyProject)
     set(CMAKE_CXX_STANDARD 11)
     include_directories(include)
     file(GLOB SOURCES "src/*.cpp")
     add_executable(my_project ${SOURCES})
     ```

8. **Makefile**：
   - 这是Make的配置文件，用于定义项目的构建规则。Makefile中包含目标、依赖项...
   - 自己写，和src放在同一文件夹下
   - makefile详见：[段落](#makefile)

9. **README.md**：
   - 这个文件通常用于项目的说明文档，包括项目简介、安装和使用说明、依赖项等。

### 示例文件内容

#### main.hpp

```cpp
#ifndef MAIN_HPP
#define MAIN_HP
void greet();
#endif // MAIN_HPP
```

#### utils.hpp

```cpp
#ifndef UTILS_HPP
#define UTILS_HPP
int add(int a, int b);
#endif // UTILS_HPP
```

#### main.cpp
```cpp
#include "main.hpp"
#include "utils.hpp"
#include <iostream>

void greet() {
    std::cout << "Hello, World!" << std::endl;
}

int main() {
    greet();
    int result = add(2, 3);
    std::cout << "2 + 3 = " << result << std::endl;
    return 0;
}
```

#### utils.cpp

```cpp
#include "utils.hpp"

int add(int a, int b) {
    return a + b;
}
```

### 总结

- **bin/**：存放生成的可执行文件。
- **build/**：存放中间构建文件。
- **include/**：存放头文件，声明函数和类。
- **src/**：存放源文件，包含具体实现。
- **obj/**：存放目标文件，中间编译产物。
- **lib/**：存放依赖库文件。
- **CMakeLists.txt**：CMake配置文件。
- **Makefile**：Make配置文件。
- **README.md**：项目说明文档。

这个结构使得项目更有组织性，方便管理和维护。


# makefile 目前不是最重要的学习目标
### Makefile的基本结构
Makefile文件由一系列规则组成，每个规则通常包括目标（target）、依赖项（dependencies）和命令（commands）。基本结构如下：
```makefile
target: dependencies
    commands
```
### 示例Makefile
假设你有一个简单的C++项目，目录结构如下：

```
my_project/
├── include/
│   ├── main.hpp
│   └── utils.hpp
├── src/
│   ├── main.cpp
│   └── utils.cpp
├── obj/
├── bin/
└── Makefile
```
以下是一个示例Makefile，展示了如何编译和链接这个项目：

```makefile
# 编译器和编译选项
CC = g++
CFLAGS = -Iinclude -Wall -g

# 目录
SRCDIR = src
INCDIR = include
OBJDIR = obj
BINDIR = bin

# 源文件和目标文件
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp, $(OBJDIR)/%.o, $(SOURCES))
TARGET = $(BINDIR)/my_program

# 默认目标
all: $(TARGET)

# 链接目标文件生成可执行文件
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

# 编译源文件生成目标文件
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f $(TARGET) $(OBJECTS)

# 伪目标（不生成文件）
.PHONY: all clean
```

### 解释

1. **变量定义**：
   - `CC`：指定编译器，这里是g++。
   - `CFLAGS`：编译选项，包括头文件目录、警告选项和调试信息。
   - `SRCDIR`、`INCDIR`、`OBJDIR`、`BINDIR`：分别指定源文件目录、头文件目录、目标文件目录和可执行文件目录。

2. **文件列表**：
   - `SOURCES`：通过`wildcard`函数获取所有源文件。
   - `OBJECTS`：使用`patsubst`函数将源文件路径转换为目标文件路径。
   - `TARGET`：指定最终生成的可执行文件。

3. **规则**：
   - `all`：默认目标，依赖于最终的可执行文件。
   - `$(TARGET)`：链接目标文件生成可执行文件。
   - `$(OBJDIR)/%.o`：编译源文件生成目标文件。
   - `clean`：清理生成的文件。

4. **伪目标**：
   - `.PHONY`：指定伪目标，不生成实际文件，避免与同名文件冲突。

### 使用Makefile

在项目根目录中运行以下命令：

- **编译项目**：
  ```sh
  make
  ```
  这会按照Makefile中的规则编译源文件并生成可执行文件。

- **清理项目**：
  ```sh
  make clean
  ```
  这会删除生成的可执行文件和目标文件。

### 总结

用户通常需要自己编写Makefile文件来定义项目的构建规则。这些规则包括如何编译和链接源代码，以及如何生成最终的可执行文件或库。通过Makefile，可以方便地管理项目的构建过程，并确保构建过程的一致性和可重复性。如果你有更多问题或需要进一步的示例，请告诉我！