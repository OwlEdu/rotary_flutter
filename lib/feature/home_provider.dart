import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final HomeProvider = ChangeNotifierProvider.autoDispose<HomeViewmodel>((ref) {
  return HomeViewmodel();
});

class HomeViewmodel with ChangeNotifier {
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;
  int setNavigationIndex(int index) => _navigationIndex = index;
}