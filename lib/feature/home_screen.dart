import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rotary_flutter/feature/announcement/AnnouncementScreen.dart';
import 'package:rotary_flutter/feature/home_provider.dart';
import 'package:rotary_flutter/feature/myInfo/my_info_screen.dart';
import 'package:rotary_flutter/feature/userSearch/user_search_screen.dart';
import 'package:rotary_flutter/util/global_color.dart';

import '../util/fontSize.dart';
import 'home/home_main_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = ref.watch(HomeProvider);

    void _onItemTapped(int index) async {
      setState(() {
        homeProvider.setNavigationIndex(index);
      });
    }

    final List<Widget> _widgetOptions = <Widget>[
      HomeMainScreen(), //홈
      UserSearchScreen(), //회원검색
      AnnouncementScreen(), //공지사항
      MyInfoScreen(), //내정보
    ];

    return Scaffold(
        body: _widgetOptions.elementAt(homeProvider.navigationIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle:
              TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    children: [
                      if (homeProvider.navigationIndex == 0)
                        Icon(
                          Icons.home,
                          color: GlobalColor.primaryColor,
                        )
                      else
                        Icon(
                          Icons.home_outlined,
                          color: GlobalColor.primaryColor,
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '홈',
                        style: TextStyle(
                            color: homeProvider.navigationIndex == 0
                                ? GlobalColor.primaryColor
                                : Colors.grey,
                            fontWeight: homeProvider.navigationIndex == 0
                                ? FontWeight.bold
                                : FontWeight.w400),
                      )
                    ],
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    children: [
                      if (homeProvider.navigationIndex == 1)
                        SvgPicture.asset(
                          width: 20,
                          height: 20,
                          'asset/images/router/user_search_filled_icon.svg',
                        )
                      else
                        SvgPicture.asset(
                          width: 20,
                          height: 20,
                          'asset/images/router/user_search_outline_icon.svg',
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '회원검색',
                        style: TextStyle(
                            color: homeProvider.navigationIndex == 1
                                ? GlobalColor.primaryColor
                                : Colors.grey,
                            fontWeight: homeProvider.navigationIndex == 1
                                ? FontWeight.bold
                                : FontWeight.w400),
                      )
                    ],
                  )
                  // : Image.asset(
                  //     'images/Color.fromARGB(255, 4, 2, 1)                 //     width: 20,
                  //     height: 20,
                  //     color: CustomColor.greyFontColor,
                  //   ),
                  ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    children: [
                      if (homeProvider.navigationIndex == 2)
                        SvgPicture.asset(
                          width: 20,
                          height: 20,
                          'asset/images/router/announcement_filled_icon.svg',
                        )
                      else
                        SvgPicture.asset(
                          width: 20,
                          height: 20,
                          'asset/images/router/announcement_outline_icon.svg',
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '공지사항',
                        style: TextStyle(
                            color: homeProvider.navigationIndex == 2
                                ? GlobalColor.primaryColor
                                : Colors.grey,
                            fontWeight: homeProvider.navigationIndex == 2
                                ? FontWeight.bold
                                : FontWeight.w400),
                      )
                    ],
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Column(
                    children: [
                      if (homeProvider.navigationIndex == 3)
                        Icon(
                          Icons.account_circle,
                          color: GlobalColor.primaryColor,
                        )
                      else
                        Icon(
                          Icons.account_circle_outlined,
                          color: GlobalColor.primaryColor,
                        ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '내 정보',
                        style: TextStyle(
                            color: homeProvider.navigationIndex == 3
                                ? GlobalColor.primaryColor
                                : Colors.grey,
                            fontWeight: homeProvider.navigationIndex == 3
                                ? FontWeight.bold
                                : FontWeight.w400),
                      )
                    ],
                  )),
              label: '',
            ),
          ],
          currentIndex: homeProvider.navigationIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: GlobalColor.primaryColor,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          unselectedFontSize: DynamicFontSize.font13(context),
          selectedFontSize: DynamicFontSize.font13(context),
        ));
  }
}
