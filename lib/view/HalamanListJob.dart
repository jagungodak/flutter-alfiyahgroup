import 'package:alfiyahgroupppsfluter/api/ApiService.dart';
import 'package:alfiyahgroupppsfluter/model/JobModel.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HalamanListJob extends StatefulWidget {
  @override
  HalamanListJobState createState() => new HalamanListJobState();
}

class HalamanListJobState extends State<HalamanListJob> {
  bool _isLoading = false;
  List data;

  getData() async {
    setState(() => _isLoading = true);
    var src = await ApiService().getAllJob("6");
    setState(() => _isLoading = false);
    data = src['job'];
    print(data);
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Alfiyah Group Apps",
              style: TextStyle(color: Colors.amber[600])),
          backgroundColor: Colors.blue[900]),
      body: new ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new  Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Material(
                  elevation: 20.0,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(data[index]['nama_group'],style: TextStyle(color:Colors.amber[600],fontWeight: FontWeight.bold,fontSize: 18),),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Container(
                          child:new Row(
                            children: <Widget>[
                              SizedBox(
                                width:75,
                              child:new Text("Task ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
                            Flexible(
                              child:new AutoSizeText(": "+data[index]['tugas'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
                            ],
                          )
                        ),
                        _type(data[index]['type'],index),
                        _tanggal(data[index]['type'],index)
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _type(type,index){
    if(type=="Airport Arrival"){
      return Container(
        padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Airport ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['nama_airport_datang'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Airport Departure"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Airport ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['nama_airport_pulang'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Hotel Mekkah"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Hotel ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hotel_mekah'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Hotel Madinah"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Hotel ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hotel_madinah'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else{
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("BUS ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['nama_transport']+"\n  Driver: "+data[index]['driver'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }
  }
  Widget _tanggal(type,index){
    if(type=="Airport Arrival"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Date ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hari_datang']+", "+data[index]['tgl_datang']+"\n  DEP:"+data[index]['dep_time_datang']+
                      "\n  ARR: "+data[index]['arr_time_datang']+"\n  From-To: "+data[index]['from_datang']+" - "+data[index]['to_datang'],
                     style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Airport Departure"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Date ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hari_pulang']+", "+data[index]['tgl_pulang']+"\n  DEP:"+data[index]['dep_time_pulang']+
                      "\n  ARR: "+data[index]['arr_time_pulang']+"\n  From-To: "+data[index]['from_pulang']+" - "+data[index]['to_pulang'],
                      style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Hotel Mekkah"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Hotel ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hotel_mekah'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else if(type=="Hotel Madinah"){
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("Hotel ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['hotel_madinah'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }else{
      return Container(
          padding: const EdgeInsets.only(top: 5.0,bottom: 5),
          child:new Row(
            children: <Widget>[
              SizedBox(
                  width:75,
                  child:new Text("BUS ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14))),
              Flexible(
                  child:new AutoSizeText(": "+data[index]['nama_transport']+"\n  Driver: "+data[index]['driver'],maxLines: 2,style: TextStyle(fontSize: 14.0)))
            ],
          )
      );
    }
  }
}
