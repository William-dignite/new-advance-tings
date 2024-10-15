import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/repo/fetch_user.dart';

final futureProvider = FutureProvider.autoDispose((ref) => fetchUser());
