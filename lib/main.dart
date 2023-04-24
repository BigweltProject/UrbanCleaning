import 'package:flutter/material.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/General/VideoSplashScreen.dart';

import 'General/AnimatedSplashScreen.dart';

Future main() async {
  runApp( MaterialApp(
    title: Constant.appname,
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primarySwatch: Colors.red,
    ),
    home: VideoSplashScreen(),
    routes: <String, WidgetBuilder>{},
  ));
}
