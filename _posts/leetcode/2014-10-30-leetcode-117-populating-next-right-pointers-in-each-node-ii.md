---
title: Leetcode 笔记 117 - Populating Next Right Pointers in Each Node II
description: 本题的一个难点在于要求使用常数空间，这样的话普通的深度优先遍历由于需要递归压栈而无法使用，普通的广度优先搜索需要使用队列也无法使用，因此选择使用两层迭代，使用current指向当前结点的方法进行广度优先遍历。
keywords: Populating Next Right Pointers in Each Node II
categories: leetcode tree
---

题目链接：[Populating Next Right Pointers in Each Node II | LeetCode OJ](https://oj.leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/)

Follow up for problem "Populating Next Right Pointers in Each Node".

What if the given tree could be any binary tree? Would your previous solution still work?

Note:

+ You may only use constant extra space.

For example,

Given the following binary tree,

         1
       /  \
      2    3
     / \    \
    4   5    7

After calling your function, the tree should look like:

         1 -> NULL
       /  \
      2 -> 3 -> NULL
     / \    \
    4-> 5 -> 7 -> NULL
**Tags:** Depth-first Search

## 分析

本题的解法完全可以用于Populating Next Right Pointers in Each Node。

本题的一个难点在于要求使用常数空间，这样的话普通的深度优先遍历由于需要递归压栈而无法使用，普通的广度优先搜索需要使用队列也无法使用，因此选择使用两层迭代，使用current指向当前结点的方法进行广度优先遍历。

同之前的简化版本不同，本题的区别在于二叉树并不完整，之前算法中可以将当前结点的右子结点与下一结点的左子结点相连的方法失效。因此这里选用广度优先遍历，引入“层”的概念，需要储存两个值：遍历的当前结点、本层上一个非空的结点(previous)。由于寻找遍历的下一个结点需要使用父层的next指针，因此算法设计为遍历当前结点时完成三件事：

+ 如果左子结点存在，则更新previous的next指向左子结点
+ 如果右子结点存在，则更新左子结点（或previous）的next指向右子结点
+ 下一次循环的当前结点设定为父节点的next的孩子


## 示例

```python
class Solution:
  # @param root, a tree node
  # @return nothing
  def connect(self, root):
    head = None;        # 下一层的首结点
    previous = None;    # 本层上一个非空的结点
    current = root;     # 当前结点

    while current is not None:
      while current is not None:
        if current.left is not None:
          if previous is not None:
            previous.next = current.left;
          else:
            # previous为空，意味着此处是本层首结点
            head = current.left;
          previous = current.left;
        if current.right is not None:
          if previous is not None:
            previous.next = current.right;
          else:
            head = current.right;
          previous = current.right;
        # 当前结点遍历完毕，转入父节点的next结点的子结点
        current = current.next;
      # 当前层遍历完毕，转入下一层
      current = head;
      head = None;
      previous = None;
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 相关题目

[Populating Next Right Pointers in Each Node]({% post_url /leetcode/2014-10-29-leetcode-116-populating-next-right-pointers-in-each-node %})
