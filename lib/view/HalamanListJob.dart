library bottom_navy_bar;

import 'package:alfiyahgroupppsfluter/api/ApiService.dart';

import 'package:alfiyahgroupppsfluter/view/HalamanLogin.dart';
import 'package:alfiyahgroupppsfluter/view/OperationStep.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanListJob extends StatefulWidget {

  @override
  HalamanListJobState createState() => new HalamanListJobState();
}

class HalamanListJobState extends State<HalamanListJob> {
  bool _isLoading = false;
  List data;
  String id_user;
  String id_level_tugas;
 String id_job;

  

  SharedPreferences sharedPreferences;
  @override
  void initState() {
    this.getData();
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("id_user") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HalamanLogin()),
          (Route<dynamic> route) => false);
    }
  }

  getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() => _isLoading = true);
    var src =
        await ApiService().getAllJob(sharedPreferences.getString("id_user"));
    setState(() => _isLoading = false);
    data = src['job'];
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          children: <Widget>[
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.black54),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.folder_open, color: Colors.black54),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.black54),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.blue[900],
        title: new Text("Alfiyah Group Apps",
            style: TextStyle(color: Colors.amber[600])),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HalamanLogin()),
                  (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],
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
                      data[index]['nama_group'] + ' ' + data[index]['status'],
                      style: TextStyle(
                          color: Colors.amber[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.5),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Container(
                            child: new Row(
                          children: <Widget>[
                            SizedBox(
                                width: 75,
                                child: new Text("Task ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))),
                            Flexible(
                                child: new AutoSizeText(
                                    ": " + data[index]['tugas'],
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 16.0)))
                          ],
                        )),
                        _type(data[index]['type'], index),
                        _tanggal(data[index]['type'], index)
                      ],
                    )),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            onPressed: () {},
                            color: Colors.amber,
                            child: Text("       Detail Job     ",
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 15.0,
                                    letterSpacing: 1.2)),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: new RaisedButton(
                              onPressed: ()  {
                                Parameter pr=new Parameter(id_user, id_job, id_level_tugas);
                                  Navigator.of(context).push(
                                      MaterialPageRoute<Null>(
                                          builder: (BuildContext context) {
                                    return new StepOperasi(parameter: pr);
                                  }));
                                
                              },
                              color: Colors.blue[900],
                              child: Text("Opetation Step",
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 15.0,
                                      letterSpacing: 1.5)),
                              padding: EdgeInsets.only(left: 20.0, right: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _type(type, index) {
    if (type == "Airport Arrival") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Airport ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " + data[index]['nama_airport_datang'],
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Airport Departure") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Airport ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " + data[index]['nama_airport_pulang'],
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Hotel Mekkah") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Hotel ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(": " + data[index]['hotel_mekah'],
                      maxLines: 2, style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Hotel Madinah") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Hotel ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(": " + data[index]['hotel_madinah'],
                      maxLines: 2, style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("BUS ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " +
                          data[index]['nama_transport'] +
                          "\n  Driver: " +
                          data[index]['driver'],
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    }
  }

  Widget _tanggal(type, index) {
    if (type == "Airport Arrival") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Date ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " +
                          data[index]['hari_datang'] +
                          ", " +
                          data[index]['tgl_datang'] +
                          "\n  DEP:" +
                          data[index]['dep_time_datang'] +
                          "\n  ARR: " +
                          data[index]['arr_time_datang'] +
                          "\n  From-To: " +
                          data[index]['from_datang'] +
                          " - " +
                          data[index]['to_datang'],
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Airport Departure") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Date ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " +
                          data[index]['hari_pulang'] +
                          ", " +
                          data[index]['tgl_pulang'] +
                          "\n  DEP:" +
                          data[index]['dep_time_pulang'] +
                          "\n  ARR: " +
                          data[index]['arr_time_pulang'] +
                          "\n  From-To: " +
                          data[index]['from_pulang'] +
                          " - " +
                          data[index]['to_pulang'],
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Hotel Mekkah") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Hotel ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(": " + data[index]['hotel_mekah'],
                      maxLines: 2, style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else if (type == "Hotel Madinah") {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("Hotel ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(": " + data[index]['hotel_madinah'],
                      maxLines: 2, style: TextStyle(fontSize: 14.0)))
            ],
          ));
    } else {
      return Container(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: new Row(
            children: <Widget>[
              SizedBox(
                  width: 75,
                  child: new Text("BUS ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14))),
              Flexible(
                  child: new AutoSizeText(
                      ": " +
                          data[index]['nama_transport'] +
                          "\n  Driver: " +
                          data[index]['driver'],
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.0)))
            ],
          ));
    }
  }
}
