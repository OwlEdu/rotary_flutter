import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rotary_flutter/data/account/account_remote_data.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/secure_storage.dart';

import '../../data/model/account_model.dart';
import '../../util/common.dart';

class MyInfoScreen extends ConsumerStatefulWidget {
  const MyInfoScreen({super.key});

  ConsumerState<MyInfoScreen> createState() => _MyInfoScreen();
}
class _MyInfoScreen extends ConsumerState<MyInfoScreen>{
  Account? myData;

  void getMyData() async{
    var temp = await AccountAPI().getAccount(cellphone: '010-5829-2280');

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
      body: Column(
        children: [
          // Image.network('$BASE_URL/qr?size=10&data=tel:+01058292280'),
          Container(width: 200, height: 200, color: Colors.red),

          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.all(15),
          //   child: Column(children: [
          //     Text('회원정보'),
          //     SvgPicture.asset(
          //       width: 25,
          //       height: 25,
          //       'asset/icons/router/user_search_outline_icon.svg',
          //     ),
          //     Spacer(),
          //     Text('수정하기')
          //   ],)
          // ),

          InkWell(
              child: Text('${myData?.name??''}', style: TextStyle(fontSize: DynamicFontSize.font35(context)),),
              onTap: () {

                // context.push('/menu/userInfo');
              }),
        ],
      ),
    );
  }
}
