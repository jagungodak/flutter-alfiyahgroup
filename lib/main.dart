
import 'package:alfiyahgroupppsfluter/splashscreen/splash.dart';
import 'package:alfiyahgroupppsfluter/utils.dart';
import 'package:flutter/material.dart';

utils ut=new utils();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    Widget _defaultHome = new LauncherPage();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First App',
      home: _defaultHome,
    );

  }
}
