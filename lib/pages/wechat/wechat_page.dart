import 'package:flutter/material.dart';

class WechatPage extends StatefulWidget {
  const WechatPage({Key? key}) : super(key: key);

  @override
  State<WechatPage> createState() => _WechatPageState();
}
class _WechatPageState extends State<WechatPage> {

  List<String> mockData = [
    "明露浅吟",
    "青衫倩影",
    "星光流转",
    "晨曦旅者",
    "烟雨渺茫",
    "时光倒影",
    "梦幻诗人",
    "遥远星辰",
    "流云散落",
    "心灵画师",
    "梦想航行",
    "诗意流年",
    "灵魂独白",
  ];

  // 明露浅吟：夜色如墨，思绪悠远，红尘烟火，谁人为幕？
  // 青衫倩影：风吹过窗棂，岁月穿梭，纸上墨香，谁人写韵？
  // 星光流转：宇宙漫游，岁月轮回，人生苦短，谁人为航？
  // 晨曦旅者：拂晓悠然，世事纷扰，心随光影，谁人抚慰？
  // 烟雨渺茫：梦幻迷离，人生如戏，红尘落幕，谁人逍遥？
  // 时光倒影：岁月如梭，心事浩瀚，回首往昔，谁人凝望？
  // 梦幻诗人：墨香世界，心灵舞曲，文字流淌，谁人颂唱？
  // 遥远星辰：宇宙辽阔，思绪漫游，梦想闪耀，谁人追逐？
  // 流云散落：轻盈如烟，缘起缘灭，凡尘浮沉，谁人留恋？
  // 心灵画师：意境如画，情感荡漾，笔墨流转，谁人描绘？
  // 梦想航行：风筝放飞，天空浩渺，追逐理想，谁人翱翔？
  // 诗意流年：岁月静好，文字流淌，心灵荡漾，谁人倾听？
  // 灵魂独白：星空微光，宇宙寂静，内心诉说，谁人解读？
  List<String> mockData2 = [
    "夜色如墨，思绪悠远，红尘烟火，谁人为幕？",
    "风吹过窗棂，岁月穿梭，纸上墨香，谁人写韵",
    "宇宙漫游，岁月轮回，人生苦短，谁人为航？",
    "拂晓悠然，世事纷扰，心随光影，谁人抚慰？",
    "梦幻迷离，人生如戏，红尘落幕，谁人逍遥？",
    "岁月如梭，心事浩瀚，回首往昔，谁人凝望？",
    "墨香世界，心灵舞曲，文字流淌，谁人颂唱？",
    "宇宙辽阔，思绪漫游，梦想闪耀，谁人追逐？",
    "轻盈如烟，缘起缘灭，凡尘浮沉，谁人留恋？",
    "意境如画，情感荡漾，笔墨流转，谁人描绘？",
    "风筝放飞，天空浩渺，追逐理想，谁人翱翔？",
    "岁月静好，文字流淌，心灵荡漾，谁人倾听？",
    "星空微光，宇宙寂静，内心诉说，谁人解读？",
  ];

  List<String> pic=[
    "0.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
    "6.jpg",
    "7.jpg",
    "8.jpg",
    "13.jpg",
    "10.jpg",
    "11.jpg",
    "12.jpg",
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
        title: Text("微信(2)",style: TextStyle(color: Color(0xff181818),fontSize: 16),),
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
      body: Column(
        children: [
          // Container(
          //   color: Color(0xffededed),
          //   width: double.infinity,
          //   height: 50,
          //   padding: EdgeInsets.only(right: 8,left: 8,bottom: 15),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.all(Radius.circular(9)),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(Icons.search,size: 20,),
          //         SizedBox(width: 7,),
          //         Text(
          //           "搜索",
          //           style: TextStyle(
          //               color: Color(0xffb3b3b3),
          //               fontSize: 16
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context,index){
                // return Text("index::${mockData[index]}");
                return Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top:13,bottom: 12,left: 16,right: 11),
                            child:ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                child: Image.asset("assert/images/${pic[index]}",height: 48,width: 48,fit: BoxFit.cover,)
                            )
                        ),
                        Positioned(
                            right:11/2,
                            top:13/2,
                            child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffFA5151),
                              borderRadius: BorderRadius.all(Radius.circular(18))
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
                          child: Text(
                            "1",style: TextStyle(color: Colors.white,fontSize:12),
                          ),
                        ))
                      ],
                    ),
                    Expanded(child: Container(
                      height:72,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xdde5e5e5))
                          )
                      ),
                      padding: EdgeInsets.only(top: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                      mockData[index],style: TextStyle(color: Color(0xdd1a1a1a),fontSize: 16)
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 8),
                                child: Text(
                                  "昨天10:53",
                                  style: TextStyle(
                                      color: Color(0xffcdcdcd),
                                      fontSize: 12
                                  ),
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            mockData2[index],
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xffb3b3b3)
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                );
              },
              itemCount: mockData.length,
            ),
          )
        ],
      ),
    );
  }
}

