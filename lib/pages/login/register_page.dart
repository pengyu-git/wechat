import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wechat/pages/login/login_page.dart';
import 'package:wechat/pages/widget.appbar/close_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controller = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  void register() {
    if(controller.text == ""){
      Fluttertoast.showToast(
        msg: "手机号不能为空",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    if(controller2.text == ""){
      Fluttertoast.showToast(
        msg: "密码不能为空",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    if(controller3.text == ""){
      Fluttertoast.showToast(
        msg: "请确认密码",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    if(controller2.text != controller3.text){
      Fluttertoast.showToast(
        msg: "两次输入的密码不一致，请确认密码",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if(!exp.hasMatch(controller.text)){
      Fluttertoast.showToast(
        msg: "手机号有误",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    RegExp exp2 = RegExp(r'^([a-z]|[A-Z])\w{5,15}$');
    if(!exp2.hasMatch(controller2.text)){
      Fluttertoast.showToast(
        msg: "密码错误",
        gravity: ToastGravity.CENTER,
      );
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder :(context){
      return LoginPage();
    }),(route)=>false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CloseBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print("object");
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                children: [
                  SizedBox(height: 69 - 18),
                  Center(
                    child: Text(
                      "注册",
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 47),
                  Container(color: Color(0xffd8d8d8), height: 1),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(
                        width: 45 ,
                        child: Text("账号", style: TextStyle(
                            fontSize: 16
                        )),
                      ),
                      SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller: controller,
                        onChanged: (v) {
                          setState(() {

                          });
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        cursorColor: Color(0xff87C160),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            hintText: "请填写手机号",
                            hintStyle: TextStyle(
                              color: Color(0xffb3b3b3),
                              fontSize: 16,
                            ),
                            border: InputBorder.none
                        ),
                      )),
                      if (controller.text != "" )IconButton(onPressed: () {
                        controller.clear();
                      }, icon: Icon(Icons.close_rounded, size: 17,))
                    ],
                  ),
                  Container(color: Color(0xffd8d8d8), height: 1,),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(
                        width: 45 ,
                        child: Text("密码", style: TextStyle(
                            fontSize: 16
                        )),
                      ),
                      SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller: controller2,
                        onChanged: (v) {
                          setState(() {

                          });
                        },
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(18),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]|[a-zA-Z]'))
                        ],
                        cursorColor: Color(0xff87C160),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            hintText: "请输入密码",
                            hintStyle: TextStyle(
                              color: Color(0xffb3b3b3),
                              fontSize: 16,
                            ),
                            border: InputBorder.none
                        ),
                      )),
                      if (controller2.text != "" )IconButton(onPressed: () {
                        controller2.clear();
                      }, icon: Icon(Icons.close_rounded, size: 17,))
                    ],
                  ),
                  Container(color: Color(0xffd8d8d8), height: 1,),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(
                        width: 45 ,
                        child: Text("确认", style: TextStyle(
                            fontSize: 16
                        )),
                      ),
                      SizedBox(width: 20,),
                      Expanded(child: TextField(
                        controller: controller3,
                        onChanged: (v) {
                          setState(() {

                          });
                        },
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(18),
                          FilteringTextInputFormatter.allow(RegExp('[0-9]|[a-zA-Z]'))
                        ],
                        cursorColor: Color(0xff87C160),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            hintText: "请再次输入密码",
                            hintStyle: TextStyle(
                              color: Color(0xffb3b3b3),
                              fontSize: 16,
                            ),
                            border: InputBorder.none
                        ),
                      )),
                      if (controller3.text != "" )IconButton(onPressed: () {
                        controller3.clear();
                      }, icon: Icon(Icons.close_rounded, size: 17,))
                    ],
                  ),
                  Container(color: Color(0xffd8d8d8), height: 1,),
                ],
              ),
            ),
            Text(
              "上述手机号仅用于登录验证",
              style: TextStyle(
                  color: Color(0xffb3b3b3), fontSize: 13
              ),
            ),
            SizedBox(height: 22),
            InkWell(
              onTap: () {
                register();
              },
              child: Container(
                width: 184,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff87c160),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "注册",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 181),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .padding
                  .bottom,
            )
          ],
        ),
      ),
    );
  }
}

