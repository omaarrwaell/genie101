import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie101/views/scenes_view/scenes_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../constants/app_colors.dart';

class ConditionerBody extends StatelessWidget {
  double? screenWidth;
  double? screenHeigth;
  ConditionerBody({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InteractiveSlider(
          focusedHeight: 60,
          unfocusedHeight: 60,
          onChanged: (value) =>
              Get.find<ScenesViewController>().monitorAc(value.toInt()),
          startIcon: const Icon(
            Symbols.mode_cool,
            color: Colors.blue,
            size: 45,
          ),
          endIcon: const Icon(
            Symbols.cool_to_dry,
            color: Colors.red,
            size: 45,
          ),
          min: 19,
          max: 32,
          gradientSize: GradientSize.totalWidth,
          gradient: const LinearGradient(colors: [
            Colors.blue,
            Colors.purple,
            Colors.red,
            Colors.redAccent,
          ]),
        ),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: AppColors.defaultBgColor,
              borderRadius: BorderRadius.circular(200)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  Get.find<ScenesViewController>().acTemp().toString(),
                  style:
                      GoogleFonts.poppins(fontSize: 100, color: Colors.white),
                ),
              ),
              Text(
                "° C",
                style: GoogleFonts.poppins(
                    fontSize: 35,
                    color: const Color.fromARGB(255, 113, 112, 112)),
              )
            ],
          ),
        ),
        Text(
          "Adjust the control to find the best\n temperature you need.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 64, 86, 104), fontSize: 16),
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
