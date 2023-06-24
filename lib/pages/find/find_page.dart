import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {

  List<List<String>> item=[
   ["朋友圈","0","ff_Icon_album.webp"],
    ["扫一扫","1","ff_Icon_qr_code.webp"],
    ["摇一摇","0","ff_Icon_shake.webp"],
    ["看一看","1","ic_feeds.png"],
    ["搜一搜","0","ff_Icon_search.webp"],
    ["附近","1","ic_people_nearby.png"],
    ["购物","1","ic_shopping.png"],
    ["游戏","0","game_center_h5.webp"],
    ["小程序","1","ic_mini_program.png"]
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
        title: Text("发现",style: TextStyle(color: Color(0xff181818),fontSize: 16),),
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
      body: ListView(
        children: [
          ...item.map((e){
            final index = item.indexOf(e);
            return FindItem(e: e,index:index,item: item,);
          }).toList(),
          Expanded(child: Container(
            height: 128,
            color: Color(0xffededed),
          ))
        ],
      ),
    );
  }
}

class FindItem extends StatelessWidget {
  final List<String> e;
  final int index;
  final List<List<String>> item;
  const FindItem({super.key, required this.e,required this.index,required this.item});

  @override
  Widget build(BuildContext context) {
    final nextIndex = index + 1;
    bool needLine = index!=item.length-1&&item[nextIndex][1] !="1";
    return Column(
      children: [
        if(e[1]=="1") Container(
      color: Color(0xffededed),
      // padding: EdgeInsets.only(left: 16),
      // margin: EdgeInsets.only(top:8),
      height: 8,
      alignment: Alignment.centerLeft,

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
                          "assert/images/${e[2]}",
                          width: 25,
                          height: 25,
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
                        color: needLine?Color(0xffe5e5e5):Colors.transparent
                    ),
                  )
              ),
              child:  Text(e[0],style: TextStyle(color:Color(0xff181818),fontSize: 16),),
            ))
          ],
        )
      ],
    );
  }
}

