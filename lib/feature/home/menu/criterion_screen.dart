import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class CriterionScreen extends ConsumerStatefulWidget {
  const CriterionScreen({super.key});

  @override
  ConsumerState<CriterionScreen> createState() => _CriterionScreen();
}

class _CriterionScreen extends ConsumerState<CriterionScreen> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('표창기준'),
          centerTitle: true,
        ),
        body: ScrollablePinchView(
            child: Stack(children: [
                Container(height: 600, child: Center(child: CircularProgressIndicator())),
            Image.asset(
              'asset/images/menu/criterion_image.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
    )])));
  }
}
