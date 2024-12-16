import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class ProgramingTableScreen extends ConsumerStatefulWidget {
  const ProgramingTableScreen({super.key});

  @override
  ConsumerState<ProgramingTableScreen> createState() => _ProgramingTableScreen();
}

class _ProgramingTableScreen extends ConsumerState<ProgramingTableScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('편성표'),
          centerTitle: true,
        ),
        body:Container(
                alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: PhotoView(
                  basePosition: Alignment.topCenter,
                    backgroundDecoration: BoxDecoration(color: GlobalColor.white),
                    minScale: PhotoViewComputedScale.contained,
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                    maxScale: PhotoViewComputedScale.covered * 6.0,
                    imageProvider: NetworkImage('https://mmate.flash21.com/images/rotary/programming_table.jpg'),
                )));
  }
}
