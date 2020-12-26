import 'package:flutter/material.dart';

class GameBox extends StatelessWidget {
  GameBox(
      {this.icon,
      this.onTap,
      this.bottomBorder = 0,
      this.leftBorder = 0,
      this.topBorder = 0,
      this.rightBorder = 0});

  final IconData icon;
  final Function onTap;
  final double topBorder;
  final double leftBorder;
  final double bottomBorder;
  final double rightBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: this.topBorder,
                color: this.topBorder == 0
                    ? Colors.white
                    : Colors.lightBlue.shade800),
            right: BorderSide(
                width: this.rightBorder,
                color: this.rightBorder == 0
                    ? Colors.white
                    : Colors.lightBlue.shade800),
            left: BorderSide(
                width: this.leftBorder,
                color: this.leftBorder == 0
                    ? Colors.white
                    : Colors.lightBlue.shade800),
            bottom: BorderSide(
                width: this.bottomBorder,
                color: this.bottomBorder == 0
                    ? Colors.white
                    : Colors.lightBlue.shade800),
          ),
        ),
        child: Icon(
          this.icon,
          size: 50,
        ),
        height: 100,
        width: 100,
      ),
    );
  }
}
