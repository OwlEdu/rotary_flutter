import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/util/model/state.dart';

final HomeProvider = ChangeNotifierProvider.autoDispose<HomeViewmodel>((ref) {
  return HomeViewmodel();
});

class HomeViewmodel with ChangeNotifier {
  int _navigationIndex = 0;
  int get navigationIndex => _navigationIndex;
  int setNavigationIndex(int index) => _navigationIndex = index;

  LoadState phoneState = Loading();

  void postPhone(String phone) async{
    phoneState  = Loading();
    notifyListeners();

    phoneState = Success(null);
    notifyListeners();
  }

  LoadState authenticateState = Loading();

  void postAuthenticate(String phone) async{
    authenticateState  = Loading();
    notifyListeners();

    authenticateState = Success(null);
    notifyListeners();
  }


}