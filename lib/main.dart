import 'package:flutter/material.dart';
// import 'package:wechat/pages/forms/my_custom_form.dart';
import 'package:wechat/pages/main_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      home:MainPage(),
      routes: {
        // 'search':
      },
      navigatorKey: navigatorKey,
    );
  }
}
