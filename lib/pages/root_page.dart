import 'package:flutter/material.dart';
import 'package:wechat/pages/contact/contact_page.dart';
import 'package:wechat/pages/find/find_page.dart';
import 'package:wechat/pages/me/me_page.dart';
import 'package:wechat/pages/wechat/wechat_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class BottomModel {
  final String iconName;
  final double width;
  final double height;
  final String label;

  BottomModel(this.iconName,this.width,this.height, this.label);
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;

  //
  PageController pageController = PageController();

  List<BottomModel> items = [
    BottomModel("chat", 24, 21, "微信"),
    BottomModel("contacts", 26, 21, "通讯录"),
    BottomModel("discover", 24, 24, "发现"),
    BottomModel("me", 23, 21, "我的"),
  ];

  List<Widget> pages = [
    WechatPage(),
    ContactPage(),
    FindPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedItemColor: Color(0xff07c160),
            unselectedItemColor: Color(0xff1c1c1c),
            backgroundColor: Color(0xffF9F9F9),
            onTap: (value) {
              currentIndex = value;
              pageController.jumpToPage(currentIndex);
              setState(() {});
            },
            items: items.map((e) {
              BottomModel model = e;
              return BottomNavigationBarItem(
                  icon:Image.asset(
                    "assert/images/tabbar_${model.iconName}_c.webp",
                    width: model.width,
                    height: model.height,
                  ),
                  activeIcon: Container(
                    child: Image.asset(
                      "assert/images/tabbar_${model.iconName}_s.webp",
                      width: model.width,
                      height: model.height,
                    ),
                  ),
                  label: model.label);
            }).toList(),
          ),
          Positioned(
              left: ((MediaQuery.of(context).size.width / 4) / 2) + 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                    color: Color(0xffFA5151),
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Text(
                  "13",
                  style: TextStyle(
                      color: Color(0xffCFCFCF),
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ))
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          currentIndex = index;
          setState(() {});
        },
        children: pages,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
