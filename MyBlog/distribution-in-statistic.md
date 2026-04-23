---
title: "统计学常见分布计算公式"
date: 2024-10-16 20:07:29
tags:
  - "tutorial"
  - "statistics"
  - "Mathematics"
  - "Statistics"
aliases:
  - "/blog/2024/10/sta-distribution-in-statistic"
---
这是统计学的**分布部分**的笔记，里面是常见分布汇总
- [L 7 - Distribution 1](#l-7---distribution-1)
  - [Bernoulli Distribution](#bernoulli-distribution)
    - [Definition:](#definition)
    - [n Bernoulli trials](#n-bernoulli-trials)
  - [Binomial Distribution](#binomial-distribution)
    - [Definition:](#definition-1)
    - [deviation](#deviation)
  - [Hypergeometric Distribution](#hypergeometric-distribution)
    - [Definition:](#definition-2)
- [L 8 - Distribution 2](#l-8---distribution-2)
  - [Geometric Distribution](#geometric-distribution)
    - [Definition:](#definition-3)
  - [Negative Binomial Distribution](#negative-binomial-distribution)
    - [Definition:](#definition-4)
  - [Poisson Distribution](#poisson-distribution)
    - [Definition:](#definition-5)
- [L 9 \& 10 - Continuous Random Variable 2](#l-9--10---continuous-random-variable-2)
  - [Uniform Distribution](#uniform-distribution)
    - [Definition:](#definition-6)
  - [Exponential Distribution](#exponential-distribution)
    - [Definition:](#definition-7)
  - [Normal Distribution](#normal-distribution)
    - [Definition:](#definition-8)

# L 7 - Distribution 1

## Bernoulli Distribution  

### Definition:  

A random variable X is said to have a Bernoulli distribution with parameter p, where 0 ≤ p ≤ 1, if its probability mass function is given by 

- pmf.: $f_{X}(x) = p^x(1 − p)^{(1−x)}$ for x = 0, 1
- mean & expectation: $\mu = E[X] = p$
- variance: $\sigma^2 = Var[X] = p(1-p)$
- mgf: $M_{X}(t) = E[e^{tX}] = e^{t}p + (1 - p), t \in (-\infty ,\infty)$

### n Bernoulli trials

Definition: a Bernoulli experiment performed n times:

- $X_{1}, X_{2}, \dots, X_{n}$ are independent Bernoulli random variables (all trials are independent)
- with same parameter p

## Binomial Distribution   

### Definition:

A random variable X is said to have a binomial distribution if its probability mass function is given by 

- pmf: $f_{X}(x) = \binom{n}{x}p^x(1 − p)^{(n-x)}$  
- mean & expectation: $\mu = E[X] = np$  
- variance: $\sigma^2 = Var[X] = np(1-p)$  
- mgf: $M_{X}(t) = (pe^t + 1 - p)^n$  

### deviation

if random variables $X_{1}, X_{2}, \dots, X_{n}$ are independent, then 

$$E[X_{1} + X_{2} + \dots + X_{n}] = E[X_{1}] + E[X_{2}] + \dots + E[X_{n}]$$

$$Var[X_{1} + X_{2} + \dots + X_{n}] = Var[X_{1}] + Var[X_{2}] + \dots + Var[X_{n}]$$

$$M'(t) = n\left[(1-p) + p e^t\right]^{n-1} p e^t \Rightarrow M'(0) = E[X] = np$$

$$M''(t) = n(n-1)\left[(1-p) + p e^t\right]^{n-2} p^2 e^{2t} + n\left[(1-p) + p e^t\right]^{n-1} p e^t$$

$$M''(0) = E[X^2] = n(n-1)p^2 + np$$

$$\operatorname{Var}[X] = E[X^2] - (E[X])^2 = n^2 p^2 - n p^2 + n p - n^2 p^2 = np(1-p)$$

## Hypergeometric Distribution

### Definition:

A random variable X is said to have a hypergeometric distribution if its probability mass function is given by 

- pmf: $f_{X}(x) = \frac{\binom{K}{x}\binom{N-K}{n-x}}{\binom{N}{n}}$
- mean & expectation: $\mu = E[X] = \frac{nK}{N}$
- variance: $\sigma^2 = Var[X] = n \cdot \frac{K}{N} \cdot \frac{N-K}{N} \cdot \frac{N-n}{N-1}$
- mgf: $M_{X}(t) = \left(\frac{K}{N}e^t + 1 - \frac{K}{N}\right)^n$

# L 8 - Distribution 2

## Geometric Distribution

### Definition:

A random variable X is said to have a geometric distribution if its probability mass function is given by 

- pmf: $f_{X}(x) = p(1-p)^{x-1}$
- mean & expectation: $\mu = E[X] = \frac{1}{p}$
- variance: $\sigma^2 = Var[X] = \frac{1-p}{p^2}$
- mgf: $M_{X}(t) = \frac{pe^t}{1-(1-p)e^t}$

## Negative Binomial Distribution

### Definition:

A random variable X is said to have a negative binomial distribution if its probability mass function is given by 

- pmf: $f_{X}(x) = \binom{x-1}{r-1}p^r(1-p)^{x-r}$
- mean & expectation: $\mu = E[X] = \frac{r}{p}$
- variance: $\sigma^2 = Var[X] = \frac{r(1-p)}{p^2}$
- mgf: $M_{X}(t) = \left(\frac{p}{1-(1-p)e^t}\right)^r$
- negative binomial distribution is a generalization of the geometric distribution

## Poisson Distribution

### Definition:

A random variable X is said to have a Poisson distribution if its probability mass function is given by 

- pmf: $f_{X}(x) = \frac{e^{-\lambda}\lambda^x}{x!}$
- mean & expectation: $\mu = E[X] = \lambda$
- variance: $\sigma^2 = Var[X] = \lambda$
- mgf: $M_{X}(t) = e^{\lambda(e^t-1)}$
- Poisson distribution is a limiting case of the binomial distribution when n is large and p is small

# L 9 & 10 - Continuous Random Variable 2

第九讲引入了连续随机变量，接着介绍了连续随机变量的分布

## Uniform Distribution

### Definition:

A random variable X is said to have a uniform distribution if its probability density function is given by 

- pdf: $f_{X}(x) = \frac{1}{b-a}$
- mean & expectation: $\mu = E[X] = \frac{a+b}{2}$
- variance: $\sigma^2 = Var[X] = \frac{(b-a)^2}{12}$
- mgf: $M_{X}(t) = \frac{e^{tb}-e^{ta}}{t(b-a)}$
- The uniform distribution is often used to model situations where all outcomes are equally likely

## Exponential Distribution

### Definition:

A random variable X is said to have an exponential distribution if its probability density function is given by 

- pdf: $f_{X}(x) = \lambda e^{-\lambda x}$
- mean & expectation: $\mu = E[X] = \frac{1}{\lambda}$
- variance: $\sigma^2 = Var[X] = \frac{1}{\lambda^2}$
- mgf: $M_{X}(t) = \frac{\lambda}{\lambda - t}$

## Normal Distribution

### Definition:

A random variable X is said to have a normal distribution if its probability density function is given by 

- pdf: $f_{X}(x) = \frac{1}{\sqrt{2\pi}\sigma}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$
- mean & expectation: $\mu = E[X]$
- variance: $\sigma^2 = Var[X]$
- mgf: $M_{X}(t) = e^{\mu t + \frac{1}{2}\sigma^2 t^2}$
- The normal distribution is the most important continuous distribution in probability and statistics
