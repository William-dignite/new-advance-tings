import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:riverpod_practice/music_player_view.dart';

void main() async {
  // await JustAudioBackground.init(
  //   androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
  //   androidNotificationChannelName: 'Audio playback',
  //   androidNotificationOngoing: true,
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return
    // ScreenUtilInit(
    //   designSize: const Size(375, 812),
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    //   builder: (_, child) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        title: 'The Perfect Boat',
        theme: ThemeData(
          fontFamily: GoogleFonts.manrope().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MusicPlayerView(),
      ),
    );
    //   },
    // );
    //  MaterialApp(
    //   title: 'Flutter Demo',

    //   home: Builder(
    //     builder: (context) {
    //       // Initialize ScreenUtil with the appropriate context
    //       ScreenUtil.init(
    //         context,
    //         designSize:
    //             const Size(360, 690), // Adjust design size as per your design
    //         minTextAdapt: true,
    //         splitScreenMode: true,
    //       );
    //       return const MusicPlayerView();
    //     },
    //   ),
    // );
  }
}
