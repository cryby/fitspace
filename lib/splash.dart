import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halova_app/home.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Colors.white, Colors.white.withOpacity(0.2)]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Image.asset(
                    "utils/splash.png",
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                Text("A whole grocery store\n at your fingertips",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: SizedBox(
                child: CircularProgressIndicator(
                  valueColor:  AlwaysStoppedAnimation<Color>(Colors.orange),
                  strokeWidth: 5,
                ),
                height: 70,
                width: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
