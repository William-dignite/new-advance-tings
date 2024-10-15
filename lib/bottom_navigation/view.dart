import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/bottom_navigation/one.dart';
import 'package:riverpod_practice/bottom_navigation/three.dart';
import 'package:riverpod_practice/bottom_navigation/two.dart';

final bottomNavigation = StateProvider((ref) => 0);

class MyRiverpodScreen extends ConsumerWidget {
  const MyRiverpodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int whichScreen = ref.watch(bottomNavigation);
    return Scaffold(
      body: getSelectedWidget(index: whichScreen),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: whichScreen == 0 ? const Color(0xffF85E00) : Colors.grey,
            ),

            label: '',
            // backgroundColor:
          ),
          BottomNavigationBarItem(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.message,
                  color:
                      whichScreen == 1 ? const Color(0xffF85E00) : Colors.grey,
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.card_travel_rounded,
                  color:
                      whichScreen == 2 ? const Color(0xffF85E00) : Colors.grey,
                ),
              ],
            ),
            label: '',
          ),
        ],
        selectedFontSize: 0,
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: whichScreen,
        onTap: (index) {
          ref.read(bottomNavigation.notifier).state = index;
        },
      ),
    );
  }
}

Widget? getSelectedWidget({required int index}) {
  Widget? widget;

  switch (index) {
    case 0:
      widget = const OneView();
      break;
    case 1:
      widget = const TwoView();
      break;
    case 2:
      widget = const ThreeView();
    default:
  }
  return widget;
}
