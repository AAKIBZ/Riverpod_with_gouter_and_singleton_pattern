import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyProvider = ChangeNotifierProvider.autoDispose<BodyProvider>(
    (ref) => BodyProvider(ref));

class BodyProvider extends ChangeNotifier {
  /// sample provider for body class e,g if we want some api calls based on the data that we passed from the first screen
  /// we can do that here
  BodyProvider(this.ref);

  final Ref ref;

  var data = '';
}
