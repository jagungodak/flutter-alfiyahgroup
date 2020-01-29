
import 'dart:isolate';
import 'package:alfiyahgroupppsfluter/api/ApiService.dart';
import 'package:alfiyahgroupppsfluter/model/UserModel.dart';
import 'package:alfiyahgroupppsfluter/view/HalamanListJob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alfiyahgroupppsfluter/utils.dart';

class HalamanLogin extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HalamanLogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  headerSection(),
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  Container buttonSection() {
    return Container(
        width: double.infinity,
        height: 60.0,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                setState(() => _isLoading = true);
                var res = await ApiService().loginUser(
                    _usernameController.text, _passwordController.text);

                setState(() => _isLoading = false);
                UserModel listSeafood = UserModel.fromJson(res);
                print("DATAAAAAAAAAAAAAAAAAAAAAA:");
                print(listSeafood.error_msg.toString() +
                    "=>" +
                    listSeafood.nama_user.toString() +
                    "==>" +
                    listSeafood.error.toString());
                if (listSeafood.error.toString() == "false") {
                  sharedPreferences.setString("id_user", listSeafood.id_user);
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new HalamanListJob();
                  }));
                } else {
                  _showDialog(listSeafood.error_msg);
                }
              },
              elevation: 5.0,
              color: Colors.orange,
              child: Text("Sign In",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 1.5)),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ],
        ));
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.white70),
              hintText: "Username",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 30.0),
          TextFormField(
            controller: _passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  Container headerSection() {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Text("Sign In",
          style: TextStyle(
              color: Colors.white,
              fontSize: 60.0,
              fontWeight: FontWeight.bold)),
    );
  }

  void _showDialog(String pesan) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Warning!!"),
          content: new Text(pesan),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}