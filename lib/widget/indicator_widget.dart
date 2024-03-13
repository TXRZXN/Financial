import 'package:flutter/material.dart';
import 'package:play/utils/size_config.dart';

class Indicator extends StatefulWidget {
  final Color color;
  final String text;
  const Indicator({
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);
  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: getProportionateScreenHeight(20),
          width: getProportionateScreenWidth(20),
          color: widget.color,
        ),
        Text(
          ' ${widget.text}',
          style: TextStyle(
            color: Colors.white,
            fontSize: getProportionateScreenHeight(20),
          ),
        )
      ],
    );
  }
}
