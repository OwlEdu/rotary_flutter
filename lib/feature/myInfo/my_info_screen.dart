import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotary_flutter/data/remoteData/account_remote_data.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/feature/home_component.dart';
import 'package:rotary_flutter/feature/myInfo/myInfoModify/my_info_modify_screen.dart';
import 'package:rotary_flutter/feature/myInfo/my_info_view_model.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:rotary_flutter/util/secure_storage.dart';
import 'package:rotary_flutter/data/model/account_model.dart';
import '../../util/common.dart';
import '../../util/logger.dart';
import '../../util/model/state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyInfoScreen extends ConsumerStatefulWidget {
  const MyInfoScreen({super.key});

  ConsumerState<MyInfoScreen> createState() => _MyInfoScreen();
}

class _MyInfoScreen extends ConsumerState<MyInfoScreen> {
  void getMyData() async {
    await ref.read(MyInfoProvider).getMyAccount();
  }

  @override
  void initState() {
    super.initState();
    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    var myInfoProvider = ref.watch(MyInfoProvider);

    return LoadStateScaffold(
      loadState: myInfoProvider.accountState,
      backgroundColor: GlobalColor.white,
      successBody: (data) {
        var account = (data as List<Account>).first;

        return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              account.cellphone != null
                  ? Image.network(
                      '${BASE_URL}/qr?size=10&data=tel:+${account.cellphone}',
                      width: 150, height: 150)
                  : SizedBox(),
              SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: GlobalColor.indexBoxColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IndexText(
                        '회원정보',
                        textColor: GlobalColor.indexColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            width: 25,
                            height: 25,
                            'asset/icons/router/user_search_outline_icon.svg',
                          ),
                          IndexTitle(account.name),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyInfoModifyScreen();
                                }));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: GlobalColor.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '수정하기',
                                    style: TextStyle(color: GlobalColor.white),
                                  )))
                        ],
                      )
                    ],
                  ))
            ]));
      },
    );
  }
}
