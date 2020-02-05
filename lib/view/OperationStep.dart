import 'package:alfiyahgroupppsfluter/api/ApiService.dart';
import 'package:alfiyahgroupppsfluter/model/stepOperasiModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HalamanLogin.dart';

class Parameter{
  final String id_user;
  final String id_job;
  final String id_level_tugas;
  Parameter(this.id_user,this.id_job,this.id_level_tugas);

 
}

class StepOperasi extends StatefulWidget {
Parameter parameter;
  StepOperasi(
      {Key key, @required this.parameter, StepOperasiModel step_operasi})
      : super(key: key);
 

  @override
  _StepOperasiState createState() => _StepOperasiState(parameter);
}

class _StepOperasiState extends State<StepOperasi> {
Parameter parameter;
_StepOperasiState(Parameter this.parameter);

  List data;
  bool _isLoading = false;

  void initState() {
    this.getData();
  }

  getData() async {
    setState(() => _isLoading = true);
    var src = await ApiService().getStepOperasi(parameter.id_user, parameter.id_job, parameter.id_level_tugas);
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
