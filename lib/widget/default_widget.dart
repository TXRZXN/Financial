import 'package:flutter/material.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';

class DefaultDialog extends StatelessWidget {
  final Widget widget;

  const DefaultDialog({
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "ปิด",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: getProportionateScreenWidth(kFontLargeSize),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              widget
            ],
          ),
        ),
      ),
    );
  }
}
