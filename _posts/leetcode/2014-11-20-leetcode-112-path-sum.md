---
title: Leetcode 笔记 112 - Path Sum
description: 深度优先遍历题目，拿到题后首先需要确认几个题中没有明确给出的要点：root-to-leaf 路径，必须是从根结点一直到叶子结点，中间取一段是不行的；结点值可以为负；空的二叉树，不能认为存在和为0的路径
keywords: Path Sum
categories: leetcode tree
---

题目链接：[Path Sum | LeetCode OJ](https://oj.leetcode.com/problems/path-sum/)

Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.

For example:
Given the below binary tree and sum = 22,

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1

return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.

**Tags:** Depth-first Search

## 分析

深度优先遍历题目，拿到题后首先需要确认几个题中没有明确给出的要点：

+ root-to-leaf 路径，必须是从根结点一直到叶子结点，中间取一段是不行的
+ 结点值是否可以为负。如果不可以为负，那么在判断中一旦发现从根结点到当前结点的和大于期望的值，就可以直接短路返回否。但是本题中**结点值可以为负**
+ 空的二叉树，是否可以认为存在和为0的路径。本题中不可以

这些要点判断出来后，剩余的工作就是构建递归的深度优先遍历，在每层判断是否是叶子结点、是否存在加和等于期望值的路径。

## 示例

```python
class Solution:
  # @param root, a tree node
  # @param sum, an integer
  # @return a boolean
  def hasPathSum(self, root, sum):
    if root is None:
      return False
    else:
      # Only leaf could return true
      if sum == root.val and root.left is None and root.right is None:
        return True
      else:
        return self.hasPathSum(root.left, sum - root.val) or self.hasPathSum(root.right, sum - root.val)
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 相关题目

[Path Sum II]({% post_url /leetcode/2014-11-24-leetcode-113-path-sum-ii %})

