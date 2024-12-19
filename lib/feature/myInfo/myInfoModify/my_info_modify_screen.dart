import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/constants/menu_items.dart';
import 'package:rotary_flutter/data/account/account_remote_data.dart';
import 'package:rotary_flutter/feature/myInfo/myInfoModify/my_info_modify_component.dart';
import 'package:rotary_flutter/feature/myInfo/myInfoModify/my_info_modify_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rotary_flutter/data/model/account_model.dart';
import '../../../util/state.dart';
import '../../../util/fontSize.dart';
import '../../../util/global_color.dart';
import '../../home/home_component.dart';

class MyInfoModifyScreen extends ConsumerStatefulWidget {
  final Account account;

  const MyInfoModifyScreen({super.key, required this.account});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyInfoModifyScreen();
}

class _MyInfoModifyScreen extends ConsumerState<MyInfoModifyScreen> {
  var nickNameController = TextEditingController();
  var birthDateController = TextEditingController();
  var enNameController = TextEditingController();
  var memoController = TextEditingController();

  var workNameController = TextEditingController();
  var workPositionNameController = TextEditingController();
  var workAddressZipCodeController = TextEditingController();
  var workAddressController = TextEditingController();
  var workAddressSubController = TextEditingController();
  var typeController = TextEditingController();

  void addController() {
    nickNameController.text = null ?? '';
    birthDateController.text = widget.account.birthDate ?? '';
    enNameController.text = null ?? '';
    memoController.text = null ?? '';

    workNameController.text = widget.account.workName ?? '';
    workPositionNameController.text = widget.account.workPositionName ?? '';
    workAddressZipCodeController.text = '${widget.account.workAddressZipCode}' ?? '';
    workAddressController.text = widget.account.workAddress ?? '';
    workAddressSubController.text = widget.account.workAddressSub ?? '';
    typeController.text = null ?? '';
  }

  @override
  void dispose() {
    nickNameController.dispose();
    birthDateController.dispose();
    enNameController.dispose();
    memoController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addController();
  }

  @override
  Widget build(BuildContext context) {
    var myInfoModifyProvider = ref.read(MyInfoModifyProvider);

    return Scaffold(
      backgroundColor: GlobalColor.white,
      appBar: AppBar(
        title: Text('회원정보 수정'),
        centerTitle: true,
        actions: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: InkWell(
                onTap: ()async{
                  var data = widget.account;

                  data.birthDate = birthDateController.text;
                  data.workName = workNameController.text;
                  data.workPositionName = workPositionNameController.text;
                  data.workAddressZipCode = workAddressZipCodeController.text;
                  data.workAddress = workAddressController.text;
                  data.workAddressSub = workAddressSubController.text;

                  var response =  await AccountAPI().putAccount(data);

                  if(response is Success){
                    context.pop();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: GlobalColor.primaryColor),
                  child: Text(
                    '저장',
                    style: TextStyle(color: GlobalColor.white),
                  ),
                ),
              ))
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
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
                  border:
                      Border.all(color: GlobalColor.primaryColor, width: 1)),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: Colors.red,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                IndexThumbTitle(widget.account.name),
                                SizedBox(height: 10,),
                                IndexThumbTitle(widget.account.name), SizedBox(height: 10,),
                                IndexThumbTitle(widget.account.name),],)],),
                        SizedBox(height: 30,),
                        MyInfoModifyTextField(indexTitle: '아호', indexController: nickNameController),
                        SizedBox(height: 15,),
                        MyInfoModifyTextField(indexTitle: '생년월일', indexController: birthDateController),
                        SizedBox(height: 15,),
                        MyInfoModifyTextField(indexTitle: '영문명', indexController: enNameController),
                        SizedBox(height: 15,),
                        MyInfoModifyTextField(indexTitle: '메모', indexController: memoController, multilineEnable: true,),
                      ]),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          MyInfoModifyTextField(indexTitle: '회사명', indexController: workNameController),
                          SizedBox(height: 15,),
                          MyInfoModifyTextField(indexTitle: '회사 직책', indexController: workPositionNameController),
                          SizedBox(height: 15,),
                          MyInfoModifyTextField(indexTitle: '회사 우편번호', indexController: workAddressZipCodeController),
                          SizedBox(height: 15,),
                          MyInfoModifyTextField(indexTitle: '회사 주소', indexController: workAddressController),
                          SizedBox(height: 15,),
                          MyInfoModifyTextField(indexTitle: '회사 상세주소', indexController: workAddressSubController),
                          SizedBox(height: 15,),
                          MyInfoModifyTextField(indexTitle: '업종', indexController: typeController),
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
