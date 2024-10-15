import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:just_audio_background/just_audio_background.dart';

class PositionData {
  PositionData(
      {required this.position,
      required this.bufferedPosition,
      required this.duration});
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class MusicPlayerViewModel extends GetxController {
  late AudioPlayer player;
  final playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
          Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/Shape%20of%20You%20-%20Ed%20Sheeran%20Karaoke%20No%20Guide%20Melody%20Instrumental.mp3?alt=media&token=cb7134fa-94bb-48ea-8f89-736fe5d45f6f'),
          tag: MediaItem(
            title: "Garden City",
            id: '0',
            artist: 'Thomas Austin',
            artUri: Uri.parse(
                'https://media.istockphoto.com/id/1417752495/photo/african-man-singing-and-gesturing-with-his-hands.jpg?s=612x612&w=0&k=20&c=xoM-DbaDB8_N6-yj2Qp46M8PSSjk9WC4RRkyRzLXDGg='),
            displayDescription:
                'Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada.',
          )),
      AudioSource.uri(
          Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/let-s-chat-8d8ea.appspot.com/o/See%20You%20Again%20ft.%20Charlie%20Puth%20-%20Wiz%20Khalifa%20Karaoke%20With%20Guide%20Melody%20Instrumental.mp3?alt=media&token=4f5f24d1-2879-45a6-9687-06a5d1b779fd'),
          tag: MediaItem(
            title: "Eden Town",
            id: '0',
            artist: 'Austin Shelby',
            artUri: Uri.parse(
                'https://images.unsplash.com/photo-1447789624106-34acdd381c18?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljJTIwYXJ0aXN0fGVufDB8fDB8fHww'),
            displayDescription:
                'Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada. Lorem ipsum dolor sit amet consectetur. Odio volutpat eu eu fermentum malesuada.',
          )),
    ],
  );
  letRock(url) async {
    player = AudioPlayer(); // Create a player
    await player.setLoopMode(LoopMode.all);
    await player.setAudioSource(playlist);
    // final duration = await player.setUrl(// Load a URL
    //     url);
    player.play();
  }

  bool isLike = false;
  void giveLike() {
    isLike = !isLike;
    update();
  }

  RxString? songImage; // = ''.obs;
  Stream<PositionData> get positionDataStream => CombineLatestStream.combine3(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
            position: position,
            bufferedPosition: bufferedPosition,
            duration: duration ?? const Duration()),
      );
  @override
  void onInit() {
    super.onInit();
    letRock(
      'https://hayatpr.000webhostapp.com/Cheap%20Thrills%20-%20Sia%20Karaoke%20%E3%80%90With%20Guide%20Melody%E3%80%91%20Instrumental.mp3',
    );
  }

  @override
  void onClose() {
    super.onClose();
    player.dispose();
  }
}

String getTimeString(Duration time) {
  final minutes = time.inMinutes.remainder(Duration.minutesPerHour).toString();
  final seconds = time.inSeconds
      .remainder(Duration.secondsPerMinute)
      .toString()
      .padLeft(2, '0');
  return time.inHours > 0
      ? "${time.inHours}:${minutes.padLeft(2, "0")}:$seconds"
      : "$minutes:$seconds";
}
