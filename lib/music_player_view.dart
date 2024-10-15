import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';
import 'package:arc_progress_bar_new/arc_progress_bar_new.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_practice/fadding_item_component.dart';
import 'package:riverpod_practice/music_actions.dart';
import 'package:riverpod_practice/music_player_controller.dart';

class MusicPlayerView extends StatefulWidget {
  const MusicPlayerView({super.key});

  @override
  State<MusicPlayerView> createState() => _MusicPlayerViewState();
}

class _MusicPlayerViewState extends State<MusicPlayerView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicPlayerViewModel>(
        init: MusicPlayerViewModel(),
        builder: (controller) {
          return Scaffold(
            // backgroundColor: Colors.black45,
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(

                        // "assets/images/music-main-bg.png"
                        "assets/images/music-main-cut-bg.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: ColoredBox(
                  color: const Color(0xff00000D).withOpacity(0.50),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                    top: 0,
                                    child:
                                        // Image.asset(
                                        //   "assets/images/music-bg1.png",
                                        // height:
                                        //     MediaQuery.sizeOf(context).height * 0.45,
                                        // width: MediaQuery.sizeOf(context).width,
                                        //   fit: BoxFit.cover,
                                        // ),

                                        Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.45,
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              "assets/images/music-bg1.png",
                                            )),
                                      ),
                                      alignment: Alignment.topCenter,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        width: 42,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.55,
                                    width: MediaQuery.sizeOf(context).width,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/music-bg2.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.55,
                                      width: MediaQuery.sizeOf(context).width,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xff00000D),
                                            // .withOpacity(0.0),
                                            const Color(0xff00000D)
                                                .withOpacity(0.81),
                                            const Color(0xff00000D)
                                                .withOpacity(0.0),
                                          ],
                                          // stops: const [
                                          //   0.0,
                                          //   1.9,
                                          //   100.0,
                                          // ],
                                          // begin: Alignment.topCenter,
                                          // end: Alignment.bottomCenter,
                                          begin: const Alignment(0.00, 1.00),
                                          end: const Alignment(0, -1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        // blendMode: BlendMode.,
                                        child: const Placeholder(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StreamBuilder(
                                    stream: controller.positionDataStream,
                                    builder: (context, snapshot) {
                                      final positionData = snapshot.data;

                                      // Calculate percentage from 0 to 100
                                      final percentage = (positionData?.duration
                                                      .inMilliseconds ??
                                                  0.0) >
                                              0
                                          ? ((positionData?.position
                                                          .inMilliseconds ??
                                                      0.0) /
                                                  (positionData?.duration
                                                          .inMilliseconds ??
                                                      0.0) *
                                                  100)
                                              .clamp(0.0, 100.0)
                                          : 0.0; // Default to 0 if no duration

                                      return ColoredBox(
                                        color: Colors.black,
                                        child: ArcProgressBar(
                                            strokeCap: StrokeCap.round,
                                            arcThickness: 3,
                                            animationCurve: Curves.bounceIn,
                                            innerPadding:
                                                MediaQuery.sizeOf(context)
                                                        .width *
                                                    0.03,
                                            animateFromLastPercent: false,
                                            animationDuration: Duration.zero,
                                            handleSize: 30,
                                            percentage: percentage,
                                            handleWidget: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color:
                                                        const Color(0XFFD9D9D9),
                                                    width: 1,
                                                  )),
                                              child: GestureDetector(
                                                onPanUpdate: (details) {
                                                  // Center point calculation
                                                  log("----details----$details-------");
                                                  final width =
                                                      context.size!.width;

                                                  // Calculate the new position as a ratio of the drag distance to the width
                                                  final newRatio = (details
                                                              .localPosition
                                                              .dx /
                                                          width)
                                                      .clamp(0.0, 1.0);

                                                  // Calculate the new position in milliseconds
                                                  final newPositionMilliseconds =
                                                      (newRatio *
                                                              positionData!
                                                                  .duration
                                                                  .inMilliseconds)
                                                          .round();
                                                  final newPosition = Duration(
                                                      milliseconds:
                                                          newPositionMilliseconds);

                                                  controller.player
                                                      .seek(newPosition);
                                                },
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Color(0xff8180C2),
                                                              Color(0xff000086),
                                                            ],
                                                          )),
                                                ),
                                              ),
                                            ),
                                            centerWidget: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 25),
                                              child: ColoredBox(
                                                color: Colors.transparent,
                                                child: Image.asset(
                                                  "assets/images/flower.png",
                                                  fit: BoxFit.fill,
                                                  width: double.infinity,
                                                  color: Colors.white,
                                                  // .withOpacity(0.100),
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                          .height,
                                                )
                                                    // const FlowerShapeWithBlur()
                                                    .paddingSymmetric(
                                                        horizontal: 25),
                                              ),
                                            ),
                                            backgroundColor:
                                                const Color(0xffFFFFFF)
                                                    .withOpacity(0.28),
                                            foregroundColor:
                                                const Color(0xff000086),
                                            bottomRightWidget: Text(
                                              positionData != null
                                                  ? getTimeString(
                                                      positionData.position)
                                                  : "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ).paddingOnly(right: 30),
                                            bottomLeftWidget: Text(
                                              positionData != null
                                                  ? getTimeString(
                                                      positionData.duration)
                                                  : "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ).paddingOnly(left: 30)),
                                      );
                                    }),
                                const Text(
                                  "Anxiety Release",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 19),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff000086),
                                        Color(0xff8180C2),
                                      ],
                                      stops: [0, 100],
                                      begin: Alignment(-3, -2),
                                      end: Alignment(3, 2),
                                    ),
                                  ),
                                  child: const Text(
                                    "Stress Relief",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const SizedBox(
                                  height: 76,
                                  width: 228,
                                  child: FadingTextItem(
                                    childToShade: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Positioned(
                              bottom: -88.33333333333333,
                              right: -124,
                              child: Container(
                                  height: 265,
                                  width: 265,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.13),
                                        width: 1,
                                      ))),
                            ),
                            Positioned(
                              bottom: -88.33333333333333,
                              left: -124,
                              child: Container(
                                  height: 265,
                                  width: 265,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.13),
                                        width: 1,
                                      ))),
                            ),
                            Positioned(
                              bottom: -145,
                              child: Container(
                                  height: 265,
                                  width: 265,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.28),
                                        width: 1,
                                      ))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Controls(audioPlayer: controller.player)
                .paddingOnly(bottom: 40),
          );
        });
  }
}
