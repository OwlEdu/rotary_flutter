import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/data/model/advertise_model.dart';
import 'package:rotary_flutter/util/fontSize.dart';

import '../../../util/global_color.dart';
import '../home_main_component.dart';

class AdvertiseScreen extends ConsumerStatefulWidget {
  const AdvertiseScreen({super.key});

  @override
  ConsumerState<AdvertiseScreen> createState() => _AdvertiseScreen();
}

class _AdvertiseScreen extends ConsumerState<AdvertiseScreen> {
  @override
  Widget build(BuildContext context) {
    var list = [
      AdvertiseModel(
          image: 'https://mmate.flash21.com/images/rotary/rotary_slide.jpg',
          title: '기적을 이루는 로타리'),
      AdvertiseModel(
          image: 'https://mmate.flash21.com/images/rotary/rotary_slide02.jpg',
          title: '초아의 봉사 정신')
    ];

    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('광고협찬'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SearchBox(
                  hint: '검색어를 입력해주세요',
                ),
                SizedBox(
                  height: 15,
                ),
                list.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Column(
                                children: [
                                  Image.network(
                                    list[index].image ?? '',
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                      color: Colors.black12,
                                      width: MediaQuery.of(context).size.width,
                                      child: IndexText('${list[index].title}'))
                                ],
                              ));
                        },
                          separatorBuilder: (_,$){
                          return SizedBox(height: 10,);
                          },
                        itemCount: list.length,
                      ))
                    : Expanded(
                        child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                          ),
                          Text(
                            'ⓘ',
                            style: TextStyle(fontSize: 40),
                          ),
                          IndexText('조회된 데이터가 없습니다.'),
                        ],
                      ))
              ],
            )));
  }
}
