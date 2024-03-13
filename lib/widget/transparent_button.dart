import 'package:flutter/material.dart';
import 'package:play/utils/size_config.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final Function press;
  final bool enabled;

  const TransparentButton({
    required this.text,
    required this.press,
    this.enabled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => press() : null,
      child: Container(
        width: SizeConfig.screenWidth,
        height: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.transparent,
            border: Border.all(color: enabled ? Colors.white : Colors.grey)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: enabled ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
