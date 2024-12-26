import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class PresidentRecordScreen extends ConsumerStatefulWidget {
  const PresidentRecordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PresidentRecordScreen();
}
  class _PresidentRecordScreen extends ConsumerState<PresidentRecordScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('총재 약력'),
          centerTitle: true,
        ),
        body: ScrollablePinchView(child: Column(
            children: [
              Image.network(
                'https://mmate.flash21.com/images/rotary/capacity-img.jpg',
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.width),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              const Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            IndexText("성명: 지안 이충환"),
                            IndexText("생년월일: 1969년 4월 25일"),
                            IndexText("소속: 대구달구벌로타리클럽"),
                            IndexText("직업: 늘사랑치과 대표원장"),
                            SizedBox(height: 20,),

                            IndexTitle("학력"),
                            IndexText("UCLA 치과대학 악안명 임플란트(PRECEPTOR) 수료"),
                            IndexText("조선대학교 치의학과 보철학 박사 졸업"),
                            SizedBox(height: 20,),

                            IndexTitle("일반 경력"),
                            IndexText("2001년~현재 UCLS임플란트 연구회 회장"),
                            IndexText("2015년~2023년 대구광역시 검도 협회 회장 역임"),
                            IndexText("2019년~2023년 한국심는치아 연구회 회장 역임"),
                            IndexText("2020년~현재 늘사랑 청소년 운영 위원"),
                            SizedBox(height: 20,),

                            IndexTitle("로타리 경력"),
                            IndexText("2001.08.22 대구달구벌 로타리클럽 입회"),
                            IndexText("2011-12년도 대구달구벌 로타리클럽 회장"),
                            IndexText("2012-13년도 국제로타리 3700지구 의료봉사위원장"),
                            IndexText("2013-14년도 국제로타리 3700지구 총재보좌역"),
                            IndexText("2014-15년도 국제로타리 3700지구 의료봉사위원장"),
                            SizedBox(height: 100,)
                          ])])]))
            ])));
  }
}