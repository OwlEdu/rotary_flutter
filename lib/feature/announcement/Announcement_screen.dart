import 'package:flutter/material.dart';
import 'package:rotary_flutter/feature/home/home_main_component.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreen();
}

class _AnnouncementScreen extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.white,
      body:
        ListView.separated(
          physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            itemBuilder: (context,index){
          return Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
            color: GlobalColor.indexBoxColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IndexTitle('제목'),
              IndexText('내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용', overFlowFade: true,),
                SizedBox(height: 15,),
                IndexMinText('2023-02-24 업데이트',)
              ]
            ),
          );
        }, separatorBuilder: (context, index){
          return SizedBox(height: 15,);
        }, itemCount: 100,)
      );
  }




















  // late WebViewController _controller = WebViewController();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..loadRequest(Uri.parse('http://rotary3700.or.kr/bsbbs/list?page=2&tn=notice&ti=&sw=&st=&cate=0'));
  // }
  //
  // Future<bool> _onWillPop() async {
  //   if(await _controller.canGoBack()) {
  //     await _controller.goBack();
  //     return false;
  //   }
  //   return true;
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return WillPopScope(
  //     onWillPop: _onWillPop,
  //     child: Scaffold(
  //       body: WebViewWidget(controller: _controller),
  //     ),
  //   );
  // }
}

