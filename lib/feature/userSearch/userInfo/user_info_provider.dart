import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/remoteData/account_remote_data.dart';
import '../../../util/model/state.dart';

final UserInfoProvider = ChangeNotifierProvider.autoDispose<UserInfoViewModel>((ref) {
  return UserInfoViewModel();
});

class UserInfoViewModel with ChangeNotifier {
  LoadState userInfoState = Loading();

  Future getUserInfo(int id) async {
    userInfoState = Loading();
    userInfoState = await AccountAPI().getAccount(id: id);
    notifyListeners();
  }
}