---
title: Leetcode 笔记 100 - Same Tree
description: 深度优先遍历的题，唯一需要注意的是leetcode约定的对结点为空的两个约定：1. left, right指向None表示没有叶子结点；2. root不为None时（即结点存在），root.val不为None
keywords: Same Tree
categories: leetcode tree
---

题目链接：[Same Tree | LeetCode OJ](https://oj.leetcode.com/problems/same-tree/)

Given two binary trees, write a function to check if they are equal or not.

Two binary trees are considered equal if they are structurally identical and the nodes have the same value.

**Tags:** Depth-first Search

## 分析

很基本的一道深度优先遍历的题，没有太多好解释的，唯一需要注意的是leetcode约定的对结点为空的两个约定：

+ left, right指向None表示没有叶子结点
+ root不为None时（即结点存在），root.val不为None

## 示例

```python
class Solution:
    # @param p, a tree node
    # @param q, a tree node
    # @return a boolean
    def isSameTree(self, p, q):
      if p is None and q is None:
        return True
      if p is None or q is None or p.val != q.val:
        return False
      return self.isSameTree(p.left, q.left) and self.isSameTree(p.right, q.right)
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 优化/简化

题目很简单，优化和简化都不会构成数量级上的影响，计算的时空复杂度都是确定的。
