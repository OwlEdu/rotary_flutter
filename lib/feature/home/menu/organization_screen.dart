import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class OrganizationScreen extends ConsumerStatefulWidget {
  const OrganizationScreen({super.key});

  @override
  ConsumerState<OrganizationScreen> createState() => _OrganizationScreen();
}

class _OrganizationScreen extends ConsumerState<OrganizationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('조직도'),
        ),
        body:Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              alignment: Alignment.topCenter,
                width: MediaQuery.of(context).size.width,
                child: PhotoView(
                  basePosition: Alignment.topCenter,
                    backgroundDecoration: BoxDecoration(color: GlobalColor.white),
                    minScale: PhotoViewComputedScale.contained,
                    gestureDetectorBehavior: HitTestBehavior.opaque,
                    maxScale: PhotoViewComputedScale.covered * 6.0,
                    imageProvider: NetworkImage(
                        'https://mmate.flash21.com/images/rotary/organization.jpg'),
                ))));
  }
}
