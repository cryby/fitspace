import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halova_app/home.dart';
import 'package:sizer/sizer.dart';
import 'package:halova_app/player.dart';
import 'util_colors.dart' as UtilColors;

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key, this.detailsTitle}) : super(key: key);

  final String? detailsTitle;
  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}


String getName(String title, int index) {
  switch (title)
  {
    case "Cvičenie nôh":
      switch (index)
      {
        case 0:
          return "Sumo drepy";
        case 1:
          return "Bulharský split squat";
        case 2:
          return "Mŕtvy ťah";
        case 3:
          return "Sumo drepy";
        case 4:
          return "Zanožovanie";
        case 5:
          return "Bočný zdvih nôh";
      }
      break;
    case "Cvičenie brucha":
      switch (index)
      {
        case 0:
          return "Príťahy kolien k trupu";
        case 1:
          return "Rotácia v bočnom planku";
        case 2:
          return "Kmitanie nohami";
        case 3:
          return "Cviky s fitloptou";
      }
      break;
    case "Cvičenie rúk":
      switch (index)
      {
        case 0:
          return "Kľuky";
        case 1:
          return "Swing";
        case 2:
          return "Kľuky na bradlách";
        case 3:
          return "Rozpažovanie";
      }
      break;
    case "Cvičenie ramien":
      switch (index)
      {
        case 0:
          return "Extenzia za hlavou";
        case 1:
          return "Rozpažovanie";
        case 2:
          return "Predný gradient";
        case 3:
          return "Dvojitý tlak jednou rukou";
      }
      break;
  }

  return "";
}

String getVideo(String title, int index) {
  switch (title)
  {
    case "Cvičenie nôh":
      switch (index)
      {
        case 0:
          return "utils/LegsNew1.mp4";
        case 1:
          return "utils/LegsNew2.mp4";
        case 2:
          return "utils/LegsNew3.mp4";
        case 3:
          return "utils/LegsNew4.mp4";
      }
      break;
    case "Cvičenie brucha":
      switch (index)
      {
        case 0:
          return "utils/turtleReaches.mp4";
        case 1:
          return "utils/turn.mp4";
        case 2:
          return "utils/plank.mp4";
        case 3:
          return "utils/situp.mp4";
      }
      break;
    case "Cvičenie rúk":
      switch (index)
      {
        case 0:
          return "utils/pushup2.mp4";
        case 1:
          return "utils/onehand.mp4";
        case 2:
          return "utils/testos.mp4";
        case 3:
          return "utils/testos.mp4";
      }
      break;
    case "Cvičenie ramien":
      switch (index)
      {
        case 0:
          return "utils/shoulders4.mp4";
        case 1:
          return "utils/shoulder1.mp4";
        case 2:
          return "utils/shoulder2.mp4";
        case 3:
          return "utils/shoulders3.mp4";
      }
      break;
  }

  return "";
}

