import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rotary_flutter/feature/home_component.dart';
import 'package:rotary_flutter/feature/userSearch/UserSearchList/user_search_list_view_model.dart';

import '../../../data/model/account_model.dart';
import '../../../util/global_color.dart';
import '../../home/home_main_component.dart';

class UserListWidget extends ConsumerStatefulWidget {
  final int initialRegion;

  const UserListWidget({super.key, required this.initialRegion});

  @override
  ConsumerState<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends ConsumerState<UserListWidget> {
  late int _selectedRegion;
  late int _selectedRC;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedRegion = widget.initialRegion;
    _selectedRC = 0;

    ref.read(UserSearchListProvider).getAccountList();
  }

  final List<String> regions = [
    '1지역',
    '2지역',
    '3지역',
    '4지역',
    '5지역',
    '6지역',
    '7지역',
    '8지역',
    '9지역',
    '10지역',
    '11지역',
    '12지역'
  ];
  final List<String> rc = [
    'RC',
    '청도 RC',
    '대구영남 RC',
    '대구청운 RC',
    '대구태양 RC',
    '청도원화 RC',
    '대구유성 RC',
    '대구대성 RC',
    '대구송원 RC'
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userSearchListProvider = ref.watch(UserSearchListProvider);
    return Scaffold(
        backgroundColor: GlobalColor.indexBoxColor,
        appBar: AppBar(
          title: Text('회원검색'),
          centerTitle: true,
        ),
        body: Column(children: [
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                children: [
                  CustomDropdown(
                      items: regions,
                      selectedValue: _selectedRegion,
                      onChanged: (value) {
                        if (value != null && value != _selectedRegion) {
                          setState(() => _selectedRegion = value);
                        }
                        context.pop();
                      }),

                  SizedBox(width: 10),
                  CustomDropdown(
                      items: rc,
                      selectedValue: _selectedRC,
                      onChanged: (value) {
                        setState(() {
                          _selectedRC = value!;
                        });
                        context.pop();
                      }),

                  SizedBox(width: 10),
                  // 검색 텍스트필드
                  Expanded(
                      child: Container(
                    height: 40,
                    child: SearchBox(
                      hint: '회원검색',
                      borderColor: GlobalColor.transparent,
                      backgroundColor: GlobalColor.white,
                    ),
                  )) //
                ],
              )),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: LoadStateWidget(
                  loadState: userSearchListProvider.userListState,
                  successWidget: (data) {
                    var accounts = data as List<Account>;

                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        return InkWell(onTap: (){
                          context.push('/menu/userInfo/${accounts[index].id}');
                        },child: Container(
                          decoration: BoxDecoration(
                              color: GlobalColor.white,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 160,
                                color: GlobalColor.primaryColor,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IndexThumbTitle(accounts[index].name),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      IndexText('대구유성 RC')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IndexText('정회원'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    IndexText('직책'),
                                    IndexText('초대회장'),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    IndexText('입회일'),
                                  ]),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  IndexText('010-****-****'),
                                ],
                              )
                            ],
                          ),
                        ));
                      },
                      separatorBuilder: (_, $) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                    );
                  }))
        ]));
  }
}
