---
title: Leetcode 笔记 36 - Sudoku Solver
description: 写程序解数独的基本解法与人类解数独的方法基本相同，都是采用回溯法逐一试探推进。数独初始表格给出后，剩余的空格所有可能的值全排列的结果即为解空间，在解空间中，对每个空格填入一个值进行试探，如果试探后数独表格合法，则这个值被暂时采纳，对下一个格子进行试探。
keywords: Sudoku Solver
categories: leetcode hash-table backtracking
---

题目链接：[Sudoku Solver | LeetCode OJ](https://oj.leetcode.com/problems/sudoku-solver/)

Write a program to solve a Sudoku puzzle by filling the empty cells.

Empty cells are indicated by the character **'.'**.

You may assume that there will be only one unique solution.

![Sudoku Sample](http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Sudoku-by-L2G-20050714.svg/250px-Sudoku-by-L2G-20050714.svg.png)

A sudoku puzzle...

![Solved Sudoku](http://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Sudoku-by-L2G-20050714_solution.svg/250px-Sudoku-by-L2G-20050714_solution.svg.png)

...and its solution numbers marked in red.

**Tags:** Backtracking, Hash Table

## 分析

写程序解数独的基本解法与人类解数独的方法基本相同，都是采用**回溯法**逐一试探推进。数独初始表格给出后，剩余的空格所有可能的值全排列的结果即为解空间，在解空间中，对每个空格填入一个值进行试探，如果试探后数独表格合法，则这个值被暂时采纳，对下一个格子进行试探。如果下个格子所有可能的值（1~9）尝试后数独表格均不合法，则被暂时采纳的本格子的值**试探失败**，在本格子中填入下一个值再次进行试探，直到所有的空格都被填入数字，且整张数组表格合法为止。这时表格的状态，即为数独的解。

如果出现所有可能的值都被试探过，而表格仍然不合法，则这个数独无解。

## 示例

```python
width = 9

class Solution:
  def solveSudoku(self, board):
    for i in range(width):
      for j in range(width):
        if board[i][j] != ".":
          continue
        for k in range(width):
          board[i][j] = str(k + 1)
          if self.isValidSudoku(board, i, j):
            if self.solveSudokuTask(board):
              return True
          board[i][j] = '.'
        return False
    return True

  def isValidSudoku(self, board, x, y):
    for i in range(width):
      if i != x and board[i][y] == board[x][y]:
        return False
    for k in range(width):
      if k != y and board[x][k] == board[x][y]:
        return False
    for m in range(3 * (x // 3), 3 * (x // 3 + 1)):
      for n in range(3 * (y // 3), 3 * (y // 3 + 1)):
        if (m != x and n != y) and board[m][n] == board[x][y]:
          return False
    return True
```

Leetcode 笔记系列的Python代码共享在[https://github.com/wizcabbit/leetcode.solution](https://github.com/wizcabbit/leetcode.solution)

## 常见问题

+ 在回溯试探的过程中，可以看到判断数独当前状态是否合法是非常重要的环节，我第一反应也是“复用”相关题目[Valid Sudoku]({% post_url /leetcode/2014-11-01-leetcode-35-valid-sudoku %})中的验证方法，但是很快发现会产生严重的算法超时问题。这是因为在这里“暴力”的求解方法中，isValidSudoku函数被调用的次数过大，我随便找了一个数独进行测试，isValidSudoku的执行次数高达21万多次，因此[Valid Sudoku]({% post_url /leetcode/2014-11-01-leetcode-35-valid-sudoku %})中的方法显然需要优化。
+ 分析可知，每次对数独中的一个格子的值进行改变，**只会**影响其所在行、所在列、所在粗线宫的合法性，因此之前isValidSudoku函数每次遍历整张表格O(n^2)的复杂度就显得没有必要。优化后的isValidSudoku函数，只检查必须的检查项时间复杂度从O(n^2)降为O(n*3)。在数十万次执行后，总执行时间大大降低。
+ 在调试、上传代码过程中，一定谨慎使用print等输出语句，即使只在isValidSudoku的首行加入一条输出语句也会被执行数十万次，导致实际执行时间严重超时，提交到OJ上基本都会TLE(Time Limit Exceeded)。

## 相关题目

[Valid Sudoku]({% post_url /leetcode/2014-11-01-leetcode-35-valid-sudoku %})
