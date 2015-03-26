---
title: Leetcode 笔记 99 - Recover Binary Search Tree
description: 基本要求是使用O(n)的空间，进阶要求是使用常数空间。O(n)的算法比较直接，直接从二叉查找树的用途就能推出。二叉查找树的特点是中序遍历后能够生成递增的序列，因此只需要对给定的二叉查找树进行中序遍历，遍历过程中找到非递增情况，就能够得出不符合递增规律的两个数，交换后二叉查找树的恢复就完成了。
keywords: Recover Binary Search Tree
categories: leetcode tree
---


题目链接：[Recover Binary Search Tree | LeetCode OJ](https://oj.leetcode.com/problems/recover-binary-search-tree/)

Two elements of a binary search tree (BST) are swapped by mistake.

Recover the tree without changing its structure.

**Note:** A solution using O(n) space is pretty straight forward. Could you devise a constant space solution?

**Tags:** Tree, Depth-first Search

## 分析

这道题的基本要求是使用O(n)的空间，进阶要求是使用常数空间。O(n)的算法比较直接，直接从二叉查找树的用途就能推出。二叉查找树的特点是**中序遍历**后能够生成**递增**的序列，因此只需要对给定的二叉查找树进行中序遍历，遍历过程中找到非递增情况，就能够得出不符合递增规律的两个数，交换后二叉查找树的恢复就完成了。

在设计使用常数空间的算法时，一种思路是在中序遍历中传递上一个遍历到的值，这样就在遍历过程中完成了比对，而不需额外的空间存储遍历结果，但这种算法本质也是O(n)的，因为普通的深度优先遍历中用到的递归，本质上是想中间结果压入栈内，因此还是需要O(n)的空间复杂度。

真正O(n)空间复杂度的算法需要用时间换空间，常用的算法是Morris二叉树遍历算法。

## 示例

```python
class Solution:
  _previous = None
  _swapA = _swapB = None

  # @param root, a tree node
  # @return a tree node
  def recoverTree(self, root):
    self._coverTree(root)

    if self._swapA is not None and self._swapB is not None:
      temp = self._swapA.val
      self._swapA.val = self._swapB.val
      self._swapB.val = temp
    return root

  def _coverTree(self, root):
    if root is None or root.val is None:
      return

    self._coverTree(root.left)
    if self._previous is not None and self._previous.val is not None:
      if self._previous.val > root.val:
        if self._swapA is None:
          self._swapA = self._previous
        self._swapB = root

    self._previous = root
    self._coverTree(root.right)
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 示例说明

+ 使用中序遍历时，最直接的想法是中序遍历，同时将遍历结果储存在一个数组中。中序遍历结束后，再行遍历这个数组查找非递增的值。其实还可以在中序遍历过程中每次传入上一个结点的值，一边遍历一边比对是否递增。当然这种方法的实际空间复杂度没有变化，因为递归过程中的每次中间结果都会被压栈，实际仍然使用了和单独数组同样的空间

## 相关题目

[Validate Binary Search Tree]({% post_url /leetcode/2014-11-09-leetcode-98-validate-binary-search-tree %})
