import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.winner});
  final String winner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text(
            'Player ${this.winner} Wins!!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
