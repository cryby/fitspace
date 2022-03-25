import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util_colors.dart' as UtilColors;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: UtilColors.AppColor.homePageBackground,
        body: Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white.withOpacity(0.2)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight)),
            child: Column(children: [
              Center(
                child: Text(
                  "Prihlásenie",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.greenAccent.withOpacity(0.8),
                      Colors.lightGreenAccent.withOpacity(0.9)
                    ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80),
                        topRight: Radius.circular(80)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 20,
                          color: UtilColors.AppColor.gradientSecond
                              .withOpacity(0.9))
                    ]),
              )
            ])));
  }
}
