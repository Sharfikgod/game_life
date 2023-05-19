import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'model/cell.dart';

class GameLife {
  List<List<Cell>> currentGeneration = [];

  List<List<Cell>> getFirstGeneration() {
    currentGeneration = List.generate(
      4,
      (i) => List.generate(4, (_) => Cell(math.Random().nextBool())),
      growable: true,
    );

    print('\n${currentGeneration.join('\n')}');

    return currentGeneration;
  }

  List<List<Cell>> getNextGeneration() {
    List<List<Cell>> newGeneration = [];
    int aliveNeighbors = 0;

    for (var x = 0; x < currentGeneration.length; x++) {
      final row = <Cell>[];

      for (var y = 0; y < currentGeneration[x].length; y++) {
        aliveNeighbors = 0;

        if (getCellState(x - 1, y - 1)) {
          aliveNeighbors++;
        }
        if (getCellState(x - 1, y)) {
          aliveNeighbors++;
        }
        if (getCellState(x - 1, y + 1)) {
          aliveNeighbors++;
        }

        if (getCellState(x, y - 1)) {
          aliveNeighbors++;
        }
        if (getCellState(x, y + 1)) {
          aliveNeighbors++;
        }

        if (getCellState(x + 1, y - 1)) {
          aliveNeighbors++;
        }
        if (getCellState(x + 1, y)) {
          aliveNeighbors++;
        }
        if (getCellState(x + 1, y + 1)) {
          aliveNeighbors++;
        }
        Cell cell;

        if (currentGeneration[x][y].isAlive) {
          cell = Cell(aliveNeighbors == 3 || aliveNeighbors == 2);
        } else {
          cell = Cell(aliveNeighbors == 3);
        }
        row.add(cell);
      }
      newGeneration.add(row);
    }
    currentGeneration = newGeneration;
    print('\n${currentGeneration.join('\n')}');

    return currentGeneration;
  }

  bool getCellState(int x, int y) {
    try {
      return currentGeneration[x][y].isAlive;
    } on RangeError {
      return false;
    }
  }

  void resetGame() {
    currentGeneration = [];
  }
}