class _VideoDetailsState extends State<VideoDetails>
    with TickerProviderStateMixin {
  List training_info = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/training_videos.json")
        .then((value) {
      training_info = jsonDecode(value);
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  String getImage(String title, int index) {
    switch (title)
    {
      case "Cvičenie nôh":
        switch (index)
        {
          case 0:
            return "utils/legs1.png";
          case 1:
            return "utils/legs2.png";
          case 2:
            return "utils/legs3.png";
          case 3:
            return "utils/legs4.png";
        }
        break;
      case "Cvičenie brucha":
        switch (index)
        {
          case 0:
            return "utils/turtlereaches.png";
          case 1:
            return "utils/test2.png";
          case 2:
            return "utils/test3.png";
          case 3:
            return "utils/test4.png";
        }
        break;
      case "Cvičenie rúk":
        switch (index)
        {
          case 0:
            return "utils/test1.png";
          case 1:
            return "utils/test2.png";
          case 2:
            return "utils/test3.png";
          case 3:
            return "utils/test4.png";
        }
        break;
      case "Cvičenie ramien":
        switch (index)
        {
          case 0:
            return "utils/shoulder1.png";
          case 1:
            return "utils/shoulder2.png";
          case 2:
            return "utils/shoulder3.png";
          case 3:
            return "utils/shoulder4.png";
        }
        break;
    }

    return "";
  }

  String getDescription(String title, int index) {
    switch (title)
    {
      case "Cvičenie nôh":
        switch (index)
        {
          case 0:
            return "Popis pre cvik na nohy";
          case 1:
            return "Popis pre cvik na nohy";
          case 2:
            return "Popis pre cvik na nohy";
          case 3:
            return "Popis pre cvik na nohy";
          case 4:
            return "Popis pre cvik na nohy";
          case 5:
            return "Popis pre cvik na nohy";
        }
        break;
      case "Cvičenie brucha":
        switch (index)
        {
          case 0:
            return "Popis pre cvik na brucho";
          case 1:
            return "Popis pre cvik na brucho";
          case 2:
            return "Popis pre cvik na brucho";
          case 3:
            return "Popis pre cvik na brucho";
        }
        break;
      case "Cvičenie rúk":
        switch (index)
        {
          case 0:
            return "Popis pre cvik na ruky";
          case 1:
            return "Popis pre cvik na ruky";
          case 2:
            return "Popis pre cvik na ruky";
          case 3:
            return "Popis pre cvik na ruky";
        }
        break;
      case "Cvičenie ramien":
        switch (index)
        {
          case 0:
            return "Popis pre cvik na ramená";
          case 1:
            return "Popis pre cvik na ramená";
          case 2:
            return "Popis pre cvik na ramená";
          case 3:
            return "Popis pre cvik na ramená";
        }
        break;
    }

    return "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepOrange.withOpacity(0.7),
            Colors.amberAccent.withOpacity(0.8)
          ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight)),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
              width: MediaQuery.of(context).size.width,
              height: 30.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(() => HomePage(
                                ));
                          },
                          child: Icon(Icons.arrow_back_ios,
                              size: 20,
                              color: UtilColors.AppColor.secondPageIconColor)),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Colors.deepOrange.withOpacity(0.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Text(widget.detailsTitle.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          color: UtilColors.AppColor.secondPageTitleColor)),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.deepOrange.withOpacity(0.2),
                                  Colors.amberAccent
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: UtilColors.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("60 min",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: UtilColors
                                        .AppColor.secondPageIconColor))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 0,
                      ),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 70, left: 20),
                        width: 40,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.deepOrange.withOpacity(0.2),
                                  Colors.amberAccent
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wallet_membership,
                              size: 20,
                              color: UtilColors.AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Začiatočník",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: UtilColors
                                        .AppColor.secondPageIconColor))
                          ],
                        ),
                      ))
                    ],
                  ),
                ],
              ),
            ),
            //Expanded(
            /* child:*/
            Expanded(
              child: Container(
                    //height: MediaQuery.of(context).size.height - 370,
                    //width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        buildCardWithImage(
                            getName(widget.detailsTitle.toString(), 0),
                            getImage(widget.detailsTitle.toString(), 0),
                            getDescription(widget.detailsTitle.toString(), 0),
                            widget,
                            0,
                            context),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithImage(
                            getName(widget.detailsTitle.toString(), 1),
                            getImage(widget.detailsTitle.toString(), 1),
                            getDescription(widget.detailsTitle.toString(), 1),
                            widget,
                            1,
                            context),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithImage(
                            getName(widget.detailsTitle.toString(), 2),
                            getImage(widget.detailsTitle.toString(), 2),
                            getDescription(widget.detailsTitle.toString(), 2),
                            widget,
                            2,
                            context),
                        SizedBox(
                          width: 12,
                        ),
                        buildCardWithImage(
                            getName(widget.detailsTitle.toString(), 3),
                            getImage(widget.detailsTitle.toString(), 3),
                            getDescription(widget.detailsTitle.toString(), 3),
                            widget,
                            3,
                            context),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    )),
            ),
              /*Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text("1. Okruh: Nohy",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: UtilColors.AppColor.circuitsColor)),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: Colors.deepOrange.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("3 sady",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: UtilColors.AppColor.setsColor))
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: training_info.length,
                            itemBuilder: (_, int index) {
                              return GestureDetector(
                                onTap: () {
                                  debugPrint(index.toString());
                                },
                                child: Container(
                                  height: 135,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        training_info[index]
                                                            ["thumbnail"]))),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                training_info[index]["title"],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 3),
                                                  child: Text(
                                                    training_info[index]
                                                        ["time"],
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[500]),
                                                  ))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ),*/

          ])),
    );
  }
}
int add = 0;
Widget buildCardWithImage(
        String title, String image_path, String description, VideoDetails widget, int index, BuildContext context) =>
    InkWell(
      onTap: () {
        switch (widget.detailsTitle.toString()) {
          case "Cvičenie nôh":
            switch (index)
            {
              case 0:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie nôh", index),
                    VideoPath: getVideo("Cvičenie nôh", index),
                ));
                break;
              case 1:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie nôh", index),
                    VideoPath: getVideo("Cvičenie nôh", index),
                ));
                break;
              case 2:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie nôh", index),
                    VideoPath: getVideo("Cvičenie nôh", index),
                ));
                break;
              case 3:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie nôh", index),
                   VideoPath: getVideo("Cvičenie nôh", index),
                ));
                break;
            }
            break;
          case "Cvičenie brucha":
            switch (index)
            {
              case 0:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie brucha", index),
                    VideoPath: getVideo("Cvičenie brucha", index),
                ));
                break;
              case 1:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie brucha", index),
                    VideoPath: getVideo("Cvičenie brucha", index),
                ));
                break;
              case 2:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie brucha", index),
                    VideoPath: getVideo("Cvičenie brucha", index),
                ));
                break;
              case 3:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie brucha", index),
                    VideoPath: getVideo("Cvičenie brucha", index),
                ));
                break;
            }
            break;
          case "Cvičenie rúk":
            switch (index)
            {
              case 0:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie rúk", index),
                    VideoPath: getVideo("Cvičenie rúk", index),
                ));
                break;
              case 1:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie rúk", index),
                    VideoPath: getVideo("Cvičenie rúk", index),
                ));
                break;
              case 2:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie rúk", index),
                    VideoPath: getVideo("Cvičenie rúk", index),
                ));
                break;
              case 3:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie rúk", index),
                    VideoPath: getVideo("Cvičenie rúk", index),
                ));
                break;
            }
            break;
          case "Cvičenie ramien":
            switch (index)
            {
              case 0:
                add = 5;
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie ramien", index),
                    VideoPath: getVideo("Cvičenie ramien", index),
                ));
                break;
              case 1:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie ramien", index),
                    VideoPath: getVideo("Cvičenie ramien", index),
                ));
                break;
              case 2:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie ramien", index),
                    VideoPath: getVideo("Cvičenie ramien", index),
                ));
                break;
              case 3:
                Get.to(() => VideoPlayer(
                    beforeTitle: widget.detailsTitle.toString(),
                    Title: getName("Cvičenie ramien", index),
                    VideoPath: getVideo("Cvičenie ramien", index),
                ));
                break;
            }
            break;
          default:
            debugPrint("[fitspace error] video sa nedá načítať");
            break;
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.only(bottom: 13.h,left: 2),
        decoration: BoxDecoration(
          color: Color(0xFFF2F3F8),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20 / (MediaQuery.of(context).size.height) * MediaQuery.of(context).size.height,
            ),
            Padding(padding: EdgeInsets.only(bottom: image_path == "utils/legs4.png" ? 0:0,left: image_path == "utils/legs4.png" ? 6.h:6.h, right: image_path == "utils/legs4.png" ? 5.h:7.h),child: Image.asset(image_path, scale: 330 / MediaQuery.of(context).size.width)),
            SizedBox(
              height: AdaptiveTextSize().getadaptiveTextSize(context, 40),
            ),
            Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Text(title,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 20), fontWeight: FontWeight.bold))),
            SizedBox(
              height: AdaptiveTextSize().getadaptiveTextSize(context, 18),
            ),
            Padding(
                padding: EdgeInsets.only(left: 1.5.h),
                child: Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 16),
                        fontWeight: FontWeight.normal,
                        color: Colors.black54))),
            Padding(
                padding: EdgeInsets.only(top: 20, left: 30 / (MediaQuery.of(context).size.width - 40) * MediaQuery.of(context).size.width, right: 20 / (MediaQuery.of(context).size.width - 40) * MediaQuery.of(context).size.width),
                child: Row(
                  children: [
                    Icon(Icons.timer_outlined,
                        size: AdaptiveTextSize().getadaptiveTextSize(context, 30),
                        color: Colors.deepOrangeAccent.withOpacity(0.7)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("60 minút", style: TextStyle(
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                    ),),
                    Expanded(child: Container()),
                    Icon(Icons.loop,
                        size: AdaptiveTextSize().getadaptiveTextSize(context, 30),
                        color: Colors.deepOrangeAccent.withOpacity(0.7)),
                    SizedBox(
                      width: 5,
                    ),
                    Text("3 opakovania", style: TextStyle(
                      fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 15),
                    ),),
                  ],
                )),
            Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 130 / (MediaQuery.of(context).size.width - 40) * MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Colors.amberAccent,
                              Colors.deepOrange.withOpacity(0.5)
                            ])),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 35,
                            ),
                            Icon(Icons.play_arrow, size: 30, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Spustiť",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
          ],
        ),
      ),
    );

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}