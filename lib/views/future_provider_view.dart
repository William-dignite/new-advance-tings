import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/future_provider.dart';

class APiCallingRiverpod extends ConsumerWidget {
  const APiCallingRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(futureProvider).when(
            data: (data) => Center(child: Text(data)),
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
