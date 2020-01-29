import 'package:alfiyahgroupppsfluter/view/HalamanLogin.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override

  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new HalamanLogin();
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Image.asset('assets/images/logo-alfiyaah.png', height: 200, width: 200)
      ),
    );
  }
}