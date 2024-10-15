import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/state_provider.dart';
import 'stream_provider_view.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          int count = ref.watch(counterStateProvider);
          return Center(
            child: Text(
              "$count",
              style: const TextStyle(
                fontSize: 48,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(counterStateProvider.notifier).state++;
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
