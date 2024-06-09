import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return
    MaterialApp(
      title: 'Calculator',
      home: Myhome(),
    );
  }
}
class Myhome extends StatefulWidget{
  @override
  State<Myhome> createState() {
   return MyhomeState();
  }

}
class MyhomeState extends State<Myhome>{
   /*int Selectedindex = -1;
  List<Map<String , dynamic>> moprator = [
    {
      'title' : '-',
      'color' : Colors.amber,
    },
    {
      'title' : '+',
      'color': Colors.blue.shade100
    },
    {
      'title' : '*',
      'color' : Colors.redAccent.shade100,
    },
    {
      'title' : '/',
      'color' : Colors.grey
    },
  ];*/
  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  num BMI = 0.0;
  String txtResult = "";
  Color bgColor = Colors.white;
   String image1 = 'assets/images/fit_image.png';
   String image2 = 'assets/images/unfit_icon.webp';
   String image0 = "";
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: bgColor,
    // drawer: image1,
    appBar: AppBar(
      title: Text('Calculator'),
      backgroundColor: Colors.blue,
      centerTitle: true,
      toolbarHeight: 50,
      bottomOpacity: 1111,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('BMI'),
        TextField(
          controller: wtController,
          decoration: InputDecoration(
             label: Text('enter your weight'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11)
            )
          ),
        ),
        SizedBox(height: 11,),
        TextField(
          controller: ftController,
          decoration: InputDecoration(
            label: Text('Enter your fit'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
            )
          ),
        ),
        SizedBox(height: 11,),
        TextField(
          controller: inchController,
          decoration: InputDecoration(
            label: Text('enter your height'),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amberAccent),
              borderRadius: BorderRadius.circular(11),
            )
          ),
        ),
        SizedBox(height: 22,),
        ElevatedButton(onPressed: (){
          num heightinch = int.parse(inchController.text.toString());
          num fit = int.parse(ftController.text.toString());
          num weight = int.parse(wtController.text.toString());

          num totalInch = (fit * 12) +heightinch;
          num totalCM = totalInch*2.54;
          num totalM = totalCM/100;

           BMI = weight/pow(totalM, 2.0);
           if(BMI>25) {
             txtResult = "you are overweight";
             bgColor = Colors.redAccent.shade200;
             image0 = image2;
           }
             else if(wtController == "" && ftController == "" && weight == ""){
               print("enter input");

           } else if (BMI<18){
             txtResult = "you are underweight";
             bgColor = Colors.orangeAccent.shade200;
           } else {
             txtResult = "you are good to go";
             bgColor = Colors.green;
             image0 = image1;
           }
           setState(() {

           });

        }, child: Text('BMI Calculate')),
        SizedBox(height: 11,),
        Text(BMI==0.0 ? "" : "your BMI is ${BMI.toStringAsFixed(2)}"),
        Text(BMI==0.0 ? "" : txtResult),


        Container(
          child: Image.asset(image1,height: 50 , width: 50,),
        ) ,
      ],
    ),
    bottomNavigationBar: Container(
      child: Text('har har mahadev'),
    ),
  );
  }

}