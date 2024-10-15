import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.audioPlayer,
    this.isLeftRight = true,
  });
  final AudioPlayer audioPlayer;
  final bool isLeftRight;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshots) {
              final playerState = snapshots.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (!(playing ?? false)) {
                return InkWell(
                    onTap: audioPlayer.play,
                    // iconSize: 52.w,
                    child: Container(
                      height: 52,
                      width: 52,
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8180C2),
                              Color(0xff000086),
                            ],
                          )),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ));
              } else if (processingState != ProcessingState.completed) {
                return InkWell(
                    onTap: audioPlayer.pause,
                    // iconSize: 52.w,
                    child: Container(
                      height: 52,
                      width: 52,
                      margin: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8180C2),
                              Color(0xff000086),
                            ],
                          )),
                      child: const Icon(
                        Icons.pause_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ));
              } else {
                return Container(
                  height: 52,
                  width: 52,
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff8180C2),
                          Color(0xff000086),
                        ],
                      )),
                  child: const Icon(
                    size: 52,
                    Icons.play_circle_filled_rounded,
                    color: Colors.white,
                  ),
                );
              }
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(
              visible: isLeftRight,
              child: IconButton(
                // onPressed: audioPlayer.seekToNext,
                onPressed: () async {
                  final currentPosition = audioPlayer.position;
                  final newPosition =
                      currentPosition - const Duration(seconds: 10);
                  audioPlayer.seek(newPosition > Duration.zero
                      ? newPosition
                      : Duration.zero);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(52, 52),
                  shape: const CircleBorder(),
                ),
                icon: SvgPicture.asset("assets/svgs/skip.svg"),
              ),
            ),
            Visibility(
              visible: isLeftRight,
              child: IconButton(
                // onPressed: audioPlayer.seekToPrevious,
                onPressed: () async {
                  final currentPosition = audioPlayer.position;
                  final duration = audioPlayer.duration ?? Duration.zero;
                  final newPosition =
                      currentPosition + const Duration(seconds: 10);
                  // Seek to the new position, but ensure it doesn't exceed the total duration
                  audioPlayer
                      .seek(newPosition < duration ? newPosition : duration);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(52, 52),
                  shape: const CircleBorder(),
                ),
                icon: SvgPicture.asset("assets/svgs/skip.svg"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
