import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class FanBody extends StatelessWidget {
  FanBody({
    super.key,
  });

  double? screenHeigth;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          child: Image.asset(
            "assets/images/fan.png",
            height: screenHeigth! * 0.4,
          ),
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              Colors.orange,
              Colors.teal,
              Colors.orange,
            ]).createShader(bounds);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.25,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Low",
                    style: AppFonts.normalFont,
                  ))),
            ),
            InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.25,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Medium",
                    style: AppFonts.normalFont,
                  ))),
            ),
            InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.25,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "High",
                    style: AppFonts.normalFont,
                  ))),
            ),
          ],
        ),
        InkWell(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 50,
              width: screenWidth! * 0.88,
              decoration: BoxDecoration(
                  color: AppColors.colorTexture,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.power,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Turn Off",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        wordSpacing: 1,
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
