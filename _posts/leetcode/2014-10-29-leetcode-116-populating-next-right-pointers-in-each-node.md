---
title: Leetcode 笔记 116 - Populating Next Right Pointers in Each Node
description: 是Populating Next Right Pointers in Each Node II的简化版本，主要简化在于给定的树是完整树，因此Populating Next Right Pointers in Each Node II的解法也完全适用于本题。
keywords: Populating Next Right Pointers in Each Node
categories: leetcode tree
---

题目链接：[Populating Next Right Pointers in Each Node | LeetCode OJ](https://oj.leetcode.com/problems/populating-next-right-pointers-in-each-node/)

Given a binary tree

    struct TreeLinkNode {
      TreeLinkNode *left;
      TreeLinkNode *right;
      TreeLinkNode *next;
    }

Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.

**Note:**

+ You may only use constant extra space.
+ You may assume that it is a perfect binary tree (ie, all leaves are at the same level, and every parent has two children).

For example,

Given the following perfect binary tree,

        1
       /  \
      2    3
     / \  / \
    4  5  6  7

After calling your function, the tree should look like:

        1 -> NULL
       /  \
      2 -> 3 -> NULL
     / \  / \
    4->5->6->7 -> NULL

**Tags:** Depth-first Search

## 分析

是Populating Next Right Pointers in Each Node II的简化版本，主要简化在于给定的树是完整树，因此Populating Next Right Pointers in Each Node II的解法也完全适用于本题。

只从本题考虑，可以认为是典型的深度优先遍历，每次遍历需要处理三件事：

+ 当前结点的next指针指向右侧结点
+ 将左节点的next指针指向右结点
+ 将右结点的next指针指向下一结点，即当前结点的next结点的左结点。如果右侧没有结点了，则置为None

## 示例

```python
class Solution:
    # @param root, a tree node
    # @return nothing
    def connect(self, root):
      self._connect(root, None);

    # @param root, a tree node
    # @param sibling, current node's sibling node
    # @return nothing
    def _connect(self, root, sibling):
      if root is None:
        return;
      else:
        root.next = sibling;

      self._connect(root.left, root.right);

      if sibling is not None:
        # Connect current node's right and sibling's left
        self._connect(root.right, sibling.left);
      else:
        self._connect(root.right, None);
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 相关题目

[Populating Next Right Pointers in Each Node II]({% post_url /leetcode/2014-10-30-leetcode-117-populating-next-right-pointers-in-each-node-ii %})
