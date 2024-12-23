import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rotary_flutter/util/logger.dart';

import '../util/global_color.dart';
import '../util/model/state.dart';

class LoadStateScaffold extends ConsumerStatefulWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? loadingBody;
  final Widget Function(dynamic) successBody;
  final Widget? errorBody;

  final LoadState loadState;

  const LoadStateScaffold(
      {super.key, this.backgroundColor, this.appBar, required this.loadState, this.loadingBody, required this.successBody, this.errorBody});

  @override
  ConsumerState<LoadStateScaffold> createState()=> _LoadStateScaffold();
}
class _LoadStateScaffold extends ConsumerState<LoadStateScaffold>{


  @override
  Widget build(BuildContext context) {
    Widget? body;
    const placeHolder = Center(child: CircularProgressIndicator(color: GlobalColor.primaryColor,));

    print('hello: loadState: ${widget.loadState}');

    if(widget.loadState is Loading) {body =widget.loadingBody ?? placeHolder;}
    else if(widget.loadState is Success) {
      Log.d('success on',isSuper:  true);
      body = widget.successBody((widget.loadState as Success).data);}
    else if(widget.loadState is Error) {
      Log.e('${(widget.loadState as Error).exception}');

      Log.d('${widget.errorBody}');
      body = widget.errorBody ?? widget.loadingBody ?? placeHolder;}
    else {body = placeHolder;}

    return Scaffold(
      backgroundColor: widget.backgroundColor,
        appBar: widget.appBar,
        body: body
    );
  }
}

class LoadStateWidget extends StatelessWidget {
  final Widget? loadingWidget;
  final Widget Function(dynamic) successWidget;
  final Widget? errorWidget;

  final LoadState loadState;

  const LoadStateWidget(
      {super.key, required this.loadState, this.loadingWidget,required this.successWidget, this.errorWidget});

  @override
  Widget build(BuildContext context) {
    Widget? widget;
    const placeHolder = Center(child: CircularProgressIndicator(color: GlobalColor.primaryColor,));

    if(loadState is Loading) {widget = loadingWidget ?? placeHolder;}
    else if(loadState is Success) {
      Log.d('success on',isSuper:  true);
      widget = successWidget((loadState as Success).data);
    }
    else if(loadState is Error) {
      Log.e('${(loadState as Error).exception}',isSuper:  true);
      widget = errorWidget ?? loadingWidget ?? placeHolder;
    }
    else {widget = placeHolder;}

    return widget;
  }
}

void loadStateFunction(LoadState loadState, Function(dynamic) onSuccess, {Function(Object)? onError}) {
  if(loadState is Success){
    Log.d('success on',isSuper:  true);
    onSuccess(loadState.data);
  }else if(loadState is Error){
    Log.e('${loadState.exception}',isSuper:  true);
    (onError ?? () {})(loadState.exception);
  }
}

LoadState runCatching(LoadState Function() function, {required Function onSuccess, Function()? onFailure}){
  late LoadState data;

 try {
   WidgetsBinding.instance.addPostFrameCallback((_) async {
     var load = function();
     if(load is Success){
       onSuccess();
     }else if(load is Error && onFailure != null){
       onFailure();
     }
     data = load;
   });
 }catch(e){
   if (onFailure != null) {
     data = Error(e);
   }
 }
 return data;
}

