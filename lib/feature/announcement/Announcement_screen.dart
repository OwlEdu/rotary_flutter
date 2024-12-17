import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:rotary_flutter/util/global_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreen();
}

class _AnnouncementScreen extends State<AnnouncementScreen> {
  late WebViewController _controller = WebViewController();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('http://rotary3700.or.kr/bsbbs/list?page=2&tn=notice&ti=&sw=&st=&cate=0'));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
