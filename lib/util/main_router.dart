import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/feature/home/menu/allocation_table_screen.dart';
import 'package:rotary_flutter/feature/home/menu/criterion_screen.dart';
import 'package:rotary_flutter/feature/home/menu/introduce_foundation_screen.dart';
import 'package:rotary_flutter/feature/home/menu/notice_screen.dart';
import 'package:rotary_flutter/feature/home/menu/organization_screen.dart';
import 'package:rotary_flutter/feature/home/menu/policy_screen.dart';
import 'package:rotary_flutter/feature/home/menu/president_record_screen.dart';
import 'package:rotary_flutter/feature/home/menu/president_screen.dart';
import 'package:rotary_flutter/feature/home/menu/programing_table_screen.dart';
import 'package:rotary_flutter/feature/home/menu/rotary_korea_screen.dart';

import '../feature/home/menu/gallery_screen.dart';
import '../feature/home/menu/k_rotary_screen.dart';
import '../feature/home_screen.dart';

final List<GoRoute> mainRouter = [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'menu',
          builder: (_,$)=>HomeScreen(),
          routes: [
            GoRoute(
                path: 'president',
                builder: (_,$)=> PresidentScreen()
            ),
            GoRoute(
                path: 'policy',
                builder: (_,$)=> PolicyScreen()
            ),
            GoRoute(
                path: 'record',
                builder: (_,$)=> PresidentRecordScreen()
            ),
            GoRoute(
                path: 'organization',
                builder: (_,$)=> OrganizationScreen()
            ),
            GoRoute(
                path: 'allocation',
                builder: (_,$)=> AllocationTableScreen()
            ),
            GoRoute(
                path: 'programing',
                builder: (_,$)=> ProgramingTableScreen()
            ),
            GoRoute(
                path: 'criterion',
                builder: (_,$)=> CriterionScreen()
            ),
            GoRoute(
                path: 'rotaryKorea',
                builder: (_,$)=> RotaryKoreaScreen()
            ),
            GoRoute(
                path: 'kRotaryKorea',
                builder: (_,$)=> KRotaryKoreaScreen()
            ),
            GoRoute(
                path: 'notice',
                builder: (_,$)=> NoticeScreen()
            ),
            GoRoute(
                path: 'introduce_foundation',
                builder: (_,$)=> IntroduceFoundationScreen()
            ),
            GoRoute(
                path: 'gallery',
                builder: (_,$)=> GalleryScreen()
            )
          ]
        ),
      ])
];
