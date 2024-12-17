import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rotary_flutter/feature/userSearch/user_search_screen.dart';
import 'package:rotary_flutter/util/global_color.dart';

class UserListWidget extends StatefulWidget {
  final String initialRegion;

  const UserListWidget({super.key, required this.initialRegion});


  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  late String _selectedRegion;
  String _selectedRC = 'RC';
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedRegion = widget.initialRegion;
  }

  final List<String> regions = ['1지역', '2지역', '3지역', '4지역', '5지역', '6지역', '7지역'
                                '8지역', '9지역', '10지역', '11지역', '12지역'];
  final List<String> rc = ['RC'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: size.width * 0.04, right: size.width * 0.04, top: size.width * 0.1, bottom: size.width * 0.04
            ),
            decoration: BoxDecoration(
                color: GlobalColor.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2)
                  )
                ]
            ),
            child: Row(
              children: [
                // 지역 선택 버튼
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_selectedRegion),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                // RC 드롭다운
                 DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedRC,
                    items: rc.map((String rc) {
                      return DropdownMenuItem<String>(
                        value: rc,
                        child: Text(rc),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRC = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                // 검색 텍스트필드
                Expanded(
                  child: Container(
                    height: size.width * 0.085,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          hintText: '회원검색',
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: size.width * 0.04),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(size.width * 0.02),
                            child: SvgPicture.asset(
                              'asset/icons/router/user_search_outline_icon.svg',
                              height: size.width * 0.04,
                              width: size.width * 0.04,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size.width * 0.02),
                              borderSide: BorderSide(color: Colors.grey[300]!)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size.width * 0.02),
                              borderSide: BorderSide(color: Colors.grey[300]!)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size.width * 0.02),
                              borderSide: BorderSide(color: GlobalColor.primaryColor)
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          // 검색 로직 구현
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(size.width * 0.04),
                child: Column(
                  children: List.generate(
                    4,
                    (index) => Card(
                    elevation: 2.0,
                    margin: EdgeInsets.only(bottom: size.height * 0.02),
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                //TODO: 사진 클릭시 상세정보 들어가기
                              },
                              child: Container(
                                width: size.width * 0.3,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(size.width * 0.02)
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: size.width * 0.1,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: size.width * 0.2,
                                        height: size.height * 0.025,
                                        color: Colors.grey[200],
                                      ),
                                      SizedBox(width: size.width * 0.02),
                                      Container(
                                        width: size.width * 0.15,
                                        height: size.height * 0.025,
                                        color: Colors.grey[200],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text('정회원', style: TextStyle(fontSize: size.width * 0.035)),
                                  SizedBox(height: size.height * 0.008),
                                  Row(
                                    children: [
                                      Text('직책', style: TextStyle(fontSize: size.width * 0.035)),
                                      SizedBox(width: size.width * 0.02),
                                      Container(
                                        width: size.width * 0.1,
                                        height: size.height * 0.025,
                                        color: Colors.grey[200],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.008),
                                  Text('입회일', style: TextStyle(fontSize: size.width * 0.035)),
                                  SizedBox(height: size.height * 0.008),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.025,
                                        color: Colors.grey[200],
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.phone, color: GlobalColor.primaryColor, size: size.width * 0.06),
                                        onPressed: () {},
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
