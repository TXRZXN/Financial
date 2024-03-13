import 'package:flutter/material.dart';
import 'package:play/utils/size_config.dart';

class AddWidget extends StatelessWidget {
  final String img;
  final String name;

  const AddWidget({
    required this.img,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.28,
      height: SizeConfig.screenHeight! * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(img, height: SizeConfig.screenHeight! * 0.1),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
