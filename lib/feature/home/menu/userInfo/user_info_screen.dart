import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/feature/home/menu/userInfo/user_info_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:url_launcher/url_launcher.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  const UserInfoScreen({super.key});

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreen();
}

class _UserInfoScreen extends ConsumerState<UserInfoScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('회원정보'),
          centerTitle: true,
        ),
        body: NestedScrollView(
            key: ValueKey('nested'),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    child: Image.network(
                        'https://mmate.flash21.com/ecm/bbs/imgLoad.do?path=/home/mmate/webapps/upload/photo/ST0122/&filename=ECM_USR_INFO_MNGTST0122_17289596236890_41&mode=bbsAttachedFile',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter),
                  )
                ]))
              ];
            },
            body: DefaultTabController(
                length: 2,
                child: Column(children: [
                  SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        text: '개인정보',
                      ),
                      Tab(
                        text: '회사정보',
                      ),
                    ],
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalColor.primaryColor,
                        fontSize: DynamicFontSize.font20(context)),
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: DynamicFontSize.font20(context),
                        color: GlobalColor.indexColor),
                    indicator: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: GlobalColor.primaryColor, width: 1)),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (index) {
                      setState(() {
                        _selectedTabIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: TabBarView(
                    physics: ClampingScrollPhysics(),
                    children: [
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          UserInfoIndex(
                              assetName: 'asset/icons/userInfo/name_icon.svg',
                              indexName: '성명',
                              index: '김경수'),
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/position_icon.svg',
                              indexName: '직책',
                              index: '95-96총재'),
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/affiliation_icon.svg',
                              indexName: '소속',
                              index: '대구청구 RC'),
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/calendar_icon.svg',
                              indexName: '입회일',
                              index: null),

                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                    onTap:() async {
                                      var uri = Uri(scheme: 'sms', path: '01058292280');
                                      if(await canLaunchUrl(uri)) await launchUrl(uri);
                                    },
                                  child: Container(
                                margin: EdgeInsets.only(left: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: GlobalColor.lightPrimaryColor)),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  SvgPicture.asset(
                                      'asset/icons/userInfo/message_icon.svg'),
                                  SizedBox(width: 5,),
                                      IndexText('문자보내기', textColor: GlobalColor.primaryColor)
                                ]),
                              ))),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: InkWell(
                                      onTap:() async {
                                        var uri = Uri(scheme: 'tel', path: '01058292280');
                                        if(await canLaunchUrl(uri)) await launchUrl(uri);
                                      },
                                      child:  Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: GlobalColor.lightPrimaryColor)),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center, children: [
                                  SvgPicture.asset('asset/icons/userInfo/phone_icon.svg'),
                                  SizedBox(width: 5,),
                                  IndexText('전화하기', textColor: GlobalColor.primaryColor)
                                ]),)))],)],)),
                      SingleChildScrollView(
                          child: Column(
                        children: [
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/company_icon.svg',
                              indexName: '상호',
                              index: '낙타정형외과'),
                          UserInfoIndex(
                              assetName: 'asset/icons/userInfo/name_icon.svg',
                              indexName: '성명',
                              index: '김경수'),
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/position_icon.svg',
                              indexName: '직책',
                              index: '원장'),
                          UserInfoIndex(
                              assetName: 'asset/icons/userInfo/phone_icon.svg',
                              indexName: '전화번호',
                              index: null),
                          UserInfoIndex(
                              assetName: 'asset/icons/userInfo/fax_icon.svg',
                              indexName: '팩스번호',
                              index: null),
                          UserInfoIndex(
                              assetName:
                                  'asset/icons/userInfo/address_icon.svg',
                              indexName: '주소',
                              index: '대구 동구 국채보상로 867'),
                          UserInfoIndex(
                              assetName: 'asset/icons/userInfo/email_icon.svg',
                              indexName: '이메일',
                              index: 'hosoo2290@hanmail.net'),
                        ],
                      )),
                    ],
                  ))
                ]))));
  }
}
