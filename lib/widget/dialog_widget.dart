import 'package:flutter/material.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: AlertDialog(
          title: Text(
            "ERROR",
            style: TextStyle(
              color: Colors.red,
              fontSize: kFontLargeSize,
            ),
          ),
          content: SizedBox(
            height: SizeConfig.screenHeight! * 0.05,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: message,
                        style: TextStyle(
                            color: Colors.white, fontSize: kFontMediumSize),
                      ),
                    ],
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "ปิด",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: kFontMediumSize,
                ),
              ),
            ),
          ],
          backgroundColor: const Color(0xff292929),
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final void Function()? onPress;
  const SuccessDialog(
      {required this.message, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SimpleDialog(
        backgroundColor: const Color(0xff292929),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 40),
            Text(
              message,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: kFontMediumSize),
            ),
            const SizedBox(height: 20),
          ],
        ),
        children: [
          TextButton(
              onPressed: onPress ?? () => Navigator.of(context).pop(),
              child: Text("OK",
                  style: TextStyle(
                    fontSize: kFontMediumSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ))),
        ],
      ),
    );
  }
}

class ConditionDialog extends StatelessWidget {
  final String message;
  final String? dangerMessage;
  final void Function()? onPressYes;
  final void Function()? onPressNo;
  const ConditionDialog(
      {required this.message,
      required this.onPressYes,
      required this.onPressNo,
      this.dangerMessage = '',
      super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SimpleDialog(
        backgroundColor: const Color(0xff292929),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: getProportionateScreenHeight(40)),
            Center(
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: kFontMediumSize),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: onPressYes ?? () => Navigator.of(context).pop(),
                child: Text(
                  "YES",
                  style: TextStyle(
                    fontSize: kFontMediumSize,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: onPressNo ?? () => Navigator.of(context).pop(),
                child: Text(
                  "NO",
                  style: TextStyle(
                    fontSize: kFontMediumSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    
    );
  }
}
