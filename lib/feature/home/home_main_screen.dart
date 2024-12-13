import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rotary_flutter/util/global_color.dart';

import '../../constants/menu_items.dart';

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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async{
      if(_pageController.hasClients) {
        if(_currentPage == 1) {
          await _pageController.animateToPage(
            _currentPage+1,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn
          );
          _pageController.jumpToPage(0);
        } else {
          await _pageController.animateToPage(
            _currentPage+1,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn
          );
        }
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
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline)
            )
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
          SizedBox(height: height * 0.035),
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
          ),
          SizedBox(height: height * 0.05),
          Expanded(
            child: Container(
              color: GlobalColor.primaryColor,
              child: GridView.builder(
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: GlobalColor.indexBoxColor.withOpacity(0.1)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          menuItems[index].iconPath,
                          color: GlobalColor.indexBoxColor,
                          width: width * 0.08,
                          height: width * 0.08,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          menuItems[index].label,
                          style: TextStyle(
                            color: GlobalColor.indexBoxColor,
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
