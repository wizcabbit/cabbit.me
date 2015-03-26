---
title: Leetcode 笔记 101 - Symmetric Tree
description: 判断一个二叉树是否是镜像的条件是根节点的左右子树互为镜像，左右子树互为镜像的条件是左右子结点的内侧、外侧两个子树互为镜像，这本质上是一个递归问题。
keywords: Symmetric Tree
categories: leetcode tree
---

题目链接：[Symmetric Tree | LeetCode OJ](https://oj.leetcode.com/problems/symmetric-tree/)

Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).

For example, this binary tree is symmetric:

        1
       / \
      2   2
     / \ / \
    3  4 4  3

But the following is not:

        1
       / \
      2   2
       \   \
       3    3

**Note:**
Bonus points if you could solve it both recursively and iteratively.

**Tags:** Deep-first Search

## 分析

判断一个二叉树是否是镜像的条件是根节点的左右子树互为镜像，左右子树互为镜像的条件是左右子结点的内侧、外侧两个子树互为镜像，这本质上是一个递归问题。判断二叉树镜像的条件为：

+ 对称结点的值相等
+ 对称结点中左结点的左子树和右结点右子树互为镜像、左结点的右子树和右结点的左子树互为镜像

由于算法本身是递归的，因此只需要加入一个栈，每次把对称位置的结点压入栈内就可以改写成迭代的

## 示例

```python
# Recursively Solution
class Solution:
  # @param root, a tree node
  # @return a boolean
  def isSymmetric(self, root):
    if root is None:
      return True
    else:
      return self.isMirror(root.left, root.right)

  def isMirror(self, left, right):
    if left is None and right is None:
      return True
    if left is None or right is None:
      return False

    if left.val == right.val:
      outPair = self.isMirror(left.left, right.right)
      inPiar = self.isMirror(left.right, right.left)
      return outPair and inPiar
    else:
      return False

# Iteratively Solution
class Solution:
  def isSymmetric(self, root):
    if root is None:
      return True

    stack = [[root.left, root.right]]

    while len(stack) > 0:
      pair = stack.pop()
      left = pair[0]
      right = pair[1]

      if left is None and right is None:
        continue
      if left is None or right is None:
        return False
      if left.val == right.val:
        stack.append([left.left, right.right])
        stack.append([left.right, right.left])
      else:
        return False
    return True
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 优化/扩展

+ 在判断外侧一对子树不符合镜像之后，可以立即返回False结果，而不需要再验证内侧一对子树是否符合要求。可以在部分情况下提高效率
