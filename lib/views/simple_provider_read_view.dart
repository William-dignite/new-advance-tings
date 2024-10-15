import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/providers/read_provider.dart';

class FirstRiverpodView extends ConsumerWidget {
  const FirstRiverpodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String ourData = ref.read<String>(stringProvider);
    return Scaffold(
      body: Center(
        child: Text(
          ourData,
          style: const TextStyle(
            fontSize: 48,
          ),
        ),
      ),
    );
  }
}
