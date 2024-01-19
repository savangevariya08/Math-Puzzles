import 'dart:io';

import 'package:cdmi/first.dart';
import 'package:cdmi/gameplay.dart';
import 'package:cdmi/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';

class win extends StatefulWidget {
  int curren_lvl;
  bool ?is_skip;
  win(this.curren_lvl,[this.is_skip]);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("myassets/img/background.jpg"))),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Puzzle ${widget.curren_lvl} Completed",
                    style: TextStyle(fontSize: 20),
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  height: 350,
                  width:double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("myassets/img/trophy.png"))),
                ),
              ),

              Expanded(
                child: Column(children: [
                  Expanded(
                    child: InkWell(onTap: () {
                      if(widget.is_skip==true){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return start(widget.curren_lvl);
                        },));
                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return start();
                        },));
                      }
                    },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height:50,
                        width: 150,
                        child: Text("Continue"),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey],
                                begin: Alignment.center,
                                end: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return First();
                      },));
                    },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height:50,
                        width: 150,
                        child: Text("Main Menu"),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.grey, Colors.white, Colors.grey],
                                begin: Alignment.center,
                                end: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      height:50,
                      width: 150,
                      child: Text("Buy Pro"),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey],
                              begin: Alignment.center,
                              end: Alignment.centerLeft),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),],),
              ),
              IconButton(onPressed: () {
                getImageFileFromAssets(data.game_level[widget.curren_lvl]).then((value) {
                  Share.shareFiles(['${value.path}']);
                  print('share completed');
                },);
                setState(() {

                });
              }, icon: Icon(Icons.share),),
              Expanded(child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}
