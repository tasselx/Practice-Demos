import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: LoginbackView()
    );
  }
}

class LoginbackView extends StatefulWidget {
  @override
  _LoginbackViewState createState() => _LoginbackViewState();
}

class _LoginbackViewState extends State<LoginbackView> {

  Size size;
  double imgWidth;
  double imgHeight;

  String login1 = 'assets/images/login1.webp';
  String login2 = 'assets/images/login2.webp';
  String login3 = 'assets/images/login3.webp';
  String login4 = 'assets/images/login4.webp';
  String mask = 'assets/images/login_mask.png';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    imgWidth = size.width / 4;
    imgHeight = 3012 * imgWidth / 187;
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(alignment: Alignment.topLeft, //指定未定位或部分定位widget的对齐方式
          children: [
            ScrollLoopWidget(imgWidth, imgHeight, 0, 0.2, login1),
            ScrollLoopWidget(
                imgWidth, imgHeight, imgWidth, -0.15, login2),
            ScrollLoopWidget(
                imgWidth, imgHeight, imgWidth * 2, 0.2, login3),
            ScrollLoopWidget(
                imgWidth, imgHeight, imgWidth * 3, -0.15, login4),
            Image.asset(
              mask,
              fit: BoxFit.fill,
              width: size.width,
              height: size.height,
            )
          ]),
    );
  }

}

class ScrollLoopWidget extends StatefulWidget {

  final double imgWidth;
  final double imgHeight;

  final double left;
  final double speed;

  ///  < 1
  final String img;

  ScrollLoopWidget(
      this.imgWidth, this.imgHeight, this.left, this.speed, this.img,
      {Key key})
      : super(key: key);

  @override
  _ScrollState createState() => _ScrollState(
      this.imgWidth, this.imgHeight, this.left, this.speed, this.img);
}

class _ScrollState extends State<ScrollLoopWidget>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  double imgWidth;
  double imgHeight;

  double left;
  double speed;

  ///  < 1
  String img;

  double top1;
  double top2;

  Ticker _ticker;

  _ScrollState(this.imgWidth, this.imgHeight, this.left, this.speed, this.img) {
    top1 = 0;
    if (speed > 0) {
      top2 = -imgHeight;
    } else {
      top2 = imgHeight;
    }
  }

  @override
  void initState() {
    _ticker?.stop();
    _ticker = createTicker((elapsed) {
      setState(() {});
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker?.stop();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    top1 += speed;
    top2 += speed;
    if (speed > 0) {
      if (top1.floor() == 0) {
        top2 = -imgHeight;
      }
      if (top2.floor() == 0) {
        top1 = -imgHeight;
      }
    } else {
      if (top1.floor() == 0) {
        top2 = imgHeight;
      }
      if (top2.floor() == 0) {
        top1 = imgHeight;
      }
    }

    return Stack(
      children: [
        Positioned(
          left: left,
          top: top1,
          child: Image.asset(
            img,
            width: imgWidth,
            height: imgHeight,
          ),
        ),
        Positioned(
          left: left,
          top: top2,
          child: Image.asset(
            img,
            width: imgWidth,
            height: imgHeight,
          ),
        )
      ],
    );
  }
}
