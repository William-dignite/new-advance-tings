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
                                // StreamBuilder(
                                //     stream: controller.player.sequenceStateStream,
                                //     builder: (context, snapshots) {
                                //       final state = snapshots.data;
                                //       if (state?.sequence.isEmpty ?? false) {
                                //         const Center(child: CircularProgressIndicator());
                                //       }
                                //       final MediaItem? metaData =
                                //           state?.currentSource?.tag as MediaItem?;
                                //       if (metaData != null) {
                                //         return MusicMetaDetaWidget(
                                //           songTitle: metaData.title.toString(),
                                //           songImage: metaData.artUri.toString(),
                                //           artistName: metaData.artist.toString(),
                                //           songDesc: metaData.displayDescription.toString(),
                                //         );
                                //       } else {
                                //         return const Center(
                                //             child: CircularProgressIndicator());
                                //       }
                                //     }),

                                // const Spacer(),
                                Transform(
                                  transform: Matrix4.identity()
                                    ..scale(-1.0, 1.0), // Flips horizontally
                                  alignment: Alignment.center,
                                  child: StreamBuilder(
                                      stream: controller.positionDataStream,
                                      builder: (context, snapshot) {
                                        final positionData = snapshot.data;

                                        return Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.identity()
                                            ..rotateZ(3.14),
                                          child: GestureDetector(
                                            onPanUpdate: (details) {
                                              // Get the size of the progress bar area (assuming 300 as width)
                                              double newPercent =
                                                  (details.localPosition.dx /
                                                          300)
                                                      .clamp(0.0, 1.0);

                                              // Calculate the new duration based on the percent
                                              final newDuration = Duration(
                                                milliseconds: ((positionData
                                                                ?.duration
                                                                .inMilliseconds ??
                                                            0) *
                                                        newPercent)
                                                    .toInt(),
                                              );

                                              controller.player
                                                  .seek(newDuration);
                                            },
                                            child: ArcProgressBar(
                                                strokeCap: StrokeCap.round,
                                                arcThickness:
                                                    3, // barHeight equivalent
                                                animationCurve: Curves.bounceIn,
                                                innerPadding: 20,
                                                animateFromLastPercent: true,
                                                handleSize:
                                                    30, // thumbRadius equivalent

                                                handleWidget: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: const Color(
                                                            0XFFD9D9D9),
                                                        width: 1,
                                                      )),
                                                  child: Container(
                                                    // child: ,
                                                    margin:
                                                        const EdgeInsets.all(4),
                                                    // height: 16,
                                                    // width: 16,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0xff8180C2),
                                                                Color(
                                                                    0xff000086),
                                                              ],
                                                            )),
                                                  ),
                                                ),
                                                centerWidget: Transform(
                                                  transform: Matrix4.identity()
                                                    ..rotateZ(3.14),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .height,
                                                      )
                                                          // const FlowerShapeWithBlur()
                                                          .paddingSymmetric(
                                                              horizontal: 25),
                                                    ),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    const Color(0xffFFFFFF)
                                                        .withOpacity(0.28),
                                                foregroundColor:
                                                    const Color(0xff000086),
                                                percentage: (positionData
                                                            ?.position
                                                            .inMilliseconds ??
                                                        0) /
                                                    (positionData?.duration
                                                            .inMilliseconds ??
                                                        1) *
                                                    100,
                                                bottomRightWidget:
                                                    Transform.rotate(
                                                  angle: 180 *
                                                      3.141592653589793238 /
                                                      180,
                                                  child: Transform.flip(
                                                    flipX: true,
                                                    child: Text(
                                                      positionData != null
                                                          ? getTimeString(
                                                              positionData
                                                                  .position)
                                                          : "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                            color: Colors.white,
                                                          ),
                                                    ).paddingOnly(right: 30),
                                                  ),
                                                ),
                                                bottomLeftWidget:
                                                    Transform.rotate(
                                                        angle: 180 *
                                                            3.141592653589793238 /
                                                            180,
                                                        child: Transform.flip(
                                                          flipX: true,
                                                          child: Text(
                                                            positionData != null
                                                                ? getTimeString(
                                                                    positionData
                                                                        .duration)
                                                                : "",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall
                                                                ?.copyWith(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                          ).paddingOnly(
                                                              left: 30),
                                                        ))),
                                          ),
                                        );
                                      }),
                                ),
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
/*
class InteractiveCurvedProgressBar extends StatefulWidget {
  final Duration progress;
  final Duration buffered;
  final Duration total;
  final Function(Duration) onSeek;

  InteractiveCurvedProgressBar({
    required this.progress,
    required this.buffered,
    required this.total,
    required this.onSeek,
  });

  @override
  _InteractiveCurvedProgressBarState createState() =>
      _InteractiveCurvedProgressBarState();
}

class _InteractiveCurvedProgressBarState
    extends State<InteractiveCurvedProgressBar> {
  double _currentProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _currentProgress = widget.progress.inSeconds / widget.total.inSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _currentProgress +=
              details.delta.dx / 300; // Adjust for your arc size
          _currentProgress = _currentProgress.clamp(0.0, 1.0); // Clamp to 0 - 1

          // Convert the progress back to a Duration and seek
          final newDuration = widget.total * _currentProgress;
          widget.onSeek(newDuration);
        });
      },
      child: CustomPaint(
        size: Size(300, 150),
        painter: CurvedProgressPainter(_currentProgress),
      ),
    );
  }
}

class CurvedProgressPainter extends CustomPainter {
  final double progress;

  CurvedProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint baseBarPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Paint progressBarPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    // Draw the background arc (base bar)
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 100),
      3.14, // Starting angle
      3.14, // Sweep angle (180 degrees)
      false,
      baseBarPaint,
    );

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 100),
      3.14, // Starting angle
      3.14 * progress, // Sweep angle proportional to progress
      false,
      progressBarPaint,
    );
  }

  @override
  bool shouldRepaint(CurvedProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
*/
