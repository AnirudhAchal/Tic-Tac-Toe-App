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

  void restartGame() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        grid[i][j] = null;
      }
    }
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
          children: <Widget>[
            Column(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: FlatButton(
                  onPressed: () {
                    gameBrain.resetGame();
                    setState(() {
                      restartGame();
                    });
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
