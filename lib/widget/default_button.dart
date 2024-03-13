// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  final bool enabled;

  const DefaultButton({
    required this.text,
    required this.onPress,
    required this.color,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    var width = SizeConfig.screenWidth;
    return SizedBox(
      width: width,
      height: getProportionateScreenWidth(50),
      child: ElevatedButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: enabled ? color : Colors.black45,
          elevation: enabled ? 2 : 0,
        ),
        onPressed: enabled ? () => onPress() : null,
        child: Text(
          text,
          style: TextStyle(
              fontSize: kFontMediumSize,
              color: enabled ? Colors.white : Colors.white70),
        ),
      ),
    );
  }
}
