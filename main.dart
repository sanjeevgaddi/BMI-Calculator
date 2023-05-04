import 'dart:typed_data';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: const Padding(
            padding: EdgeInsets.all(120.0),
            child: Text('Your BMI'),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffad0c4),
                Color(0xfffbc2eb),
                Color(0xff4facfe),
              ],
              begin: FractionalOffset(1.0,0.5),
              end: FractionalOffset(0.5,1.0),
              stops: [0.0,0.5,1.0]
            )
          ),

        child:Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize:34,fontWeight: FontWeight.w500),),
                SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your Weight (in Kg)'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (in inch)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),

                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = feetController.text.toString();
                  var inch = inchController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                    //BMI Calculation

                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (ift*12) + iInch;

                    var tCm = tInch * 2.54;

                    var tM = tCm/100;

                    var bmi = iwt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You are OverWeight!!";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You are UnderWeight!!";
                      bgColor = Colors.red.shade300;
                    }else{
                      msg = "You are Healthy!!";
                      bgColor = Colors.green.shade200;
                    }

                    setState(() {
                      result = "$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}";
                    });
                  }
                  else{
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }

                }, child: Text('Calculate')
                ),
                SizedBox(height: 11),

                Text(result, style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
        )
        ),
    );
  }
}
