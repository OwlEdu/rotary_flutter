import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlider();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlider() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if(_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn
        );
      }
      if(_currentPage == 1) {
        Timer(const Duration(milliseconds: 350), () {
          if(_pageController.hasClients) {
            _pageController.jumpToPage(0);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
      )
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'asset/images/main_logo.svg',
              height: height * 0.03,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.2,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Image.asset(
                  'asset/images/rotary_slide.png',
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  'asset/images/rotary_slide02.png',
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) =>
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                    ? Colors.blue
                    : Colors.grey
                ),
              )
            ),
          )
        ],
      ),
      endDrawer: Icon(Icons.menu)
    );
  }
}
