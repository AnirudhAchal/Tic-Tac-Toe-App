import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameBrain {
  int _playerTurn = 1;
  IconData _player1Icon = FontAwesomeIcons.times;
  IconData _player2Icon = FontAwesomeIcons.circle;
  int _winner = 0;

  void resetGame() {
    this._playerTurn = 1;
    this._winner = 0;
  }

  bool isGameOver(var grid) {
    var numGrid = List.generate(3, (i) => List(3), growable: false);

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

    // Check Horizontal
    for (int i = 0; i < 3; i++) {
      bool isValid = true;
      for (int j = 1; j < 3; j++) {
        if (numGrid[i][j] != numGrid[i][j - 1] || numGrid[i][j] == 0) {
          isValid = false;
          break;
        }
      }
      if (isValid) {
        if (numGrid[i][0] == 1) {
          this._winner = 1;
        } else {
          this._winner = 2;
        }

        return true;
      }
    }

    // Check Vertical
    for (int i = 0; i < 3; i++) {
      bool isValid = true;
      for (int j = 1; j < 3; j++) {
        if (numGrid[j][i] != numGrid[j - 1][i] || numGrid[j][i] == 0) {
          isValid = false;
          break;
        }
      }
      if (isValid) {
        if (numGrid[0][i] == 1) {
          this._winner = 1;
        } else {
          this._winner = 2;
        }

        return true;
      }
    }

    // Check Diagonal 1
    bool isValid = true;
    for (int i = 1; i < 3; i++) {
      if (numGrid[i][i] != numGrid[i - 1][i - 1] || numGrid[i][i] == 0) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      this._winner = numGrid[0][0];
      return true;
    }

    // Check Diagonal 2
    isValid = true;
    for (int i = 1; i < 3; i++) {
      if (numGrid[i][2 - i] != numGrid[i - 1][3 - i] ||
          numGrid[i][2 - i] == 0) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      this._winner = numGrid[2][0];
      return true;
    }

    return false;
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
}
