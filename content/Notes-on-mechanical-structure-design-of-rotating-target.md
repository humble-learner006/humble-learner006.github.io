---
title: "旋转靶机械结构设计笔记"
date: 2025-07-17 13:34:29
tags:
  - "Robomaster"
  - "mechanical structure"
  - "Mechanical Design"
aliases:
  - "/blog/2025/07/RM-mechanical-structure-design-of-rotating-target"
---
2025年，过岗龙需要一个旋转靶子
# 设计需求
1. 转速达到3rps，也就是每分钟180转
2. 旋转靶子直径在60cm
3. 高度差分达到30cm
4. 由于惯性，滑轨结构尽量低趴

# 设计目标
1. 制作一个通用的旋转机构
2. 低成本（主要使用3D打印和玻璃纤维，只有必要零件使用金属
3. 对快拆的一次尝试
4. 对“成员在线合作”和“自研机械结构”的尝试

# 设计参数参考
## 云台轴承
### 齿轮啮合示意图
![1709X855/轴承组.png](https://tc.z.wiki/autoupload/f/naBXvlxu6UGLbeKisI39YyfNcKcqEnRmcljopnyJoMs/20250723/57Ts/1709X855/%E8%BD%B4%E6%89%BF%E7%BB%84.png)

大齿轮参数表  

| 名称 | 规格 | 
| ---- | ---- | 
| 模数 | 1 |
| 齿数 | 130 |
| 压力角 | 20° |
| 内径 | 101mm |
| 外径 | 132mm |
| 厚度 | 8mm |
| 材质 | 6061铝合金 |

小齿轮参数表  

| 名称 | 规格 |
| ---- | ---- |
| 模数 | 1 |
| 齿数 | 50 |
| 压力角 | 20° |
| 内径 | 20mm |
| 外径 | 52mm |
| 厚度 | 13mm |
| 材质 | 45# 钢 |

注意：
1. 以后齿轮生成一定要记录参数！！  
2. 使用涨紧套z21 10*20*13 固定小齿轮和3508电机出力轴  

### 孔位分布
![1710X1355/孔位分布示意图.png](https://tc.z.wiki/autoupload/f/naBXvlxu6UGLbeKisI39YyfNcKcqEnRmcljopnyJoMs/20250723/uNll/1710X1355/%E5%AD%94%E4%BD%8D%E5%88%86%E5%B8%83%E7%A4%BA%E6%84%8F%E5%9B%BE.png)

## 3508电机
参考[3508电机参数](https://rm-static.djicdn.com/tem/17348/RoboMaster%20M3508%E7%9B%B4%E6%B5%81%E6%97%A0%E5%88%B7%E5%87%8F%E9%80%9F%E7%94%B5%E6%9C%BA%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8EV1.0%EF%BC%88%E4%B8%AD%E8%8B%B1%E6%97%A5%EF%BC%89.pdf)

![3508安装孔位.png](https://tc.z.wiki/autoupload/f/wSafM9E-riki2h6VXC5RJbZhwuM6ABTZJrGRmhmmFKWyl5f0KlZfm6UsKj-HyTuv/20250717/CaDr/1586X959/3508%E5%AE%89%E8%A3%85%E5%AD%94%E4%BD%8D.png)

### 参数计算
此处要用3508电机小齿轮驱动云台的大齿轮达到3rps的转速
已知约束：
1. 轴距小于90mm
2. 云台大齿轮内径大于101mm
3. 3508端小齿轮额定转速469rpm

开始计算齿比（传动比）：
3rps = 180rpm
转速比 = 469rpm / 180rpm = 2.6
齿数比 = 大：小 = 2.6 
大疆3508内齿模数0.6，齿数17，中空孔径5mm。但是先不考虑直接连接的方案。


## 电池支架
参考[电池支架参数](https://rm-static.djicdn.com/tem/17348/RoboMaster%E7%94%B5%E6%B1%A0%E6%9E%B6%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.pdf)
![电池固定架参数](https://z.wiki/u/NMavMq)
注意：螺纹孔M3，深度6mm
我怀疑这个是假的，和我的模型对不上