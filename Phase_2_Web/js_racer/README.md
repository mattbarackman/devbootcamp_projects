# Javascript Racer

## Assignment

Implement a basic racing game in Javascript.  

## Learning Goals

1. Explore Object-Oriented Design in Javascript
2. Explore key-up events in Javascript
3. Practice good seperation of view and controller logic.

## Overview
What I think is really cool about my solution to this assignment is that I was able to completely seperate the game logic from the view logic. This allowed me fully encapsulate the view logic in to different boards that render the game differently. The DOMBoard, renders the game to the DOM, and the ConsoleBoard renders the game to the browser console. To switch between the two all you have to do is swap out which gameboard the game object is referencing (as shown below).  

```javascript
function Game(length, names) {
  // ...
  this.gameboard = new DOMBoard();
  // this.gameboard = new ConsoleBoard();
  // ...
}
```