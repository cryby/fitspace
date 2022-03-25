import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halova_app/details.dart';
import 'package:health/health.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'util_colors.dart' as UtilColors;




class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();

  List training_info = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/training_infos.json")
        .then((value) {
      training_info = jsonDecode(value);
    });
  }

  int? steps_final = 0;
  int? calories_final = 0;
  var types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED
  ];
  _initHealth() async{
    if (await Permission.activityRecognition.request().isGranted) {

      HealthFactory health = HealthFactory();


      bool requested = await health.requestAuthorization(types);

      var now = DateTime.now();
      steps_final = Random().nextInt(100);
      // fetch health data from the last 24 hours
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          now.subtract(Duration(days: 1)), now, types);

      // request permissions to write steps and blood glucose
      var permissions = [
        HealthDataAccess.READ_WRITE,
        HealthDataAccess.READ_WRITE
      ];
      await health.requestAuthorization(types, permissions: permissions);

      // write steps and blood glucose
      bool success = await health.writeHealthData(steps_final!.toDouble(), HealthDataType.STEPS, now, now);
      success = await health.writeHealthData(calories_final!.toDouble(), HealthDataType.ACTIVE_ENERGY_BURNED, now, now);

      // get the number of steps for today
      var midnight = DateTime(now.year, now.month, now.day);
      int? steps = await health.getTotalStepsInInterval(midnight, now);

      if (requested) {
        try {
          steps = await health.getTotalStepsInInterval(midnight, now);
          steps_final = steps;
        } catch (error) {
          print("Caught exception in getTotalStepsInInterval: $error");
        }
        setState(() {
          steps_final = (steps == null) ? 999 : steps;
        });
      } else {
        print("Authorization not granted");
      }
    } else {
      steps_final = 0;
    }

    await Permission.activityRecognition.request();

  }

  int? getSteps() {

    _initHealth();

    return steps_final;
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }


  int count = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.AppColor.homePageBackground,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Tréning",
                      style: TextStyle(
                          fontSize: 30,
                          color: UtilColors.AppColor.homePageTitle,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 25,
                      color: UtilColors.AppColor.homePageIcons,
                    ),
                  ],
                ),
                /* Container(
              width: 220,
              margin: const EdgeInsets.only(top: 30, right: 200),
              height: 220,
              decoration: BoxDecoration(
                //  borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("utils/workoutilustration.jpg"),
                    fit: BoxFit.fill),
              ),
            ),*/
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Dnešný program",
                      style: TextStyle(
                          fontSize: 20,
                          color: UtilColors.AppColor.homePageSubtitle,
                          fontWeight: FontWeight.w700),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepOrange.withOpacity(0.8),
                            Colors.amberAccent.withOpacity(0.9)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, 10),
                            blurRadius: 20,
                            color: Colors.deepOrange.withOpacity(0.5))
                      ]),
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, top: 25, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ďalší cvik",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: UtilColors
                                      .AppColor.homePageContainerTextSmall)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Drepy",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: UtilColors
                                      .AppColor.homePageContainerTextSmall)),
                          Text("s výskokmi",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: UtilColors
                                      .AppColor.homePageContainerTextSmall)),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.timer_outlined,
                                      size: 20,
                                      color: UtilColors
                                          .AppColor.homePageContainerTextSmall),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("60 min",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: UtilColors.AppColor
                                              .homePageContainerTextSmall)),
                                ],
                              ),
                              Expanded(child: Container()),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.deepOrange
                                                .withOpacity(0.5),
                                            blurRadius: 10,
                                            offset: Offset(4, 8))
                                      ]),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => VideoDetails(
                                        detailsTitle: "Cvičenie nôh",
                                      ));
                                    },
                                    child: Icon(Icons.play_circle_fill,
                                        color: Colors.white, size: 60),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                /*Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 30),
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                           // image: DecorationImage(
                            //    image: AssetImage("utils/carsd.jpg"),
                             //   fit: BoxFit.fill),
                            color: Color(0xFFF2F3F8),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 40,
                                  offset: Offset(8, 10),
                                  color: Colors.deepOrange.withOpacity(0.3)),
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(-1, -5),
                                  color: Colors.deepOrange.withOpacity(0.2))
                            ]),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 200, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("utils/running.png"),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 100,
                        margin: const EdgeInsets.only(left: 150, top: 50),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ide ti to skvele",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange)),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "nevzdávaj sa\n",
                                    style: TextStyle(
                                      color:
                                          UtilColors.AppColor.homePagePlanColor,
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(text: "drž sa svojho plánu")
                                    ]),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),*/
                SizedBox(height: 30,),
          Row(
            children: [
              Text(
                "Tvoj postup",
                style: TextStyle(
                    fontSize: 20,
                    color: UtilColors.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.yellow
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: Colors.orange.withOpacity(0.8))
                ]),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 10.0,
                        percent: 0.8,
                        animateFromLastPercent: true,
                        animation: true,
                        animationDuration: 1000,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        linearGradient: LinearGradient(
                          colors:
                            [
                              Colors.redAccent,
                              Colors.blueAccent
                            ]
                        ),
                        //progressColor: Colors.green,
                      ),
                    ),
                    Stack(
                      children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 30),
                      child: Text(getSteps().toString(), style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left:  50 + getSteps().toString().length.toDouble() * getSteps().toString().length.toDouble() * 2.5),
                      child: Text("krokov", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50, left: 30),
                          child: Text("$calories_final", style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50, left: 5),
                          child: Text("kalóríi", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 90, left: 30),
                              child: Text("1,5", style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 90, left: 5),
                              child: Text("kilometra", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                          ],
                        )
                  ],
                    ),
          ],
                ),
              ],
            ),
          ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Fitness",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: UtilColors.AppColor.homePageTitle))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 138,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCardWithPart(
                            "Nohy", "utils/test1.png", 0, 2, 10, 0),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithPart(
                            "Brucho", "utils/test2.png", 0, 2, 2, 15),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithPart(
                            "Ruky", "utils/test3.png", 0, 2, 10, 1),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithPart(
                            "Ramená", "utils/test4.png", 0, 3, -5, 1),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Relax",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: UtilColors.AppColor.homePageTitle))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 138,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildCardWithPart(
                            "Meditácia", "utils/test5.png", 0, 2, -6, 0),
                        SizedBox(
                          width: 12,
                        ),
                        /*buildCardWithPart(
                            "Podrep s jednou nohou", "utils/test1.png"),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithPart(
                            "Podrep jednou nohou", "utils/test1.png"),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithPart(
                            "Podrep jednou nohou", "utils/test1.png"),
                        SizedBox(
                          width: 12,
                        ),*/
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                /*Expanded(
                child: 
            OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: (training_info.length.toDouble() / 2).toInt(),
                    itemBuilder: (_, i) {
                      int a = 2 * i;
                      int b = 2 * i + 1;
                      return Row(
                        children: [
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 30, top: 10),
                              padding: EdgeInsets.only(
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(training_info[a]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(3, 3),
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-3, -3),
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    training_info[a]['title'].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.6))),
                              ))),
                          Container(
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              height: 170,
                              margin: const EdgeInsets.only(
                                  left: 30, bottom: 30, top: 10),
                              padding: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(training_info[b]['img'])),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(3, 3),
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2)),
                                    BoxShadow(
                                        blurRadius: 3,
                                        offset: Offset(-3, -3),
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.2))
                                  ]),
                              child: Center(
                                  child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                    training_info[b]['title'].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.deepOrangeAccent
                                            .withOpacity(0.6))),
                              ))),
                        ],
                      );
                    })))*/
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget buildCardWithPart(String title, String image_path, double left,
        double right, double bot, double top) =>
    InkWell(
      onTap: () {
        switch (title) {
          case "Nohy":
            Get.to(() => VideoDetails(
              detailsTitle: "Cvičenie nôh",
            ));
            break;
          case "Brucho":
            Get.to(() => VideoDetails(
              detailsTitle: "Cvičenie brucha",
            ));
            break;
          case "Ruky":
            Get.to(() => VideoDetails(
              detailsTitle: "Cvičenie rúk",
            ));
            break;
          case "Ramená":
            Get.to(() => VideoDetails(
              detailsTitle: "Cvičenie ramien",
            ));
            break;
          default:
            debugPrint("niečo iné");
            break;
        }
      },
      child: Container(
        width: 150,
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFFF2F3F8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 0,
            ),
            Stack(children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: left, right: right, bottom: 0, top: top),
                  child: Image.asset(image_path)),
              Padding(
                  padding: EdgeInsets.only(left: bot + 50 - right, top: 105),
                  child: Text(title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal)))
            ]),
            /* SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 35),
                child: Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54)))*/
          ],
        ),
      ),
    );

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    //draw arc
    canvas.drawArc(Offset(100, 100) & Size(100, 100),
        0, //radians
        2, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
