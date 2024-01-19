import 'package:cdmi/gameplay.dart';
import 'package:cdmi/win.dart';
import 'package:flutter/material.dart';
import 'first.dart';

class start extends StatefulWidget {
  int? ind;

  start([this.ind]);

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  String str = "";
  int curren_lvl = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("WidInd=${widget.ind}");
    if (widget.ind != null) {
      curren_lvl = widget.ind!;
    } else {
      curren_lvl = First.prefer!.getInt("levelNo") ?? 0;
    }
    print("levelNo$curren_lvl");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      WillPopScope(
        child: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("myassets/img/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              String st = First.prefer!.getString("skip_time") ?? "";
                              if (st == "") {
                                DateTime dt = DateTime.now();
                                First.prefer!.setString("skip_time", dt.toString());
                                First.prefer!.setString("level_status$curren_lvl", "no");
                                curren_lvl++;
                                First.prefer!.setInt("levelNo", curren_lvl);
                              } else {
                                DateTime cur_time = DateTime.now();
                                DateTime skip_time = DateTime.parse(st);
                                Duration dur = cur_time.difference(skip_time);
                                int sec = dur.inSeconds;
                                if (sec > 5) {
                                  First.prefer!.setString("skip_time", cur_time.toString());
                                  First.prefer!.setString("level_status$curren_lvl", "no");
                                  curren_lvl++;
                                  First.prefer!.setInt("levelNo", curren_lvl);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            Text("you can skip after 5 second"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("ok"))
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("myassets/img/skip.png"))),
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.center,
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "myassets/img/level_board.png"))),
                            child: Text(
                              "Puzzle ${curren_lvl + 1}",
                              style:
                                  TextStyle(fontSize: 20, fontFamily: "myfont"),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("myassets/img/hint.png"))),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "${data.game_level[curren_lvl]}"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ],
                    )),
                Expanded(child: Text("")),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("$str"),
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                ),
                              ),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (str != "") {
                                  str = str.substring(0, str.length - 1);
                                }
                                setState(() {});
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage("myassets/img/delete.png"),
                                )),
                              ),
                            )),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                if (str == "${data.ans[curren_lvl]}") {
                                  if (widget.ind == null) {
                                    First.prefer!.setString("level_status$curren_lvl", "yes");
                                    curren_lvl++;
                                    First.prefer!.setInt("levelNo", curren_lvl);
                                    str = "";
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return win(curren_lvl);
                                        },
                                      ),
                                    );
                                  } else {
                                    str = "";
                                    First.prefer!.setString("level_status$curren_lvl", "yes");
                                    curren_lvl++;
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return win(curren_lvl, true);
                                      },
                                    ));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Answer is wrong")));
                                }
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '1';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("1",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '2';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("2",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '3';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("3",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '4';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("4",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '5';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("5",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '6';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("6",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '7';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("7",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '8';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("8",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '9';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("9",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  str += '0';
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  alignment: Alignment.center,
                                  child: Text("0",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        )),
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("are you sure exit"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("cancel")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return First();
                          },
                        ));
                      },
                      child: Text("ok")),
                ],
              );
            },
          );
          return true;
        },
      ),
    );
  }
}
