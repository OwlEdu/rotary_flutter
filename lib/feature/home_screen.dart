import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import "package:permission_handler/permission_handler.dart";
import 'package:rotary_flutter/data/remoteData/account_remote_data.dart';
import 'package:rotary_flutter/feature/announcement/announcement_screen.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/feature/home_component.dart';
import 'package:rotary_flutter/feature/home_provider.dart';
import 'package:rotary_flutter/feature/myInfo/login_screen.dart';
import 'package:rotary_flutter/feature/myInfo/my_info_screen.dart';
import 'package:rotary_flutter/feature/userSearch/user_search_screen.dart';
import 'package:rotary_flutter/util/common/phone_input_formatter.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:rotary_flutter/util/logger.dart';
import 'package:rotary_flutter/util/model/state.dart';
import 'package:rotary_flutter/util/secure_storage.dart';

import '../data/model/account_model.dart';
import '../main.dart';
import '../util/fontSize.dart';
import 'home/home_main_screen.dart';
import 'myInfo/myInfoModify/my_info_modify_component.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  int selectedIndex = 0;
  bool isLogin = false;

  late TextEditingController phoneController;
  late TextEditingController authenticateController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) androidLogin();
    else if (Platform.isIOS) iOSLogin();

    phoneController = TextEditingController();
    authenticateController = TextEditingController();
  }

  Future<void> androidLogin() async {
    if (await Permission.phone.request().isGranted) {
      const androidChannel = MethodChannel('com.flash21.rotary_3700/android');
      try {
        final phone = await androidChannel.invokeMethod('getPhoneNumber');
        if (phone != null) {
          var dataState = await AccountAPI().getAccount(cellphone: phone);

          loadStateFunction(dataState, onSuccess: (data) {
            var result = (data as List<Account>)[0].name;
            Fluttertoast.showToast(msg: '${result}님 로그인에 성공하였습니다.');
            isLogin = true;
            globalStorage.write(key: 'phone', value: phone);
          }, onError: (e) => showPhone(context));
        }
      } catch (e) {
        Fluttertoast.showToast(msg: '휴대폰 번호를 가져오는 중 오류가 발생했습니다.');
        WidgetsBinding.instance.addPostFrameCallback((_) {});
      }
    }
  }

  void iOSLogin()async{
    if((await globalStorage.read(key: 'phone')) == null) Future.delayed(Duration(milliseconds: 300)).then((onValue)=> showPhone(context));
  }

  void showPhone(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // 외부 클릭으로 다이얼로그 닫힘 방지
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            // BackKey 누르면 앱 종료
            SystemNavigator.pop();
            return false; // 여기서 false를 반환해야 다이얼로그가 닫히지 않음
          },
          child: Dialog(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    height: 20,
                    'asset/images/main_logo.svg',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyInfoModifyTextField(
                    indexTitle: '전화번호',
                    indexController: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      // FilteringTextInputFormatter.allow(
                      //   RegExp(r'^(010.*|.{0,2})$'), // 정규식 적용
                      // ),
                      PhoneInputFormatter()
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                        child: InkWell(
                            onTap: () {
                              print('hello');
                              if(phoneController.text.isNotEmpty){
                                FocusNode().unfocus();
                                ref.read(HomeProvider).postPhone(phoneController.text);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: GlobalColor.primaryColor,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: IndexTitle(
                                '문자 인증',
                                textColor: GlobalColor.white,
                              ),
                            )))
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showAuthenticate(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // 외부 클릭으로 다이얼로그 닫힘 방지
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Dialog(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    height: 20,
                    'asset/images/main_logo.svg',
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyInfoModifyTextField(
                    indexTitle: '인증번호',
                    indexController: authenticateController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            if(authenticateController.text.isNotEmpty){
                              FocusNode().unfocus();
                              ref.read(HomeProvider).postAuthenticate(authenticateController.text);
                            }
                          },
                            child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: GlobalColor.primaryColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      child: IndexTitle(
                        '인증하기',
                        textColor: GlobalColor.white,
                      ),
                    )))
                  ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = ref.watch(HomeProvider);

    loadStateFunction(homeProvider.phoneState, onSuccess: (data) {
      Future.delayed(Duration(milliseconds: 300)).then((onValue){
      Navigator.of(context, rootNavigator: true).pop();
      showAuthenticate(context);

      homeProvider.phoneState = End();
      });
    });

    loadStateFunction(homeProvider.authenticateState, onSuccess: (data) {
      Future.delayed(Duration(milliseconds: 300)).then((onValue){
        Navigator.of(context, rootNavigator: true).pop();

        homeProvider.authenticateState = End();
        globalStorage.write(key: 'phone', value: '01040502111');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('인증 완료되었습니다'),
        ));
      });
    });

    void onItemTapped(int index) async {
      print('onItemTapped: $index');
      setState(() {
        selectedIndex = index;
        homeProvider.setNavigationIndex(index);
      });
    }

    Color getAppBarColor() {
      return (selectedIndex == 2) ? GlobalColor.white : GlobalColor.white;
    }

    final List<Widget> _widgetOptions = <Widget>[
      HomeMainScreen(), //홈
      UserSearchScreen(), //회원검색
      AnnouncementScreen(), //공지사항
      MyInfoScreen(), //내정보
    ];

    final double statusBarSize = MediaQuery.of(context).padding.top;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
        appBar: AppBar(
            backgroundColor: getAppBarColor(),
            title: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: GlobalColor.indexBoxColor,
                ),
                child: Row(children: [
                  SvgPicture.asset(
                    height: 20,
                    'asset/images/main_logo.svg',
                    fit: BoxFit.contain,
                  )
                ]))),
        body: _widgetOptions.elementAt(homeProvider.navigationIndex));
        // bottomNavigationBar: Container(
        //     decoration: BoxDecoration(
        //       border: Border(
        //         top: BorderSide(
        //           color: GlobalColor.indexBoxColor, // 상단 테두리 색상
        //           width: 0.5, // 상단 테두리 두께
        //         ),
        //       ),
        //     ),
        //     child: BottomNavigationBar(
        //       selectedLabelStyle:
        //           TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
        //       unselectedLabelStyle:
        //           TextStyle(fontSize: 0, fontWeight: FontWeight.bold),
        //       backgroundColor: Colors.white,
        //       items: <BottomNavigationBarItem>[
        //         BottomNavigationBarItem(
        //           icon: Padding(
        //               padding: const EdgeInsets.only(bottom: 5, top: 10),
        //               child: Column(
        //                 children: [
        //                   if (homeProvider.navigationIndex == 0)
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/home_filled_icon.svg',
        //                     )
        //                   else
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/home_outline_icon.svg',
        //                     ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     '홈',
        //                     style: TextStyle(
        //                         color: homeProvider.navigationIndex == 0
        //                             ? GlobalColor.primaryColor
        //                             : Colors.grey,
        //                         fontWeight: homeProvider.navigationIndex == 0
        //                             ? FontWeight.bold
        //                             : FontWeight.w400),
        //                   )
        //                 ],
        //               )),
        //           label: '',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Padding(
        //               padding: const EdgeInsets.only(bottom: 5, top: 10),
        //               child: Column(
        //                 children: [
        //                   if (homeProvider.navigationIndex == 1)
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/user_search_filled_icon.svg',
        //                     )
        //                   else
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/user_search_outline_icon.svg',
        //                     ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     '회원검색',
        //                     style: TextStyle(
        //                         color: homeProvider.navigationIndex == 1
        //                             ? GlobalColor.primaryColor
        //                             : Colors.grey,
        //                         fontWeight: homeProvider.navigationIndex == 1
        //                             ? FontWeight.bold
        //                             : FontWeight.w400),
        //                   )
        //                 ],
        //               )
        //               // : Image.asset(
        //               //     'images/Color.fromARGB(255, 4, 2, 1)                 //     width: 20,
        //               //     height: 20,
        //               //     color: CustomColor.greyFontColor,
        //               //   ),
        //               ),
        //           label: '',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Padding(
        //               padding: const EdgeInsets.only(bottom: 5, top: 10),
        //               child: Column(
        //                 children: [
        //                   if (homeProvider.navigationIndex == 2)
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/announcement_filled_icon.svg',
        //                     )
        //                   else
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/announcement_outline_icon.svg',
        //                     ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     '공지사항',
        //                     style: TextStyle(
        //                         color: homeProvider.navigationIndex == 2
        //                             ? GlobalColor.primaryColor
        //                             : Colors.grey,
        //                         fontWeight: homeProvider.navigationIndex == 2
        //                             ? FontWeight.bold
        //                             : FontWeight.w400),
        //                   )
        //                 ],
        //               )),
        //           label: '',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Padding(
        //               padding: const EdgeInsets.only(bottom: 5, top: 10),
        //               child: Column(
        //                 children: [
        //                   if (homeProvider.navigationIndex == 3)
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/my_info_filled_icon.svg',
        //                     )
        //                   else
        //                     SvgPicture.asset(
        //                       width: 25,
        //                       height: 25,
        //                       'asset/icons/router/my_info_outline_icon.svg',
        //                     ),
        //                   SizedBox(
        //                     height: 5,
        //                   ),
        //                   Text(
        //                     '내 정보',
        //                     style: TextStyle(
        //                         color: homeProvider.navigationIndex == 3
        //                             ? GlobalColor.primaryColor
        //                             : Colors.grey,
        //                         fontWeight: homeProvider.navigationIndex == 3
        //                             ? FontWeight.bold
        //                             : FontWeight.w400),
        //                   )
        //                 ],
        //               )),
        //           label: '',
        //         ),
        //       ],
        //       currentIndex: homeProvider.navigationIndex,
        //       unselectedItemColor: Colors.grey,
        //       selectedItemColor: GlobalColor.primaryColor,
        //       showUnselectedLabels: true,
        //       onTap: onItemTapped,
        //       type: BottomNavigationBarType.fixed,
        //       elevation: 0,
        //       unselectedFontSize: DynamicFontSize.font13(context),
        //       selectedFontSize: DynamicFontSize.font13(context),
        //     )));
  }
}
