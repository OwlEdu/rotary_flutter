import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/feature/home/menu/allocation_table_screen.dart';
import 'package:rotary_flutter/feature/home/menu/criterion_screen.dart';
import 'package:rotary_flutter/feature/home/menu/organization_screen.dart';
import 'package:rotary_flutter/feature/home/menu/policy_screen.dart';
import 'package:rotary_flutter/feature/home/menu/president_record_screen.dart';
import 'package:rotary_flutter/feature/home/menu/president_screen.dart';
import 'package:rotary_flutter/feature/home/menu/programing_table_screen.dart';
import 'package:rotary_flutter/feature/home/menu/rotary_korea_screen.dart';
import '../feature/announcement/Announcement_screen.dart';
import '../feature/home/menu/advertise_screen.dart';
import '../feature/home/menu/event_screen.dart';
import '../feature/home/menu/gallery_screen.dart';
import '../feature/home/menu/homepage_screen.dart';
import '../feature/home/menu/index_screen.dart';
import '../feature/home/menu/introduce_foundation_screen.dart';
import '../feature/home/menu/k_rotary_screen.dart';
import '../feature/home/menu/magazine_screen.dart';
import '../feature/home/menu/president_birth_screen.dart';
import '../feature/home/menu/userInfo/user_info_screen.dart';
import '../feature/home_screen.dart';
import '../feature/userSearch/user_search_screen.dart';

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
                path: 'announcement',
                builder: (_,$)=> AnnouncementScreen()
            ),
              GoRoute(
                  path: 'presidentBirth',
                  builder: (_,$)=> PresidentBirthScreen()
              ),
            GoRoute(
                path: 'advertise',
                builder: (_,$)=> AdvertiseScreen()
            ),
            GoRoute(
                path: 'event',
                builder: (_,$)=> EventScreen()
            ),
            GoRoute(
                path: 'userInfo',
                builder: (_,$)=> UserInfoScreen()
            ),
            GoRoute(
                path: 'userSearch',
                builder: (_,$)=> UserSearchScreen()
            ),
              GoRoute(
                  path: 'index/:path',
                  builder: (context, state) {
                      final String path = state.pathParameters['path'] ?? '';
                      return IndexScreen(path: path);
                  }
            ),
            GoRoute(
                path: 'introduce_foundation',
                builder: (_,$)=> IntroduceFoundationScreen()
            ),
            GoRoute(
                path: 'gallery',
                builder: (_,$)=> GalleryScreen()
            ),
            GoRoute(
                path: 'magazine',
                builder: (_,$)=> MagazineScreen()
            ),
            GoRoute(
                path: 'homePage',
                builder: (_,$)=> HomepageScreen()
            )
          ]
        ),
      ])
];
