import 'package:flutter/material.dart';
import 'package:genie101/constants/app_colors.dart';
import 'package:genie101/constants/app_fonts.dart';

class SceneWidget extends StatelessWidget {
  final String sceneName;
  final Icon sceneIcon;
  final Color bgColor;
  final Function() sceneFunction;
  const SceneWidget(
      {super.key,
      required this.sceneName,
      required this.sceneIcon,
      required this.bgColor,
      required this.sceneFunction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            splashColor: Colors.transparent,
            borderRadius: BorderRadius.circular(40),
            onTap: sceneFunction,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(40)),
              child: bgColor == AppColors.colorTexture
                  ? sceneIcon
                  : Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          border: const Border.fromBorderSide(
                              BorderSide(color: Colors.black, width: 2)),
                          borderRadius: BorderRadius.circular(40)),
                      child: sceneIcon,
                    ),
            )),
        const SizedBox(height: 8),
        Text(sceneName, style: AppFonts.normalFont),
      ],
    );
  }
}
