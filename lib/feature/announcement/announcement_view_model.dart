import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/remoteData/article_remote_data.dart';

import '../../util/model/state.dart';

final AnnouncementProvider =
    ChangeNotifierProvider.autoDispose<AnnouncementViewModel>((ref) {
  return AnnouncementViewModel();
});

class AnnouncementViewModel with ChangeNotifier {
  LoadState announcementState = Loading();

  Future getArticle() async {
      announcementState = await ArticleAPI().getArticle(id: 12);
      notifyListeners();
  }
}
