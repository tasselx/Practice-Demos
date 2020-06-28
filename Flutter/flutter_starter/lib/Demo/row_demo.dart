import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Image.asset('images/1.jpg'),
          ),
          Expanded(
            child: Image.asset('images/2.jpg'),
          ),
          Expanded(
            child: Image.asset('images/3.jpg'),
          )
        ],
      ),
    );
  }
}
