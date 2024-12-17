import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnouncementScreen extends ConsumerStatefulWidget {
  const  AnnouncementScreen({super.key});
  @override
  ConsumerState<AnnouncementScreen> createState() => _AnnouncementScreen();
}

class _AnnouncementScreen extends ConsumerState<AnnouncementScreen> {
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
      child: WebViewWidget(
        controller: _controller,
      ),
      onWillPop: _onWillPop
    );
  }
}