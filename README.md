/* 
  README.md
  DataStructure

  Created by 付晨 on 2017/9/18.
  Copyright © 2017年 com.fuchen. All rights reserved.
*/

# 用Swift来实现数据结构与算法 

#### 更新时间：2017年9月18日

为了更好的复习数据结构与算法，我使用Swift将基本数据结构与算法进行了重构。

大部分代码我进行了测试，但也不能完全保证完全正确。希望大牛看到问题可以帮助我一起进行修正。

这里只是最基本的数据结构与算法，还有相当多的部分没有进行重构，我会在继续学习的过程中继续进行完善与添加。

## 目录

1. 线性表 List

   1. 顺序存储 SequentialList

      + 获取
      - 插入
      - 删除

   2. 单链存储 OneDirectionLinkedList

      + 头插法
      + 尾插法
      + 清空链表
      + 获取节点
      + 插入
      + 删除

   3. 双向链表 DoubleLinkedList

      + 获取
      + 插入
      + 删除

2. 栈 Stack

   1. 顺序存储 SequentialStack
      + 进栈
      + 出栈
   2. 两栈共享空间 SequentialDoubleStack
      + 进栈
      + 出栈
   3. 链式存储 LinkStack
      + 进栈
      + 出栈
   4. 斐波那契数列

3. 队列 Queue

   1. 循环队列 顺序存储 SequentialQueue
      + 获取队列长度
      + 进队
      + 出队
   2. 链式存储 LinkQueue
      + 进队
      + 出队

4. 串 String

   1. 串模式匹配算法 StringMatch
      + 暴力匹配算法
      + KMP模式匹配算法

5. 树 Tree

   1. 双亲表示法  ParentTree
   2. 孩子表示法  ChildTree
   3. 孩子兄弟表示法 ChildBrotherTree
   4. 二叉树 BinaryTreeNode
      + 创建二叉树
      + 遍历（递归）
        + 前序遍历
        + 中序遍历
        + 后序遍历
      + 遍历（迭代）
        + 前序遍历
        + 中序遍历
        + 层次遍历
   5. 线索二叉树
      + 中序遍历线索化
      + 中序遍历

6. 图 Graph

   1. 邻接矩阵 AdjacencyMatrix
   2. 邻接表 AdjacencyList
      + 创建
      + 寻找边结点
      + 添加结点
      + 遍历
        + 深度优先遍历
        + 广度优先遍历
      + 最小生成树
        + Prim算法
        + Kruskal算法
      + 最短路径
        + Dijkstra算法
        + Floyd算法
      + 拓扑排序  **_未测试或存在错误_**
      + 关键路径

7. 查询 Search

   1. 顺序查找 SequentialSearch

      + 顺序查找 
      + 顺序查找优化

   2. 有序表查找 OrderlyTableSearch

      + 二分查找
      + 插值查找
      + 斐波那契查找

   3. 二叉排序树 BinarySortTreeNode

      + 查找
      + 插入
      + 删除

   4. 平衡二叉树 BalancedBinaryTree

      + 插入   在再处理双旋的时候有问题，待解决_**
      + 左旋
      + 右旋
      + 左平衡
      + 右平衡

   5. 哈希表 HashTable

   6. 排序 Sort

   1. 冒泡排序 BubbleSort

      + 冒泡排序初级版
      + 冒泡排序
      + 冒泡排序优化

   7. 简单选择排序 SimpleSelectionSort

   3. 直接插入排序 StraighInsertionSort

   4. 希尔排序 ShellSort

   5. 堆排序 HeapSort

   6. 归并排序 MergeSort

   7. 快速排序 QuickSort

#### 参考

+ 数据结构（C++语言版）邓俊辉 清华大学出版社
+ 大话数据结构 程杰 清华大学出版社
+ [青玉伏案的博客](http://www.cnblogs.com/ludashi/)
