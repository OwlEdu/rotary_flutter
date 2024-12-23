import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/remoteData/board_remote_data.dart';

import '../../util/model/state.dart';

final AnnouncementProvider =
    ChangeNotifierProvider.autoDispose<AnnouncementViewModel>((ref) {
  return AnnouncementViewModel();
});

class AnnouncementViewModel with ChangeNotifier {
  LoadState announcementState = Loading();

  Future getBoard() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      announcementState = Loading();
      notifyListeners();
      announcementState = await BoardAPI().getBoard(id: 8);
      notifyListeners();
    });
  }
}
