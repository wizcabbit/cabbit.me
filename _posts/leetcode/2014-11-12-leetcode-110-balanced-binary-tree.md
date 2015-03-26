---
title: Leetcode 笔记 110 - Balanced Binary Tree
description: 深度优先遍历题目，只要在遍历时取得左右子树的深度，对比是否相差超过1就可以得出结果，需要考虑的技巧是怎么在发现不平衡之后，最迅速的返回结果，不做多余的计算。有可能出现的问题是先写一个Helper方法获得结点到最下层叶子结点的深度，然后在深度优先遍历中每次调用这个方法来对比深度。这是不必要的，获取深度本身就是用深度优先遍历实现的，一边遍历一边计算深度就OK。
keywords: Balanced Binary Tree
categories: leetcode tree
---

题目链接：[Balanced Binary Tree | LeetCode OJ](https://oj.leetcode.com/problems/balanced-binary-tree/)

Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

**Tags:** Depth-first Search

## 分析

同样是很基础的深度优先遍历题目，只要在遍历时取得左右子树的深度，对比是否相差超过1就可以得出结果，需要考虑的技巧是怎么在发现不平衡之后，最迅速的返回结果，不做多余的计算。

有可能出现的问题是先写一个Helper方法获得结点到最下层叶子结点的深度，然后在深度优先遍历中每次调用这个方法来对比深度。这是不必要的，获取深度本身就是用深度优先遍历实现的，一边遍历一边计算深度就OK。

## 示例

```python
class Solution:
  # @param root, a tree node
  # @return a boolean
  def isBalanced(self, root):
    return self.getBalanceHeight(root) != -1

  # @param root, a tree node
  # @return a int, if the root is balanced return height, or return -1
  def getBalanceHeight(self, root):
    if root is None:
      return 0;

    leftHeight = self.getBalanceHeight(root.left)
    # if left child tree is not balanced, return -1 directly to stop recursion
    if leftHeight < 0:
      return -1

    rightHeight = self.getBalanceHeight(root.right)
    # if right child tree is not balanced, return -1 directly to stop recursion
    if rightHeight < 0:
      return -1

    if math.fabs(leftHeight - rightHeight) > 1:
      return -1
    return max(leftHeight, rightHeight) + 1
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 扩展

看到了有童鞋的解法类似与：

```python
def getHeight(self, root):
    if root == None:
        return 0
    left_height, right_height = self.getHeight(root.left), self.getHeight(root.right)
    if left_height < 0 or right_height < 0 or math.fabs(left_height - right_height) > 1:
        return -1
    return max(left_height, right_height) + 1
```

这个解法是没问题可以Accpeted的，但是我在分别计算出leftHeight和rightHeight之后，立刻检测了一下其深度是否为-1，如果左或右子树的深度返回-1，证明子树不是Balanced的，可以不再计算其他子树的深度，当前结点也返回-1.这样可以在发现不平衡的子树后，立刻终止遍历，比上面的算法稍快一些。

另外，至少在Python中，使用和高度值同为int的-1表示子树不平衡，比使用None或者False来表示要节省时间，如果使用None而不是-1，跑完所有的Test Case大概会多用1/4的时间。
