import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final TextEditingController cgpaController =
      new TextEditingController();
  double cgpa = 0.0;
  double result = 0.0;
  String errormsg = "";
  bool check = false;
  String myresult = "";
  void Calculate() {
    setState(() {
      cgpa = double.parse(cgpaController.text);
      if (cgpa < 0) {
        check = true;
        myresult = "Invalid INPUT";
      } else if (cgpa > 0 && cgpa <= 1) {
        result = (cgpa / 0.0248);
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 1 && cgpa < 1.8) {
        result = (cgpa + 2.16) / 0.079;
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 1.8 && cgpa <= 2.5) {
        result = (cgpa + 1.65) / 0.069;
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 2.5 && cgpa < 2.88) {
        result = (cgpa - 0.28) / 0.037;
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 2.88 && cgpa < 3.25) {
        result = (cgpa - 0.36) / 0.036;
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 3.25 && cgpa < 3.63) {
        result = (cgpa - 0.29) / 0.037;
        check = false;
        myresult = result.toString();
      } else if (cgpa >= 3.63 && cgpa <= 4.0) {
        result = (cgpa - 0.3) / 0.037;
        check = false;
        myresult = result.toString();
      } else {
        check = true;
        myresult = "Invalid INPUT";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cgpa Calculator",
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CGPA Calculator'),
        ),
        body: Container(
          color: Colors.amber,

          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                    child: Text(
                  "CGPA CALCULATOR",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: cgpaController,
                decoration: InputDecoration(
                    hintText: 'Enter your CGPA',
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'CGPA',
                    labelStyle: TextStyle(color: Colors.black)),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: Calculate,
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.white,fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("Result" ,style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(width: 40,),
                    Text(
                      '${myresult}',
                      style: TextStyle(
                          color: check == true ? Colors.red   : Colors.teal,
                          fontSize: 20),
                    )


                  ],
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
