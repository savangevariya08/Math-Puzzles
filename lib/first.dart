import 'package:cdmi/gameplay.dart';
import 'package:cdmi/level_page.dart';
import 'package:cdmi/start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: First(),
  ));
}

class First extends StatefulWidget {
  static SharedPreferences? prefer;

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List l=[];
  bool t = false;
  bool t1 = false;
  bool t2 = false;
  int ?curren_lvl;

  void initState() {
    // TODO: implement initState
    super.initState();
    share_pefer();
  }

  share_pefer() async {
    First.prefer = await SharedPreferences.getInstance();
    int levelno=First.prefer!.getInt("levelNo")??0;
    l=List.filled(data.ans.length,"");
    for(int i=0;i<levelno;i++){
      l[i]=First.prefer!.getString("level_status$i")??0;
    }
    print(l);
    curren_lvl=First.prefer!.getInt("levelNo")??0;
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
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Text("Math Puzzles",
                        style: TextStyle(color: Colors.blue, fontSize: 30)),
                  )),
                ],
              ),
              Expanded(
                flex: 7,
                child: Container(
                    margin: EdgeInsets.all(10),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "myassets/img/blackboard_main_menu.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t = false;
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return start();
                                    },
                                  ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: (t == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "myfont",
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t1 = false;
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return level_page(l);
                                    },
                                  ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t1 = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t1 = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: (t1 == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text(
                                    "PUZZLES",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "myfont",
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTapUp: (details) {
                                  t2 = false;
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return start(curren_lvl);
                                  //   },
                                  // ));
                                  setState(() {});
                                },
                                onTapDown: (details) {
                                  t2 = true;
                                  setState(() {});
                                },
                                onTapCancel: () {
                                  t2 = false;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: (t2 == true)
                                        ? Border.all(color: Colors.white)
                                        : null,
                                  ),
                                  child: Text(
                                    "BUY PR0",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "myfont",
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ])),
              ),
              Expanded(child: Text("")),
              Expanded(
                  child: Container(
                      child: Column(
                    children: [
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                      AssetImage("myassets/img/shareus.png")),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.white,
                                        Colors.grey
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.centerLeft),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                      AssetImage("myassets/img/emailus.png")),
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.grey,
                                        Colors.white,
                                        Colors.grey
                                      ],
                                      begin: Alignment.center,
                                      end: Alignment.centerLeft),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10,right: 10),
                                  alignment: Alignment.center,
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2),
                                  ),
                                  child: Text("privacy Policy",style: TextStyle(fontSize: 10),),
                                )
                              ])
                      )
                    ],
                  )),)
            ],
          ),
        ),
      ),
    );
  }
}
