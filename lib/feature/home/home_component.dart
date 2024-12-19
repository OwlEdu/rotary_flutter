import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../util/fontSize.dart';
import '../../util/global_color.dart';

class IndexText extends StatelessWidget {
  final String text;
  final Color? textColor;

  const IndexText(this.text, {super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: DynamicFontSize.font21(context),
          color: textColor ?? GlobalColor.black),
    );
  }
}

class IndexTitle extends StatelessWidget {
  final String? text;
  final Color? textColor;

  const IndexTitle(this.text, {super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: TextStyle(
          fontSize: DynamicFontSize.font21(context),
          color: textColor ?? GlobalColor.black,
          fontWeight: FontWeight.bold),
    );
  }
}

class IndexThumbTitle extends StatelessWidget {
  final String? text;
  final Color? textColor;

  const IndexThumbTitle(this.text, {super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      style: TextStyle(
          fontSize: DynamicFontSize.font30(context),
          color: textColor ?? GlobalColor.black,
          fontWeight: FontWeight.bold),
    );
  }
}

class ScrollablePinchView extends ConsumerStatefulWidget {
  final Widget child;

  const ScrollablePinchView({super.key, required this.child});

  ConsumerState<ScrollablePinchView> createState() => _ScrollablePinchView();
}

class _ScrollablePinchView extends ConsumerState<ScrollablePinchView> {
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
                physics:
                    _isPinch ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                child: InteractiveViewer(
                    minScale: 1.0, maxScale: 6.0, child: widget.child))));
  }
}

class PinchView extends StatelessWidget {
  final Widget child;
  const PinchView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(minScale: 1.0, maxScale: 6.0, child: child);
  }
}

class SearchBox extends StatelessWidget {
  final String hint;
  final Function(String)? onSearch;

  const SearchBox({super.key, required this.hint, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSearch,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: GlobalColor.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide(color: GlobalColor.primaryColor),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: GlobalColor.primaryColor,
            size: 30,
          )),
    );
  }
}
