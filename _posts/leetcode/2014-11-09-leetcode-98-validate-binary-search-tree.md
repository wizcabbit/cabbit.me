---
title: Leetcode 笔记 98 - Validate Binary Search Tree
description: 对于Binary Search Tree，每道题都需要认真确认题中的约定是否与自己的理解相符，比如大名鼎鼎的Cracking the Coding Interview中，对于二叉查找树的定义为“左子结点小于或等于当前结点”，本题中的描述为”左子结点小于当前结点“。
keywords: Validate Binary Search Tree
categories: leetcode tree
---

题目链接：[Validate Binary Search Tree | LeetCode OJ](https://oj.leetcode.com/problems/validate-binary-search-tree/)

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

+ The left subtree of a node contains only nodes with keys **less than** the node's key.
+ The right subtree of a node contains only nodes with keys **greater than** the node's key.
+ Both the left and right subtrees must also be binary search trees.

**Tags:** Tree, Depth-first Search

## 分析

**读题！读题！读题！**这道题再次提醒我们要把**读题**这两个字默读100遍。

对于Binary Search Tree，每道题都需要认真确认题中的约定是否与自己的理解相符，比如大名鼎鼎的*Cracking the Coding Interview*中，对于二叉查找树的定义为*“左子结点小于或等于当前结点”*，本题中的描述为*”左子结点小于当前结点“*。把题目中对二叉查找树的要求总结如下：

+ 左子树中的结点均小于当前结点
+ 右子树中的结点均大于当前结点
+ 左子树和右子树本身也必须是二叉查找树（意味着左子树的所有子结点均不能大于当前结点，右子树的所有子结点均不能小于当前结点）

## 示例

```python
class Solution:
  # @param root, a tree node
  # @return a boolean
  def isValidBST(self, root):
    return self._isValidBST(root, None, None);

  def _isValidBST(self, root, min, max):
    if root is None or root.val is None:
      return True

    if (min is not None and root.val <= min) or (max is not None and root.val >= max):
      return False

    return self._isValidBST(root.left, min, root.val) and self._isValidBST(root.right, root.val, max)
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 示例说明

+ 示例中初始节点的最大、最小值传入了None，理论上应该传入int类型的最小、最大值，但由于python中传入int的极值需要import sys，或者使用硬编码的(-2147483647, 2147483647)。我不喜欢在算法题中引入系统库或者硬编码数字，因此使用了None来代表极值；
+ 为了代码可读性没有简化判断语句，可以精简为：

```python
class Solution:
  # @param root, a tree node
  # @return a boolean
  def isValidBST(self, root):
    return self._isValidBST(root, -2147483647, 2147483647);

  def _isValidBST(self, root, min, max):
    if root is None or root.val is None:
      return True

    return root.val < max \
      and root.val > min \
      and self._isValidBST(root.left, min, root.val) \
      and self._isValidBST(root.right, root.val, max)
```

## 相关题目

[Recover Binary Search Tree]({% post_url /leetcode/2014-11-09-leetcode-99-recover-binary-search-tree %})
