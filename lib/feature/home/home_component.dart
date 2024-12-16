import 'package:flutter/cupertino.dart';

import '../../util/fontSize.dart';
import '../../util/global_color.dart';

class IndexText extends StatelessWidget {
  final String text;

  const IndexText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: DynamicFontSize.font24(context), color: GlobalColor.black),
    );
  }
}

class IndexTitle extends StatelessWidget {
  final String text;

  const IndexTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: DynamicFontSize.font24(context),
          color: GlobalColor.black,
          fontWeight: FontWeight.bold),
    );
  }
}
