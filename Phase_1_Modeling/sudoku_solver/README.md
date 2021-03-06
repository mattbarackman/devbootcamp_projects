# Sudoku Solver

## Assignment

Implement a program that will solve basic Sudoku puzzles. 

## Learning Goals

1. Writing good pseudo-code
2. Evaluating data structures and algorithms
3. Writing short and well-named methods

## Overview
The basic algorithm I used continues to sweep the board looking for cells where there is only one possible value that can be placed in it. When it finds one, it sets the cell's value and continues sweeping the board. The solver stops when it solves the board or when it sweeps the whole board without solving a cell. This program attempts to solve 15 different sudoku boards of which it can solve eight.

To see it in action:
```
$ ruby sudoku.rb
```