import 'dart:ui';

import 'package:flutter/material.dart';

class SceneContainer extends StatelessWidget {
  final double screenWidth;
  final String bgImage;
  final Widget containerChild;

  const SceneContainer(
      {super.key,
      required this.bgImage,
      required this.screenWidth,
      required this.containerChild});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 70),
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: const ColorFilter.mode(
                      Colors.black, BlendMode.difference),
                  fit: BoxFit.fill,
                  image: AssetImage(bgImage)),
              borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Positioned(
                  width: screenWidth * 0.7,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: containerChild),
                  ))
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
