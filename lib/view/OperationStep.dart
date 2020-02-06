import 'package:alfiyahgroupppsfluter/api/AlfiyahAPI.dart';
import 'package:alfiyahgroupppsfluter/api/ApiService.dart';
import 'package:alfiyahgroupppsfluter/model/stepOperasiModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HalamanLogin.dart';



 class StepOperasi extends StatefulWidget {
final String id_user;
final String id_job;
final String id_level;
  const StepOperasi(this.id_user,this.id_job,this.id_level);


  @override
  _StepOperasiState createState() => _StepOperasiState();
}

class _StepOperasiState extends State<StepOperasi> {

_StepOperasiState();

  List data;
  bool _isLoading = false;

  void initState() {
    this.getData();
  }

  getData() async {
    setState(() => _isLoading = true);
    var src = await ApiService().getStepOperasi(widget.id_user, widget.id_job, widget.id_level);

    setState(() => _isLoading = false);
    data = src['step_operasi'];
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          "Step Operasi",
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.only(
            bottom: 10.0, top: 3.0, left: 3.0, right: 3.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Material(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Material(
                  elevation: 1.0,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      data[index]['ket_step_operasi'],
                      style: TextStyle(
                          color: Colors.amber[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
