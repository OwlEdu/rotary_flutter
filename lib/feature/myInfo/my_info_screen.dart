import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotary_flutter/data/account/account_remote_data.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/feature/myInfo/myInfoModify/my_info_modify_screen.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:rotary_flutter/util/secure_storage.dart';
import 'package:rotary_flutter/data/model/account_model.dart';
import '../../util/common.dart';

class MyInfoScreen extends ConsumerStatefulWidget {
  const MyInfoScreen({super.key});

  ConsumerState<MyInfoScreen> createState() => _MyInfoScreen();
}

class _MyInfoScreen extends ConsumerState<MyInfoScreen> {
  Account? myData;

  void getMyData() async {
    var phone = await globalStorage.read(key: 'phone');
    var phoneTemp =
        '${phone?.substring(0, 3)}-${phone?.substring(3, 7)}-${phone?.substring(7)}';
    var temp = await AccountAPI().getAccount(cellphone: phoneTemp);

    setState(() {
      myData = temp?.first;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getMyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            SizedBox(
              height: 50,
            ),
            myData?.cellphone != null
                ? Image.network(
                    '${BASE_URL}/qr?size=10&data=tel:+${myData?.cellphone}',
                    width: 150,
                    height: 150)
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
                        IndexTitle(myData?.name ?? ''),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              myData != null
                                  ? {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MyInfoModifyScreen(
                                          account: myData!,
                                        );
                                      }))
                                    }
                                  : {};
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
          ])),
    );
  }
}
