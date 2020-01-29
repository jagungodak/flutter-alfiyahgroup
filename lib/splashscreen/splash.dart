import 'package:alfiyahgroupppsfluter/view/HalamanListJob.dart';
import 'package:alfiyahgroupppsfluter/view/HalamanLogin.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
SharedPreferences sharedPreferences;
  void initState() {
    super.initState();
    startLaunching();
     checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("id_user") != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HalamanListJob()),
          (Route<dynamic> route) => false);
    }
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