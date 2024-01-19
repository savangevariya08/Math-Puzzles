import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  ));
}
class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  // String gender="";
 // bool h1=false;
 // bool h2=false;
 // bool h3=false;
 // int sum=0;
 //  int lan=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("testing"),),

//-------------------------------radio button-------------------------------------

      // body: Column(children: [
      //   Row(children: [
      //     Radio(value: "male", groupValue: gender, onChanged:(value) {
      //       gender=value!;
      //       setState(() {});
      //     },),
      //     Text("Male"),
      //     Radio(value: "female", groupValue: gender, onChanged:(value) {
      //       gender=value!;
      //       setState(() {});
      //     },),
      //     Text("Female"),
      //   ],),
      //   Row(children: [
      //
      //   ],),
      // ]),

//--------------------------------chek box-------------------------------------

    //   body: Column(children: [
    //     Row(children: [
    //       Checkbox(value: h1, onChanged:(value) {
    //         h1=value!;
    //         if(h1==true){
    //           sum=sum+100;
    //         }else{
    //           sum=sum-100;
    //         }
    //         setState(() {});
    //       },),
    //       Text("100"),
    //     ],),
    //
    //
    //     Row(children: [
    //       Checkbox(value: h2, onChanged:(value) {
    //         h2=value!;
    //         if(h2==true){
    //           sum=sum+200;
    //         }else{
    //           sum=sum-200;
    //         }
    //         setState(() {});
    //       },),
    //       Text("200"),
    //     ],),
    //
    //
    //     Row(children: [
    //       Checkbox(value: h3, onChanged:(value) {
    //         h3=value!;
    //         if(h3==true){
    //           sum=sum+300;
    //         }else{
    //           sum=sum-300;
    //         }
    //         setState(() {});
    //       },),
    //       Text("300"),
    //     ],),
    //     Text("sum = ${sum}"),
    //   ]),

//----------------------------DropdownButton---------------------------------

    //   body: DropdownButton(
    //     value: lan,
    //     items: [
    //     DropdownMenuItem(child: Text("java"),value: 1,),
    //     DropdownMenuItem(child: Text("php"),value: 2,),
    //     DropdownMenuItem(child: Text("flutter"),value: 3,),
    //     DropdownMenuItem(child: Text("c++"),value: 4,),
    //     DropdownMenuItem(child: Text("c"),value: 5,),
    //   ], onChanged: (value) {
    //       lan=value!;
    //       setState(() {});
    //   },),
    );
  }
}
