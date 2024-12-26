import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rotary_flutter/data/model/article_model.dart';
import 'package:rotary_flutter/feature/announcement/Announcement_screen.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/util/global_color.dart';


class AnnouncementDetailScreen extends StatelessWidget {
  final Article board;

  const AnnouncementDetailScreen({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('공지사항'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            IndexThumbTitle(board.title),
            IndexText(board.content),
            SizedBox(
              height: 30,
            ),
            Divider(height: 0.5,thickness: 0.5,color: GlobalColor.greyFontColor,),
            SizedBox(height: 5,),
            IndexMinText('2023-02-24 업데이트',textColor: GlobalColor.greyFontColor,)
          ])),
        ));
  }
}
