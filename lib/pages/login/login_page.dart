import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat/pages/root_page.dart';
import 'package:wechat/pages/wechat/wechat_page.dart';
import 'package:wechat/pages/widget.appbar/close_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controller =  TextEditingController();

  // TextEditingController controller = TextEditingController();
  //
  // TextEditingController controller2 = TextEditingController();

  // void login() {
  //   if(controller.text == ""){
  //     Fluttertoast.showToast(
  //       msg: "手机号不能为空",
  //       gravity: ToastGravity.CENTER,
  //     );
  //     return;
  //   }
  //   if(controller2.text == ""){
  //     Fluttertoast.showToast(
  //       msg: "密码不能为空",
  //       gravity: ToastGravity.CENTER,
  //     );
  //     return;
  //   }
  //   RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  //   if(!exp.hasMatch(controller.text)){
  //     Fluttertoast.showToast(
  //       msg: "手机号有误",
  //       gravity: ToastGravity.CENTER,
  //     );
  //     return;
  //   }
  //   RegExp exp2 = RegExp(r'^([a-z]|[A-Z])\w{5,15}$');
  //   if(!exp2.hasMatch(controller2.text)){
  //     Fluttertoast.showToast(
  //       msg: "密码错误",
  //       gravity: ToastGravity.CENTER,
  //     );
  //     return;
  //   }
  //   Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder :(context){
  //     return RootPage();
  //   }),(route)=>false);
  // }

  void login() {
    if (controller.text == "") {
      Fluttertoast.showToast(msg: "请输入手机号", gravity: ToastGravity.CENTER);
      return;
    }
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (!exp.hasMatch(controller.text)) {
      Fluttertoast.showToast(
          msg: "手机号输入有误", gravity: ToastGravity.CENTER);
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) {
          return RootPage();
        }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle =TextStyle(
        fontSize: 16
    );
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CloseBar(),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          // 输入框失去焦点
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
                      "手机号登录",
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 47),
                  Container(color: Color(0xffd8d8d8), height: 1),
                  SizedBox(height: 17),
                  Row(
                    children: [
                      SizedBox(
                        width: 72 + 35 ,
                        child: Text("国家/地区", style: labelStyle),
                      ),
                      Expanded(child: Text("中国大陆",style: labelStyle),
                      ),
                      // Expanded(child:
                      // TextField(
                      //   controller: controller,
                      //   onChanged: (v) {
                      //     setState(() {
                      //
                      //     });
                      //   },
                      //   keyboardType: TextInputType.phone,
                      //   inputFormatters: [
                      //     LengthLimitingTextInputFormatter(11),
                      //     FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                      //   ],
                      //   cursorColor: Color(0xff87C160),
                      //   cursorWidth: 2,
                      //   decoration: InputDecoration(
                      //       hintText: "请填写手机号",
                      //       hintStyle: TextStyle(
                      //         color: Color(0xffb3b3b3),
                      //         fontSize: 16,
                      //       ),
                      //       border: InputBorder.none
                      //   ),
                      // )),
                      // if (controller.text != "" )IconButton(onPressed: () {
                      //   controller.clear();
                      // }, icon: Icon(Icons.close_rounded, size: 17,))
                    ],
                  ),
                  SizedBox(height: 17),
                  Container(color: Color(0xffd8d8d8), height: 1),
                  Container(
                    height: 23 + 16 +18,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 72 + 35,
                          child: Text("手机号",style: labelStyle,),
                        ),
                        Text(
                          "+86",
                          style: TextStyle(color: Color(0xff737373),fontSize: 16),
                        ),
                        SizedBox(width:10),
                        Expanded(child: TextField(
                          controller: controller,
                          onChanged: ( v ){
                            setState(() {

                            });
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11),
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          cursorColor: Color(0xff07C160),
                          cursorWidth: 2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "请填写手机号码",
                            hintStyle: TextStyle(
                              color: Color(0xffB3B3B3),
                              fontSize: 16
                            ),
                            border: InputBorder.none,
                          ),
                        )
                        ),
                        if(controller.text!="")IconButton(onPressed: (){
                          controller.clear();
                        }, icon: Icon(Icons.close,size:17))
                      ],
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 45 ,
                  //       child: Text("密码", style: TextStyle(
                  //           fontSize: 16
                  //       )),
                  //     ),
                  //     SizedBox(width: 20,),
                  //     Expanded(child: TextField(
                  //       controller: controller2,
                  //       onChanged: (v) {
                  //         setState(() {
                  //
                  //         });
                  //       },
                  //       keyboardType: TextInputType.text,
                  //       inputFormatters: [
                  //         LengthLimitingTextInputFormatter(18),
                  //         FilteringTextInputFormatter.allow(RegExp('[0-9]|[a-zA-Z]'))
                  //       ],
                  //       cursorColor: Color(0xff87C160),
                  //       cursorWidth: 2,
                  //       decoration: InputDecoration(
                  //           hintText: "请输入密码",
                  //           hintStyle: TextStyle(
                  //             color: Color(0xffb3b3b3),
                  //             fontSize: 16,
                  //           ),
                  //           border: InputBorder.none
                  //       ),
                  //     )),
                  //     if (controller2.text != "" )IconButton(onPressed: () {
                  //       controller2.clear();
                  //     }, icon: Icon(Icons.close_rounded, size: 17,))
                  //   ],
                  // ),
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
                login();
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
                  "同意并继续",
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
