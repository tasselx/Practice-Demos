import 'package:flutter/material.dart';

class ToolTipsDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        child: Tooltip(
          message: '开启飞行模式',
          child: Icon(Icons.airplanemode_inactive),
        ),
      ),
    );
  }

}
