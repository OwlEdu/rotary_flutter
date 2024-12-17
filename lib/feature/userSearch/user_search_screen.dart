import 'package:flutter/material.dart';
import 'package:rotary_flutter/widgets/userSearch/search_widgets.dart';
import 'package:rotary_flutter/widgets/userSearch/user_list_widget.dart';

class UserSearchScreen extends StatefulWidget {

  const UserSearchScreen({super.key, });

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.05, vertical: maxWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: maxWidth * 0.02),
                    child: const SearchHeader(),
                  ),
                  SizedBox(height: maxWidth * 0.04),
                  SearchSectionItem(
                    title: '총재단',
                    count: searchConstants.count,
                    onTap: () {}
                  ),
                  SizedBox(height: maxWidth * 0.015),
                  SearchSectionItem(
                    title: '지구지도부',
                    count: searchConstants.leaderCount,
                    onTap: () {}
                  ),
                  SizedBox(height: maxWidth * 0.05),
                  GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      mainAxisSpacing: maxWidth * 0.04,
                      crossAxisSpacing: maxWidth * 0.04
                    ),
                    itemCount: searchConstants.totalMembers,
                    itemBuilder: (context, index) {
                      return LocationButton(number: index + 1, onTap: () {
                        print('${index+1}지역 선택됨');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserListWidget(
                              initialRegion: '${index+1}지역',
                            )
                          )
                        );
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}