import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/remoteData/account_remote_data.dart';
import 'package:rotary_flutter/util/secure_storage.dart';

import '../../util/model/state.dart';

final MyInfoProvider =
    ChangeNotifierProvider.autoDispose<MyInfoViewModel>((ref) {
  return MyInfoViewModel();
});

class MyInfoViewModel with ChangeNotifier {
  LoadState accountState = Loading();

  Future getMyAccount() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      accountState = Loading();
      notifyListeners();

      var cellphone = await globalStorage.read(key: 'phone');

      accountState = await AccountAPI().getAccount(cellphone: cellphone);
      notifyListeners();
    });
  }
}
