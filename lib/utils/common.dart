import 'package:flutter/material.dart';
import 'package:play/widget/default_widget.dart';

void changeScreen(BuildContext context, Widget widget) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

void changeScreenRemoveUntil(
  BuildContext context,
  Widget widget,
) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

void showDefaultDialog(BuildContext context, Widget widget) {
  Navigator.of(context).push(PageRouteBuilder(
    opaque: false,
    pageBuilder: (ctx, _, __) => DefaultDialog( widget: widget,),
    transitionsBuilder: (ctx, anim1, anim2, child) {
      final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 300, 0.0),
        child: Opacity(
          opacity: anim1.value,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
  ));
}
