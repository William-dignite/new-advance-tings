import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/stream_provider.dart';

class StreamAPiCallingRiverpod extends ConsumerWidget {
  const StreamAPiCallingRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(streamProvider).when(
            data: (data) => Center(child: Text(data.toString())),
            error: (error, stackTrace) => Center(
                child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.red),
            )),
            loading: () => const Center(
              child: LinearProgressIndicator(
                color: Colors.indigo,
              ),
            ),
          ),
    );
  }
}
