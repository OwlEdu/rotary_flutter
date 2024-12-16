import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

import '../../util/fontSize.dart';
import '../../util/global_color.dart';

class IndexText extends StatelessWidget {
  final String text;

  const IndexText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: DynamicFontSize.font24(context), color: GlobalColor.black),
    );
  }
}

class IndexTitle extends StatelessWidget {
  final String text;

  const IndexTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: DynamicFontSize.font24(context),
          color: GlobalColor.black,
          fontWeight: FontWeight.bold),
    );
  }
}

class ScrollablePinchView extends ConsumerStatefulWidget {
  final Widget child;

  const ScrollablePinchView(
      {super.key, required this.child});

  ConsumerState<ScrollablePinchView> createState() => _ScrollablePhotoView();
}

class _ScrollablePhotoView extends ConsumerState<ScrollablePinchView> {
  final List<int> events = [];
  bool _isPinch = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Listener(
            onPointerDown: (PointerEvent event) {
              events.add(event.pointer);
              final int pointers = events.length;

              if (pointers >= 2) {
                print('isPinching');
                setState(() => _isPinch = true);
              }
            },
            onPointerUp: (event) {
              events.clear();
              print('isPinching false');
              setState(() => _isPinch = false);
            },
            child: SingleChildScrollView(
                  physics: _isPinch
                      ? NeverScrollableScrollPhysics()
                      : ScrollPhysics(),
                  child: InteractiveViewer(
                        minScale: 1.0,
                        maxScale: 6.0,
                        child: widget.child
                      ))));
  }
}
