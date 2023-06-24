import 'package:flutter/material.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  List<List<String>> defItems=[
    ["ic_new_friend.webp","新的朋友"],
    ["ic_group.webp","群聊"],
    ["ic_tag.webp","标签"],
    ["ic_offical.webp","公众号"],
  ];

  List<List<String>> items=[

    ["3.jpg","晨曦旅者","C"],
    ["12.jpg","灵魂独白","L"],
    ["8.jpg","流云散落",""],
    ["6.jpg","梦幻诗人","M"],
    ["10.jpg","梦想航行",""],
    ["0.jpg","明露浅吟",""],
    ["1.jpg","青衫倩影","Q"],
    ["5.jpg","时光倒影","S"],
    ["11.jpg","诗意流年",""],
    ["13.jpg","心灵画师","X"],
    ["2.jpg","星光流转",""],
    ["4.jpg","烟雨渺茫","Y"],
    ["7.jpg","遥远星辰",""],
  ];

  _popupMenuItem(String title,IconData icon){
    return PopupMenuItem(child: Row(
      children: <Widget>[
        SizedBox(
          width: 32,
          height: 32,
          child: Icon(
              icon,
              color:Colors.black
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(
                color:Colors.black
            ),
          ),
        )
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffededed),
        elevation: 0,
        title: Text("通讯录",style: TextStyle(color: Color(0xff181818),fontSize: 16),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              print("object");
            },
            icon:Image.asset("assert/images/search_black.webp",height: 20,width: 20,),
            // Icon(Icons.search_outlined,size: 20,color: Colors.black,)
          ),
          IconButton(onPressed: (){
            showMenu(context: context, position: RelativeRect.fromLTRB(500, 76, 10, 0),
              items:<PopupMenuEntry>[
                _popupMenuItem("发起群聊", Icons.wechat_outlined),
                _popupMenuItem("添加朋友", Icons.group),
                _popupMenuItem("扫一扫", Icons.qr_code_scanner),
                _popupMenuItem("收付款", Icons.qr_code),
              ],);
          },
            icon: Image.asset("assert/images/add_addressicon.png",height: 18,width: 18,color: Colors.black,),
          ),
        ],
      ),
      body:
        ListView(
          children: [
            ...defItems.map((e) {
              bool needBorder = e != defItems.last;
              return ContactItemDef(e:e,needBorder : needBorder);
            }).toList(),
            ...items.map((e) {
              final int currentIndex = items.indexOf(e);
              return ContactItem(e:e,currentIndex:currentIndex,items: items);
            }).toList()
          ],
        ),
    );
  }
}
class ContactItemDef extends StatelessWidget {
  final bool needBorder;
  final List<String> e;
  const ContactItemDef({required this.e , this.needBorder = false,Key?key}) :super(key:key);

  @override
  Widget build(BuildContext context) {

    return Column(
    children: [
    Row(
    children: [
    SizedBox(width: 16,),
    Container(
    margin: EdgeInsets.only(top: 9,bottom: 4),
    child: ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    child: Stack(
    alignment: Alignment.center,
    children: [
    Image.asset(
    "assert/images/${e[0]}",
    width: 40,
    height: 40,
    fit :BoxFit.cover,
    ),
    ],
    )
    )
    ),
    SizedBox(width: 13,),
    Expanded(child: Container(
    height:53,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
    border: Border(
    bottom: BorderSide(
    color: needBorder?Color(0xffe5e5e5):Colors.transparent
    ),
    )
    ),
    child:  Text(e[1],style: TextStyle(color:Color(0xff181818),fontSize: 16),),
    ))
    ],
    ),
      ]
    );
  }
}

class ContactItem extends StatelessWidget {

  final List<String> e;
  final int currentIndex;
  final List<List<String>> items;
  const ContactItem({required this.e ,required this.items,required this.currentIndex,Key?key}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    final bool needTitle = e[2]!= "";
    final int nextIndex = currentIndex +1;
    bool needBottomLine = currentIndex != items.length -1 &&items[nextIndex][2] == "";
    return Column(
        children: [
          if (needTitle)
            Container(
            color: Color(0xffededed),
            padding: EdgeInsets.only(left: 16),
            margin: EdgeInsets.only(top:8),
            height: 32,
            alignment: Alignment.centerLeft,
            child: Text(
              e[2],
              style:TextStyle(color: Color(0xff686868),fontSize: 14)
            ),
          ),
          Row(
            children: [
              SizedBox(width: 16,),
              Container(
                  margin: EdgeInsets.only(top: 9,bottom: 4),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assert/images/${e[0]}",
                            width: 40,
                            height: 40,
                            fit :BoxFit.cover,
                          ),
                        ],
                      )
                  )
              ),
              SizedBox(width: 13,),
              Expanded(child: Container(
                height:53,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: needBottomLine?Color(0xffe5e5e5):Colors.transparent
                      ),
                    )
                ),
                child:  Text(e[1],style: TextStyle(color:Color(0xff181818),fontSize: 16),),
              ))
            ],
          ),
        ]
    );
  }
}

