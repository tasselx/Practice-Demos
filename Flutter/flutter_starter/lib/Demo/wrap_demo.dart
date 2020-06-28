import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {

  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = List<Widget>()..add(buildAddButton());
  }
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Demo'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2.0,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 20,
//              alignment: WrapAlignment.center,
//              runAlignment: WrapAlignment.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child:Container(
        width: 100.0,
        height: 100.0,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Center(
          child: Text('照片'),
        ),
      ) ,
    );
  }
  Widget buildAddButton() {
    return GestureDetector(
      onTap: (){
        if (list.length < 9) {
          setState(() {
            list.insert(list.length-1,buildPhoto());
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
