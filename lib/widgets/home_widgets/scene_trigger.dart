import 'package:flutter/material.dart';

class SceneTrigger extends StatelessWidget {
  final Icon sceneIcon;
  final Color bgColor;
  final Function() sceneFunction;
  const SceneTrigger(
      {super.key,
      required this.sceneIcon,
      required this.bgColor,
      required this.sceneFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        onTap: sceneFunction,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(40)),
          child: bgColor == Colors.transparent
              ? Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: const Border.fromBorderSide(
                          BorderSide(color: Colors.white, width: 1)),
                      borderRadius: BorderRadius.circular(40)),
                  child: sceneIcon,
                )
              : sceneIcon,
        ));
  }
}
