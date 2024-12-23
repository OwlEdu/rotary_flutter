import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/remoteData/account_remote_data.dart';
import '../../../util/model/state.dart';

final UserSearchListProvider = ChangeNotifierProvider.autoDispose<UserSearchListViewModel>((ref) {
  return UserSearchListViewModel();
});

class UserSearchListViewModel with ChangeNotifier {
  LoadState userListState = Loading();

  Future getAccountList() async {
    userListState = Loading();
    userListState = await AccountAPI().getAccount();
    notifyListeners();
  }
}