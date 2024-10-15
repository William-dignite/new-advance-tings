import 'dart:async';

Stream<int> makeStream() {
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (timer) => timer,
  ).take(10);
}
