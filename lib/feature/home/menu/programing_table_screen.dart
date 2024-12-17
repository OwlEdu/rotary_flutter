import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/feature/home/home_component.dart';
import 'package:rotary_flutter/util/fontSize.dart';
import 'package:rotary_flutter/util/global_color.dart';

class ProgramingTableScreen extends ConsumerStatefulWidget {
  const ProgramingTableScreen({super.key});

  @override
  ConsumerState<ProgramingTableScreen> createState() =>
      _ProgramingTableScreen();
}

class _ProgramingTableScreen extends ConsumerState<ProgramingTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.white,
        appBar: AppBar(
          title: Text('편성표'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: PinchView(
                    child: Column(children: [
              Image.asset(
                'asset/images/menu/programming_table_image.jpg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ])))
          ],
        ));
  }
}
