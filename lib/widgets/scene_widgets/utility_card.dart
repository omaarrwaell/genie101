import 'package:flutter/material.dart';
import 'package:genie101/constants/app_fonts.dart';

class UtilityCard extends StatelessWidget {
  final String utilityName;
  final Icon utilityIcon;
  final Color bgColor;
  final Function() utilityFunction;
  const UtilityCard(
      {super.key,
      required this.utilityName,
      required this.utilityIcon,
      required this.bgColor,
      required this.utilityFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            onTap: utilityFunction,
            child: Container(
                height: 100,
                width: utilityName.length > 5 ? 130 : 70,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    utilityIcon,
                    Text(utilityName,
                        style: bgColor == Colors.white
                            ? AppFonts.selectedFont
                            : AppFonts.normalFont),
                  ],
                ))),
        const SizedBox(height: 8),
      ],
    );
  }
}
