import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class AllocationTableScreen extends ConsumerStatefulWidget {
  const AllocationTableScreen({super.key});

  @override
  ConsumerState<AllocationTableScreen> createState() => _AllocationTableScreen();
}

class _AllocationTableScreen extends ConsumerState<AllocationTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('배점표'),
          centerTitle: true,
        ),
        body: Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    child: PhotoView(
                      basePosition: Alignment.topCenter,
                      backgroundDecoration: BoxDecoration(color: GlobalColor.white),
                      minScale: PhotoViewComputedScale.contained,
                      gestureDetectorBehavior: HitTestBehavior.opaque,
                      maxScale: PhotoViewComputedScale.covered * 6.0,
                      imageProvider: AssetImage('asset/images/allocation_table_image.jpg'),
                    )));
  }
}
