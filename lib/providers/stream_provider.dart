import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/repo/stream_user.dart';

final streamProvider = StreamProvider((ref) => makeStream());
