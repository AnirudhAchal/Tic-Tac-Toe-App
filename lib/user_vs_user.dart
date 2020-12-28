import 'package:flutter/material.dart';
import 'GameBrain.dart';
import 'package:tic_tac_toe/GameBox.dart';
import 'results_page.dart';

class UserVsUserPage extends StatefulWidget {
  @override
  _UserVsUserPageState createState() => _UserVsUserPageState();
}

class _UserVsUserPageState extends State<UserVsUserPage> {
  var grid = List.generate(3, (i) => List(3), growable: false);
  GameBrain gameBrain = GameBrain();
  int playerTurnName = 1;

  void restartGame() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        grid[i][j] = null;
      }
    }

    playerTurnName = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    'Player $playerTurnName\'s move',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GameBox(
                        bottomBorder: 5,
                        rightBorder: 5,
                        icon: grid[0][0],
                        onTap: () {
                          if (grid[0][0] == null) {
                            setState(() {
                              grid[0][0] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        bottomBorder: 5,
                        rightBorder: 5,
                        leftBorder: 5,
                        icon: grid[0][1],
                        onTap: () {
                          if (grid[0][1] == null) {
                            setState(() {
                              grid[0][1] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        bottomBorder: 5,
                        leftBorder: 5,
                        icon: grid[0][2],
                        onTap: () {
                          if (grid[0][2] == null) {
                            setState(() {
                              grid[0][2] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GameBox(
                        bottomBorder: 5,
                        rightBorder: 5,
                        topBorder: 5,
                        icon: grid[1][0],
                        onTap: () {
                          if (grid[1][0] == null) {
                            setState(() {
                              grid[1][0] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        bottomBorder: 5,
                        rightBorder: 5,
                        leftBorder: 5,
                        topBorder: 5,
                        icon: grid[1][1],
                        onTap: () {
                          if (grid[1][1] == null) {
                            setState(() {
                              grid[1][1] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        bottomBorder: 5,
                        leftBorder: 5,
                        topBorder: 5,
                        icon: grid[1][2],
                        onTap: () {
                          if (grid[1][2] == null) {
                            setState(() {
                              grid[1][2] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GameBox(
                        rightBorder: 5,
                        topBorder: 5,
                        icon: grid[2][0],
                        onTap: () {
                          if (grid[2][0] == null) {
                            setState(() {
                              grid[2][0] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        rightBorder: 5,
                        leftBorder: 5,
                        topBorder: 5,
                        icon: grid[2][1],
                        onTap: () {
                          if (grid[2][1] == null) {
                            setState(() {
                              grid[2][1] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GameBox(
                        leftBorder: 5,
                        topBorder: 5,
                        icon: grid[2][2],
                        onTap: () {
                          if (grid[2][2] == null) {
                            setState(() {
                              grid[2][2] = gameBrain.getPlayerIcon();
                              gameBrain.nextTurn();
                              playerTurnName = gameBrain.getPlayerTurnNumber();
                            });
                          }
                          if (gameBrain.isGameOver(grid)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  winner: gameBrain.getWinner().toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 30, top: 30),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onPressed: () {
                    gameBrain.resetGame();
                    setState(() {
                      restartGame();
                    });
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
