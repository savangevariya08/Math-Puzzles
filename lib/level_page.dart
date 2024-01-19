import 'package:cdmi/gameplay.dart';
import 'package:cdmi/start.dart';
import 'package:flutter/material.dart';

import 'first.dart';

class level_page extends StatefulWidget {
  List l;
  level_page(this.l);

  @override
  State<level_page> createState() => _level_pageState();
}

class _level_pageState extends State<level_page> {
  int levelNo = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    share_pefer();
  }

  share_pefer() {
    levelNo = First.prefer!.getInt("levelNo") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Select puzzle",
              style: TextStyle(fontSize: 35, color: Colors.blueAccent),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: data.ans.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                   if(levelNo>index){
                     Navigator.push(context, MaterialPageRoute(
                       builder: (context) {
                         return start(index);
                       },
                     ));
                   }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: (index < levelNo)
                        ? Text(
                            "${index + 1}",
                            style:
                                TextStyle(fontSize: 40, fontFamily: "myfont"),
                          )
                        : null,
                    decoration: BoxDecoration(
                        image: (index  < levelNo)
                            ? (widget.l[index] == "yes")
                                ? DecorationImage(
                                    image: AssetImage("myassets/img/tick.png"))
                                : null
                            : DecorationImage(
                                image: AssetImage("myassets/img/lock.png")),
                        borderRadius: BorderRadius.circular(10),border: Border.all(width: 3)),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
