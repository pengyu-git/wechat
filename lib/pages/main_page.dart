import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat/pages/login/login_page.dart';
import 'package:wechat/pages/login/register_page.dart';
import 'package:wechat/pages/root_page.dart';

class MainPage extends StatelessWidget {

  const MainPage({Key? key}) : super(key: key);

  void action(String value,BuildContext context) {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return value=="0"?LoginPage():RegisterPage();
          // return value=="0"?MyCustomForm():RegisterPage();
        }));
    }

  ///新组件 Container
  @override
  Widget build(BuildContext context) {
    final double rateWidth = (MediaQuery.of(context).size.width - 60) / 2;
    return Scaffold(
        body: Container(
            //container的装饰
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assert/images/bac.webp"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      children: ["登录", "注册"].map((e) {
                    final value = e == "登录" ? "0" : "1";
                    return InkWell(
                      child: Container(
                        margin: value == "0"
                            ? EdgeInsets.symmetric(vertical: 40, horizontal: 20)
                            : EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        width: rateWidth,
                        height: rateWidth * 49 / 158,
                        decoration: BoxDecoration(
                            color: value == "0"
                                ? Colors.white.withOpacity(0.12)
                                : Color(0xff07c160),
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        child: Text(
                          value == "0" ? "Login" : "Sign",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      onTap: () => action(value,context),
                    );
                  }).toList())
                ],
              ),
            )));
  }


}
