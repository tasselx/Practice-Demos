import 'package:flutter/material.dart';
import './plugin/sign_in_apple.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool canUseApple = false;
  String _name = 'Unknown';
  String _mail = 'Unknown';
  String _userIdentify = 'Unknown';
  String _authorizationCode = 'Unkown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {

    SignInApple.handleAppleSignInCallBack(onCompleteWithSignIn: (String name,
        String mail,
        String userIdentifier,
        String authorizationCode,
        String identifyToken) async {
      print("flutter receiveCode: \n");
      print(authorizationCode);
      print("flutter receiveToken \n");
      print(identifyToken);
      setState(() {
        _name = name;
        _mail = mail;
        _userIdentify = userIdentifier;
        _authorizationCode = authorizationCode;
      });
    }, onCompleteWithError: (AppleSignInErrorCode code) async {
      var errorMsg = "unknown";
      switch (code) {
        case AppleSignInErrorCode.canceled:
          errorMsg = "user canceled request";
          break;
        case AppleSignInErrorCode.failed:
          errorMsg = "request fail";
          break;
        case AppleSignInErrorCode.invalidResponse:
          errorMsg = "request invalid response";
          break;
        case AppleSignInErrorCode.notHandled:
          errorMsg = "request not handled";
          break;
        case AppleSignInErrorCode.unknown:
          errorMsg = "request fail unknown";
          break;
      }
      print(errorMsg);
    });

    bool useSignApple = await SignInApple.canUseAppleSigin();
    setState(() {
      canUseApple = useSignApple;
    });

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text(
              "苹果登录"
          ),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('苹果登录'),
            onPressed: (){
              SignInApple.clickAppleSignIn();
            },
          ),
        ),
      ) ,
    );

  }
}


