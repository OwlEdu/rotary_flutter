import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/feature/announcement/announcement_screen.dart';
import 'package:rotary_flutter/feature/userSearch/user_search_screen.dart';

import '../../../util/global_color.dart';

class IndexScreen extends StatelessWidget {
  final String path;
  const IndexScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: Text(path),
        centerTitle: true,
      ),
      body: switch(path){
        '회원검색' => UserSearchScreen(),
        '공지사항' => AnnouncementScreen(),
      _ => UserSearchScreen()
      },
    );
  }
}
