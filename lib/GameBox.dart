import 'package:flutter/material.dart';

class GameBox extends StatelessWidget {
  GameBox({this.icon, this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        //margin: const EdgeInsets.all(15.0),
        //padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black87,
            width: 5,
          ),
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(5),
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
