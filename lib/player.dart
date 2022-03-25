import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halova_app/details.dart';
import 'package:halova_app/ui_elements/video_player_widget.dart';
import 'package:video_player/video_player.dart';
import 'util_colors.dart' as UtilColors;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, this.beforeTitle, this.Title, this.VideoPath, this.Time, this.Reps}) : super(key: key);

  final String? beforeTitle;
  final String? Title;
  final String? VideoPath;
  final int? Time;
  final int? Reps;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  late final VideoPlayerController controller;


  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.VideoPath.toString())
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((_) => controller.pause());
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPlaying = controller.value.isPlaying;


    return Scaffold(
      body: Column(
          children: [
         /*   Container(
              height: 100,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
              ),
              child:
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 30),
                    child: IconButton(onPressed: () => Get.to(VideoDetails(detailsTitle: widget.beforeTitle,)), icon: Icon(
                      Icons.arrow_back_ios,
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: (widget.beforeTitle?.length)! * 2),
                    child: Center(
                      child: Text(
                        widget.Title.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),*/
          Stack (
        children: [
          Padding( padding: EdgeInsets.only(top: 70), child: VideoPlayerWidget(controller: controller,)),
          Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
              ),
            child:
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 30),
                  child: IconButton(onPressed: () => Get.to(() => VideoDetails(detailsTitle: widget.beforeTitle,)), icon: Icon(
                    Icons.arrow_back_ios, size: 20,
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 57),
            child: Center(
              child: Text(
                widget.Title.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21,
                    color: Colors.black
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - 120),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.white
            ),
            child: Row(
              children: [
                SizedBox(width: 65,),
                Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Colors.orangeAccent,
                          ),
                          SizedBox(width: 5,),
                          Text(
                              ((controller.value.duration - controller.value.position).inMinutes.toString() + ":" + (controller.value.duration - controller.value.position).inSeconds.toString()),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                              )
                          ),

                        ]
                    ),
                  ),
                SizedBox(width: (MediaQuery.of(context).size.width) / 2 - 35 - 170,),
                if (controller != null)
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        gradient: LinearGradient(colors: [
                        Colors.deepOrange.withOpacity(0.7),
                        Colors.amberAccent.withOpacity(0.8)
                        ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight,),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          offset: Offset(5,7),
                          color: Colors.deepOrangeAccent.withOpacity(0.6)
                        )
                      ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(right: 0, bottom: 0),
                        child: IconButton(
                          color: Colors.white,
                          splashColor: Colors.yellowAccent,
                          splashRadius: 100,
                          iconSize: 45,
                          onPressed: () => isPlaying ? controller.pause() : controller.play(),
                          icon: Icon(
                            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          ),
                        ),
                      ),
                    ),
                SizedBox(width: 35,),
                Container(
                  height: 50,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                      children: [
                        Icon(
                          Icons.loop,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 5,),
                        Text("30x",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            )
                        ),

                      ]
                  ),
                ),
              ],
            )
            ),
        ]
    ),
      ]
      ),
    );
  }
}
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 70, left: 30),
                child: Row(children: [
                  InkWell(
                      onTap: () {
                        Get.to(() => VideoDetails(
                              detailsTitle: widget.beforeTitle.toString(),
                            ));
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.black)),
                ])),
            Container(
              margin: EdgeInsets.only(top: 100, right: 30),
              child: Image.asset("utils/test1.png"),
            ),
            SizedBox(
              height: 270,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  gradient: LinearGradient(
                      colors: [Colors.orangeAccent, Colors.amberAccent])),
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 165,
                        height: 150,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          color: Colors.deepOrange,
                          boxShadow: [
                            BoxShadow(blurRadius: 20, color: Colors.deepOrange)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 172, top: 52),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(4, 8),
                                  blurRadius: 10,
                                  color: Colors.amberAccent.withOpacity(0.2))
                            ]),
                        child: Icon(
                          Icons.play_arrow,
                          size: 45,
                          color: UtilColors.AppColor.secondPageIconColor,
                        ),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}*/
