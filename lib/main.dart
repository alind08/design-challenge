import 'package:design_challenge/shared/global_const.dart';
import 'package:flutter/cupertino.dart';

import 'modules/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        barBackgroundColor: bgColor,
        scaffoldBackgroundColor: bgColor,
        primaryColor: bgColor,
      ),
      home: Home(),
    );
  }
}
