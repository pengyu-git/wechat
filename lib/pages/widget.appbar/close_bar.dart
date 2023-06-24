import 'package:flutter/material.dart';
import 'package:wechat/main.dart';

class CloseBar extends AppBar {
  CloseBar({Key? key}) : super(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: InkWell(
      child: UnconstrainedBox(
        child: Icon(Icons.close,size:15,),
      ),
      onTap: (){
        Navigator.of(navigatorKey.currentState!.context).pop();
      },
    )
  );

}
