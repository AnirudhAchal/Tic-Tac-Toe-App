import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class GameBrain {
  int _playerTurn = 1;
  IconData _player1Icon = FontAwesomeIcons.times;
  IconData _player2Icon = FontAwesomeIcons.circle;
  int computerNumber = 0;
  int userNumber = 0;
  int _winner = 0;

  GameBrain({this.computerNumber, this.userNumber});

  void resetGame() {
    this._playerTurn = 1;
    this._winner = 0;
  }

  // 0 -> draw, -1 -> not done, 1 -> player 1, 2 -> player 2
  int getResult(List<List<int>> grid) {
    // Check Vertical
    for (int j = 0; j < 3; j++) {
      bool isValid = true;
      for (int i = 1; i < 3; i++) {
        if (grid[i][j] != grid[i - 1][j] || grid[i][j] == 0) {
          isValid = false;
          break;
        }
      }

      if (isValid) {
        return grid[0][j];
      }
    }

    // Check Horizontal
    for (int i = 0; i < 3; i++) {
      bool isValid = true;
      for (int j = 1; j < 3; j++) {
        if (grid[i][j] != grid[i][j - 1] || grid[i][j] == 0) {
          isValid = false;
          break;
        }
      }

      if (isValid) {
        return grid[i][0];
      }
    }

    // Check Main Diagonal
    bool isValid = true;
    for (int i = 1; i < 3; i++) {
      if (grid[i][i] != grid[i - 1][i - 1] || grid[i][i] == 0) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      return grid[1][1];
    }

    // Check Cross Diagonal
    isValid = true;
    for (int i = 1; i < 3; i++) {
      if (grid[i][2 - i] != grid[i - 1][3 - i] || grid[i][2 - i] == 0) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      return grid[1][1];
    }

    // Check for a draw
    bool isDraw = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == 0) {
          isDraw = false;
        }
      }
    }

    if (isDraw) {
      return 0;
    }

    // Match incomplete
    return -1;
  }

  List<List<int>> toNumericalGrid(var grid) {
    List<List<int>> numGrid = List.generate(3, (i) => List(3), growable: false);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == this._player1Icon) {
          numGrid[i][j] = 1;
        } else if (grid[i][j] == this._player2Icon) {
          numGrid[i][j] = 2;
        } else {
          numGrid[i][j] = 0;
        }
      }
    }

    return numGrid;
  }

  bool isGameOver(var grid) {
    int result = getResult(toNumericalGrid(grid));
    if (result != -1) {
      this._winner = result;
      return true;
    }
    return false;
  }

  int minimax(List<List<int>> grid, int movePlayerNumber) {
    int gameResult = getResult(grid);

    if (gameResult != -1) {
      if (gameResult == computerNumber) {
        return 10;
      } else if (gameResult == userNumber) {
        return -10;
      } else {
        return 0;
      }
    }

    int maximum = -100;
    int minimum = 100;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == 0) {
          grid[i][j] = movePlayerNumber;
          int points = minimax(grid, 3 - movePlayerNumber);
          maximum = max(maximum, points);
          minimum = min(minimum, points);

          grid[i][j] = 0;
        }
      }
    }

    if (movePlayerNumber == computerNumber) {
      return maximum;
    } else {
      return minimum;
    }
  }

  List<List<dynamic>> computerMove(List<List<dynamic>> grid) {
    int drawR = -1;
    int drawC = -1;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == null) {
          grid[i][j] = (computerNumber == 1 ? _player1Icon : _player2Icon);
          int points = minimax(toNumericalGrid(grid), userNumber);
          // Winning Move
          if (points == 10) {
            return grid;
          }

          // Best Position in case there is no winning move
          if (points == 0) {
            drawR = i;
            drawC = j;
          }
          grid[i][j] = null;
        }
      }
    }

    // Moving to get a draw
    if (drawC != -1 && drawR != -1) {
      grid[drawR][drawC] = (computerNumber == 1 ? _player1Icon : _player2Icon);
      return grid;
    }

    // Only losing move available
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (grid[i][j] == null) {
          grid[i][j] = (computerNumber == 1 ? _player1Icon : _player2Icon);
          return grid;
        }
      }
    }

    // No move
    assert(false);
    return grid;
  }

  int getWinner() {
    return _winner;
  }

  void nextTurn() {
    this._playerTurn = 3 - this._playerTurn;
  }

  IconData getPlayerIcon() {
    if (_playerTurn == 1) {
      return _player1Icon;
    } else {
      return _player2Icon;
    }
  }

  int getPlayerTurnNumber() {
    return this._playerTurn;
  }
}
