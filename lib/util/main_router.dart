import 'package:go_router/go_router.dart';

import '../feature/home_screen.dart';

final List<GoRoute> mainRouter = [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
      routes: [

      ])
];
