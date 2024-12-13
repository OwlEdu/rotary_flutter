import 'package:flutter/material.dart';

class searchConstants {
  static const int totalMembers = 12;
  static const String count = '58명';
  static const String leaderCount = '58명';
  static const String MemberCount = '150명';
}

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Row(
          children: [
            Image.asset(
              'asset/images/main_logo02.png',
              width: maxWidth * 0.1,
              height: maxWidth * 0.1,
            ),
            SizedBox(width: maxWidth * 0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

            )
          ],
        );
      },
    );
  }
}
