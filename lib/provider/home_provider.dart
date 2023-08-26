import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/service/service.dart';

final homeProvider =
    ChangeNotifierProvider.autoDispose<HomeProvider>((ref) => HomeProvider(ref));

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.ref);

  final Ref ref;

  bool processing = true;
  List data = [];

  Future getAllPosts() async {
    debugPrint('getAllPosts');
    data =  await HttpService.instance.getAllPosts();
    processing = false;
    notifyListeners();
  }
}
