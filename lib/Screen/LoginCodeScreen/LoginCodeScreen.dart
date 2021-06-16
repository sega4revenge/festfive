import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginCodeScreen extends StatefulWidget {
  LoginCodeScreen({Key? key}) : super(key: key);

  @override
  LoginCodeScreenState createState() => LoginCodeScreenState();
}

class LoginCodeScreenState extends State<LoginCodeScreen> {

  AssetImage logo = AssetImage('assets/verify_code_logo.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Wrap(
                      spacing: 99999,
                      runSpacing: 100,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Image(image: logo),
                        ListTile(
                            title: Text('코드번호 입력')
                        ),
                      ]
                  )
                ],
              )
              ),
        ),
      )
    );
  }
}
