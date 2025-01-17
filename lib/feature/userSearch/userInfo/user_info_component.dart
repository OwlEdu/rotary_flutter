import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/util/global_color.dart';

class UserInfoIndex extends StatelessWidget {
  final String assetName;
  final String indexName;
  final String? index;

  const UserInfoIndex(
      {super.key,
      required this.assetName,
      required this.indexName,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                SvgPicture.asset(assetName),
                SizedBox(width: 5,),
                IndexTitle(indexName)],
            )),
            Expanded(child: IndexText(index ?? ''))
          ],
        ));
  }
}
