import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class searchConstants {
  static const int totalMembers = 12;
  static const String count = '58명';
  static const String leaderCount = '58명';
  static const String memberCount = '150명';
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
              width: maxWidth * 0.3,
              height: maxWidth * 0.3,
            ),
            SizedBox(width: maxWidth * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '로타리 3700지구',
                  style: TextStyle(
                    fontSize: maxWidth * 0.045,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '전체인원  ${searchConstants.memberCount}',
                  style: TextStyle(
                    fontSize: maxWidth * 0.035,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}

class SearchSectionItem extends StatelessWidget {
  final String title;
  final String count;
  final VoidCallback? onTap;

  const SearchSectionItem({
    super.key,
    required this.title,
    required this.count,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.08, vertical: maxWidth * 0.03),
              child: Image.asset(
                'asset/images/main_logo03.png',
                width: maxWidth * 0.08,
                height: maxWidth * 0.08,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: DynamicFontSize.font18(context)
              ),
            ),
            SizedBox(width: maxWidth * 0.02),
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: DynamicFontSize.font14(context)
              )
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: maxWidth * 0.01,
                  horizontal: maxWidth * 0.02
                ),
                decoration: BoxDecoration(
                  color: GlobalColor.primaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '전체보기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: maxWidth * 0.035
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LocationButton extends StatelessWidget {
  final int number;
  final VoidCallback? onTap;

  const LocationButton({
    super.key,
    required this.number,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/main_logo03.png',
                width: maxWidth * 0.3,
                height: maxWidth * 0.3,
              ),
              SizedBox(height: maxWidth * 0.08),
              Text(
                '${number}지역',
                style: TextStyle(
                  fontSize: maxWidth * 0.14,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


