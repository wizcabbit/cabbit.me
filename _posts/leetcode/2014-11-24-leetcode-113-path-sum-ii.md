---
title: Leetcode 笔记 113 - Path Sum II
description: 深度优先遍历题目，在Path Sum的基础上需要可行的解全部列出来。这里会用到有些动态规划的题目中也会用到的技巧，每次深度优先遍历时，都逐级传递从根结点到当前结点的路径
keywords: Path Sum II
categories: leetcode tree
---

题目链接：[Path Sum II | LeetCode OJ](https://oj.leetcode.com/problems/path-sum-ii/)

Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.

For example:
Given the below binary tree and sum = 22,

              5
             / \
            4   8
           /   / \
          11  13  4
         /  \    / \
        7    2  5   1

return

    [
       [5,4,11,2],
       [5,8,4,5]
    ]

**Tags:** Depth-first Search

## 分析

深度优先遍历题目，在[Path Sum]({% post_url /leetcode/2014-11-20-leetcode-112-path-sum %})的基础上需要可行的解全部列出来。这里会用到有些动态规划的题目中也会用到的技巧，每次深度优先遍历时，都逐级传递从根结点到当前结点的路径<code>path</code>，如果发现当前结点是叶子结点且满足路径之和与期望相等，就把这个路径存入结果<code>result</code>。深度优先遍历仍然进行，不会因为发现了一条符合要求的路径而停止。

这道题的示例中我用到了Python的数组加法，数组加法不同于集合操作，相同的元素不会合并，元素的顺序也不会被打乱。例如<code>[2,1] + [2,3] = [2,1,2,3]</code>而不是<code>[1,2,3]</code>

## 示例

```python
class Solution:
  # @param root, a tree node
  # @param sum, an integer
  # @return a list of lists of integers
  def pathSum(self, root, sum):
    return self._pathSum(root, sum, [], [])

  def _pathSum(self, root, sum, path, result):
    if root is None:
      return result

    if sum == root.val and root.left is None and root.right is None:
      return result + [path + [root.val]]
    else:
      return self._pathSum(root.left, sum - root.val, path + [root.val], result) + self._pathSum(root.right, sum - root.val, path + [root.val], result)
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 相关题目

[Path Sum]({% post_url /leetcode/2014-11-20-leetcode-112-path-sum %})

