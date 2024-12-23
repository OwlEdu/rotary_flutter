import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class PolicyScreen extends ConsumerStatefulWidget {
  const PolicyScreen({super.key});

  @override
  ConsumerState<PolicyScreen> createState() => _PolicyScreen();
}

class _PolicyScreen extends ConsumerState<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('운영방침'),
          centerTitle: true,
        ),
        body: ScrollablePinchView(child: Column(
          children: [
            Image.network(
              'https://mmate.flash21.com/images/rotary/operation-img.jpg',
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 4 * 3,
              alignment: Alignment.topCenter,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                IndexText("2024-25년도 지구 운영방침 및 중점목표"),
                SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndexText("스테파니 얼칙 국제로타리 차기회장은 2024-25년도 회장 표어로 \"기적을 이루는 로타리\"를 발표하고 회원들에게 생명 을 구하는 로타리의 힘을 인식하고 확대할 것을 촉구했다"),
                    SizedBox(height: 20,),
                    IndexText("또한 \"우리가 요술 지팡이 를 흔들고 주문을 외운다고 해서 소아마비를 종식시키거나 세상에 평화를 가져올 수는 없다\"고 전 제하고 \"모든 것이 여러분에게 달려 있다. 완료된 모든 프로젝트, 기부된 모든 액수, 모든 신입회원들로 여러분은 기적을 만들 것\"이라 강조했다."),
                    SizedBox(height: 20,),
                    IndexText("그녀는 현재 미국 내 클럽 및 지구들이 알바니아, 코소보, 우크라이나의 로타리클럽과 파트너십을 맺고 인 도주의 및 교육 프로젝트를 추진하도록 지원하고 있다."),
                    SizedBox(height: 20,),

                    IndexText("● 지구 중점 목표"),
                    SizedBox(height: 5,),
                    IndexText("1. 회원 3700명(회원 순증가 500명 이상)"),
                    IndexText("2. 신생클럽 4개 이상 창립"),
                    IndexText("(RCC/Rotaract 포함)"),
                    IndexText("3. 로타리 재단 120만불 달성(지역당10만불)"),
                    IndexText("4. 글로벌 봉사사업 확대"),
                    IndexText("5. 공공이미지 강화"),
                    IndexText("6. 환경보존활동"),],),
                SizedBox(height: 100,),]),)],)));
  }
}
