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
  ConditionerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InteractiveSlider(
          focusedHeight: 60,
          unfocusedHeight: 60,
          initialProgress:
              (Get.find<ScenesViewController>().acTemp().toDouble() - 19) /
                  (32 - 19),
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
          height:
              screenHeigth! >= 800 ? screenHeigth! * 0.3 : screenHeigth! * 0.32,
          width: screenWidth! * 0.69,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async =>
                  await Get.find<ScenesViewController>().toggleAc(),
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.6,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Obx(() => Get.find<ScenesViewController>().isAcOn()
                      ? Row(
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
                              "Turn off",
                              style: GoogleFonts.poppins(
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.power,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Turn on",
                              style: GoogleFonts.poppins(
                                  letterSpacing: 1,
                                  wordSpacing: 1,
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ))),
            ),
            InkWell(
              onTap: () async =>
                  await Get.find<ScenesViewController>().fireAc(),
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.35,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.drag_indicator_outlined,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Toggle",
                        style: GoogleFonts.poppins(
                            letterSpacing: 1,
                            wordSpacing: 1,
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
