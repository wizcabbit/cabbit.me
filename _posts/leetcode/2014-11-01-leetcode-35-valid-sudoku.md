---
title: Leetcode 笔记 35 - Valid Soduko
description: 最简单直接的解法一般是遍历整张数独表格，遇到的每个元素，以此遍历所属行、所属列、所属粗线宫是否有与之重复的数字。但是这种算法中，每遍历到一个元素，都要进行额外的最多3*9个格子的遍历。
keywords: Valid Soduko
categories: leetcode hash-table
---

题目链接：[Valid Sudoku | LeetCode OJ](https://oj.leetcode.com/problems/valid-sudoku/)

Determine if a Sudoku is valid, according to:  [Sudoku Puzzles - The Rules](http://sudoku.com.au/TheRules.aspx).

The Sudoku board could be partially filled, where empty cells are filled with the character **'.'**.

![Soduko Sample](http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)

A partially filled sudoku which is valid.

**Note:**
A valid Sudoku board (partially filled) is not necessarily solvable. Only the filled cells need to be validated.

**Tags:** Hash Table

## 分析

对于数独是否是合法的，依靠以下三个判断条件，注意**数独是否合法与是否可解无关**

+ 横行的数字均含1-9，不重复
+ 纵列的数字均含1-9，不重复
+ 每个粗线宫内的数字均含1-9，不重复
+ 除1-9外可以存在空格子，空格子用 **“.”** 表示

最简单直接的解法一般是遍历整张数独表格，遇到的每个元素，以此遍历所属行、所属列、所属粗线宫是否有与之重复的数字。

但是这种算法中，每遍历到一个元素，都要进行额外的最多3*9个格子的遍历。

这里可以采用空间换时间的做法，定义3个9*9布尔值哈希表如下：

+ rowMatrix[N][1~9]: 表示第N行中，1-9是否分别出现过
+ columnMatrix[N][1~9]: 表示第N列中，1-9是否分别出现过
+ groupMatrix[N][1~9]: 表示第N个粗线宫中，1-9是否分别出现过，N为从左向右、从上向下计数的粗线宫

这样遍历整张数独表格时，先检查在3个矩阵中该格子内的数字在对应哈希表中是否出现过，如果出现过，则数独不合法。遍历过的数字在对应矩阵中标为True

## 示例

```python
# 数独表格宽度
width = 9

class Solution:
  # @param board, a 9x9 2D array
  # @return a boolean
  def isValidSudoku(self, board):
    rowMatrix = self.getValidMatrix()
    columnMatrix = self.getValidMatrix()
    groupMatrix = self.getValidMatrix()

    if len(board) != width:
      return False

    for i in range(width):
      if len(board[i]) != width:
        return False

      for j in range(width):
        if board[i][j] == '.':
          continue

        cell = int(board[i][j]) - 1
        # 检验行有效性
        if rowMatrix[i][cell]:
          return False
        # 检验列有效性
        if columnMatrix[j][cell]:
          return False
        # 检验粗线宫有效性
        if groupMatrix[(i // 3) * 3 + j //3][cell]:
          return False

        rowMatrix[i][cell] = True
        columnMatrix[j][cell] = True
        groupMatrix[(i // 3) * 3 + j //3][cell] = True

    return True

  def getValidMatrix(self):
    result = []
    for i in range(width):
      result.append([])
      for j in range(width):
        result[i].append(False)
    return result
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 常见问题

+ 空格子使用 **“.”** 表示，因此题目的输入项和处理格子时，均为字符串，这是在对格子的值进行处理时，如果不进行类型转换会出现低级错误，如：<code>cell = int(board[i][j]) - 1</code>
+ 在遍历每个格子时，对应的粗线宫索引为：<code>groupMatrix[(i // 3) * 3 + j //3][cell]</code>

## 相关题目

[Sudoku Solver]({% post_url /leetcode/2014-11-02-leetcode-36-sudoku-solver %})
