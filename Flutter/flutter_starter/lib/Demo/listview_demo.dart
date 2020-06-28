import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(16.0, 0, 16, 0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '用户小宝',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text('12:30 北京')
                    ],
                  ))
                ],
              ),
            ),
            Text(
              '之前来中国席卷票房的《碟中谍6》，让56岁依然亲身上阵各种高危动作戏的老帅哥汤姆?克鲁斯又火了一把。年过半百，汤帅依然身材干练，飞车、开直升机丝毫不怵。',
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Image.asset(
                  'images/1.jpg',
                  fit: BoxFit.cover,
                )),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      onTap: () {
        print('点击了');
      },
    );
  }

  Widget separatorBuilder(BuildContext context, index) {
    return Container(
      height: 0.5,
      margin: EdgeInsets.only(left: 16.0),
      color: Colors.black26,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewDemo'),
        elevation: 0.0,
      ),
      body: ListView.separated(
      itemBuilder: _itemBuilder,
      separatorBuilder: separatorBuilder,
      itemCount: 10,
    ),
    );
  }
}
