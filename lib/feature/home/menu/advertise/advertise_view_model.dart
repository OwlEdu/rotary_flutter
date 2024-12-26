import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/model/article_model.dart';
import 'package:rotary_flutter/data/remoteData/article_remote_data.dart';

import '../../../../util/model/state.dart';

final AdvertiseProvider = ChangeNotifierProvider.autoDispose<AdvertiseViewModel>((ref) {
  return AdvertiseViewModel();
});

class AdvertiseViewModel with ChangeNotifier {
  LoadState advertiseState = Loading();

  void getAdvertise()async {
    advertiseState = await ArticleAPI().getArticle(id: 13);
    notifyListeners();
  }
}