import 'package:flutter/material.dart';
import './Demo/tool_tips_demo.dart';
import './Demo/wrap_demo.dart';
import './Demo/listview_demo.dart';
import './Demo/row_demo.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

loadData() async {
  String dataURL = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(dataURL);
  print(response.body);
}

class Home extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    String key = routers.keys.elementAt(index);
    return ListTile(
      title: Text(key),
      onTap: () {
        loadData();
        Navigator.of(context).pushNamed(key);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('示例demo'),
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: routers.length,
        ));
  }
}

Map<String, WidgetBuilder> routers = {
  "布局练习": (context) {
    return ListViewDemo();
  },
  "WrapDemo":(context) {
    return WrapDemo();
  },
  "ToolTipDemo":(context) {
    return ToolTipsDemo();
  }
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: routers,
    );
  }
}
