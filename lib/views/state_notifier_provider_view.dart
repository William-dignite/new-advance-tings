import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/state_notifier_provider.dart';
import 'package:riverpod_practice/views/stream_provider_view.dart';

class StateNotifierCounterView extends ConsumerWidget {
  const StateNotifierCounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(counterStateNotifierProvider);
    return Scaffold(
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(
            fontSize: 48,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(counterStateNotifierProvider.notifier).increament();
      }),
      persistentFooterButtons: [
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const APiCallingRiverpod(),
        //         ),
        //       );
        //     },
        //     child: const Text("Future Provider Example")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StreamAPiCallingRiverpod(),
                ),
              );
            },
            child: const Text("Stream Provider Example")),
      ],
    );
  }
}
