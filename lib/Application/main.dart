import 'package:festfive/Config/SharedPreferences.dart';
import 'package:festfive/Screen/LoginCodeScreen/LoginCodeScreen.dart';
import 'package:flutter/material.dart';

void main() async {

  runApp(MyApp());
  spUtil = await SpUtil.getInstance();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginCodeScreen(),
    );
  }
}

SpUtil? spUtil;

/// init
///
/// 初始化 [spUtil] 并启动[DartIn]
init() async {
  spUtil = await SpUtil.getInstance();
}
