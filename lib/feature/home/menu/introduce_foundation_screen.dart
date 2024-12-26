import 'package:flutter/material.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IntroduceFoundationScreen extends StatefulWidget {
  const IntroduceFoundationScreen({super.key});

  @override
  State<IntroduceFoundationScreen> createState() => IntroduceFoundationScreenState();
}

class IntroduceFoundationScreenState extends State<IntroduceFoundationScreen> {
  late WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://rotary3700.or.kr/bsbbs/list?tn=governor&menuid=4&sub_menuid=13'));
  }

  Future<bool> _onWillPop() async {
    if(await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(milliseconds: 300)).then((value)=> setState(() =>()));
    Future.delayed(const Duration(milliseconds: 500)).then((value)=> setState(() =>()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('총재단소개'),
          centerTitle: true,
        ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
