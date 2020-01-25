import 'package:shared_preferences/shared_preferences.dart';
import 'package:alfiyahgroupppsfluter/utils.dart';
import 'package:alfiyahgroupppsfluter/view/HalamanListJob.dart';
import 'package:alfiyahgroupppsfluter/view/HalamanLogin.dart';
import 'package:flutter/material.dart';

utils ut=new utils();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    Widget _defaultHome = new HalamanLogin();
    return MaterialApp(
      title: 'First App',
      home: _defaultHome,
    );

  }
}
