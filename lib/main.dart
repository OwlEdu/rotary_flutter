import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:rotary_flutter/util/main_router.dart';

import 'feature/home/home_main_screen.dart';
import 'feature/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: MyApp())); // MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: GlobalColor.white
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        routes: [...mainRouter],
        builder: (context, state) => HomeScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'rotary',
      theme: ThemeData(
        primaryColor: GlobalColor.primaryColor,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          elevation: 0.0,
          backgroundColor: GlobalColor.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: GlobalColor.primaryColor),
        useMaterial3: false,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(1.0),
        ),
        child: child!,
      ),
    );
  }
}
