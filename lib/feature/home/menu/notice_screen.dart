import 'package:flutter/material.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  late WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://rotary3700.or.kr/bsbbs/list?page=2&tn=notice&ti=&sw=&st=&cate=0'));
  }

  Future<bool> _onWillPop() async {
    if(await _controller.canGoBack()) {
      await _controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('공지사항'),
          centerTitle: true,
        ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
