import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class CriterionScreen extends ConsumerStatefulWidget {
  const CriterionScreen({super.key});

  @override
  ConsumerState<CriterionScreen> createState() => _CriterionScreen();
}

class _CriterionScreen extends ConsumerState<CriterionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('표창기준'),
          centerTitle: true,
        ),
        body:Container(
                width: MediaQuery.of(context).size.width,
                height: 1200,
                alignment: Alignment.topCenter,
                child: PhotoView(
                  basePosition: Alignment.topCenter,
                    backgroundDecoration: BoxDecoration(color: GlobalColor.white),
                    minScale: PhotoViewComputedScale.contained,
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                    maxScale: PhotoViewComputedScale.covered * 6.0,
                    imageProvider: NetworkImage(
                        'https://mmate.flash21.com/images/rotary/criterion.jpg'),
                )));
  }
}
