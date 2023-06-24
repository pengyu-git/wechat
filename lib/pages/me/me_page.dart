import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {

  List<List<String>> item=[
    ["服务","1","ic_wallet.png"],
    ["收藏","1","ic_collections.png"],
    ["朋友圈","0","ic_album.png"],
    ["卡包","0","ic_cards_wallet.png"],
    ["表情","0","ic_emotions.png"],
    ["设置","1","ic_setting.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.white,
                height: 130,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left:20.0,right:15.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset("assert/images/500.jpg",height: 60.0,width: 60.0),
                      )
                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("解梦人",style: TextStyle(
                          fontSize: 18.0,color: Color(0xff353535),fontWeight: FontWeight.w600
                        )),
                        SizedBox(height: 15,),
                        Text("微信号：wxid17275199",style: TextStyle(
                            fontSize: 12.0,color: Color(0xffa9a9a9)
                        ))
                      ],
                    ))
                  ],
                )
              ),
              ...item.map((e){
                final index = item.indexOf(e);
                return MeItem(e: e,index:index,item: item,);
              }).toList(),
              Expanded(child: Container(
                height: 265,
                color: Color(0xffededed),
              ))
            ],
          )

    );
  }
}

class MeItem extends StatelessWidget {
  final List<String> e;
  final int index;
  final List<List<String>> item;
  const MeItem({super.key, required this.e,required this.index,required this.item});

  @override
  Widget build(BuildContext context) {
    final nextIndex = index + 1;
    bool needLine = index!=item.length-1&&item[nextIndex][1] !="1";
    return Column(
      children: [
        if(e[1]=="1") Container(
          color: Color(0xffededed),
          padding: EdgeInsets.only(left: 16),
          margin: EdgeInsets.only(top:8),
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


