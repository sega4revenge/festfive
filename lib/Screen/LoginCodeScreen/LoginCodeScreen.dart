import 'package:festfive/Config/ColorExt.dart';
import 'package:festfive/Config/FontConfig.dart';
import 'package:festfive/Config/ImageExt.dart';
import 'package:festfive/Screen/LoginCodeScreen/LoginCodeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginCodeScreen extends StatefulWidget {
  LoginCodeScreen({Key? key}) : super(key: key);
  LoginCodeViewModel viewModel = LoginCodeViewModel();


  @override
  LoginCodeScreenState createState() => LoginCodeScreenState();
}

class LoginCodeScreenState extends State<LoginCodeScreen> {
  AssetImage logo = AssetImageExt.imageFrom('verify_code_logo.png');

  Widget passwordCheckView() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: CupertinoColors.placeholderText)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: CupertinoColors.placeholderText)),
                hintText: '번호 입력',
                hintStyle: TextStyleExt.textStyle(
                    18, FontWeight.w300, CupertinoColors.placeholderText)),
          )),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            child: TextExt.text('확인', 18, FontWeight.w300, Colors.white),
            style: ElevatedButton.styleFrom(
              primary: HexColor("333131"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.authStartup("safsf");
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: logo),
                    ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: TextExt.text('코드번호 입력', 23, FontWeight.w400,
                            CupertinoColors.label)),
                    Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: -10,
                        children: <Widget>[
                          passwordCheckView(),
                          ListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: TextExt.text('정상 등록 되었습니다.', 13,
                                  FontWeight.w300, HexColor("0687C1")))
                        ]),
                    TextExt.text('코드번호는 문자 메시지로\n지정된 날짜에 전송 될 예정입니다', 15,
                        FontWeight.w300, Colors.black,
                        textAlign: TextAlign.center)
                  ],
                )),
          ),
        ));
  }
}
