---
title: "pointer"
date: 2024-10-10 10:22:29
tags:
  - "C/C++"
  - "tutorial"
  - "Computer Science"
  - "Language"
aliases:
  - "/blog/2024/10/cpp-pointer"
---
# C++指针`&`和`*`的使用
pointer is a variable that stores the address of another variable.
start from scratch, we already know what is variable. A variable store in memory have not only information of its value, but also its memory address. 
```cpp
int x = 5; // declare and initializa a variable
```
then we can use "address-of operator" - `&` to get the address of x!
```cpp
int* ptr = &x //get the x's address and pass it to ptr
```
you may ask 
- why `* ptr `is a `int` type data
	-  you are saying that `ptr` is a pointer to an `int`.
- where should I place the asteroid `*`? - Is that with end of `int`, or with beginning of `ptr`
	- only matter of style
	- However, the first style (`int* ptr`) is often preferred because it makes it clear that `ptr` is a pointer to an `int`. This can be especially helpful when declaring multiple pointers in a single statement:
	- `int* ptr1, ptr2; // Only ptr1 is a pointer, ptr2 is an int`
	- better declare one pointer per line
- since the name of `&` is "address-of operator"**取地址符**, what is the name of `*` as operator
	- it is called as "dereference operator"**解引用符**
- BEAWARE that `&` also have another way to use, which is reference
	- `int &reference_value = value` means give it a new name, and all operations on `reference_value` is same as directly on `value`
You can use the pointer to access the value of `x`:
```cpp
int value = *ptr; // Dereferencing the pointer to get the value of x
```

## Example
### example code
```cpp
#include <iostream>

int main() {
    int x = 10;       // Declare an integer variable x and initialize it to 10
    int* ptr = &x;    // Declare a pointer to an integer and initialize it with the address of x

    std::cout << "Value of x: " << x << std::endl;           // Output the value of x
    std::cout << "Address of x: " << &x << std::endl;        // Output the address of x
    std::cout << "Value of ptr: " << ptr << std::endl;       // Output the value of ptr (address of x)
    std::cout << "Value pointed to by ptr: " << *ptr << std::endl; // Output the value pointed to by ptr (value of x)

    return 0;
}
```
### result
```cpp
Value of x: 10
Address of x: 0x7ffee4b3c8ac
Value of ptr: 0x7ffee4b3c8ac //ptr = &x
Value pointed to by ptr: 10 //*ptr = x
```
p.s. about address on a 64-bit system, a memory address might look like `0x7ffee4b3c8ac`. Here's why:
- **0x**: This prefix indicates that the number is in hexadecimal format.
- **7ffee4b3c8ac**: This is the actual address in hexadecimal. Each digit represents 4 bits, so a 64-bit address will have up to 16 hexadecimal digits.
### summary
- `x` is a variable that stores a value.
- `&x` is the address of the variable `x`.
- `ptr` is a pointer that stores the address of `x`.
- `*ptr` is the value stored at the address `ptr` points to.