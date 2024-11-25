import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:genie101/views/scenes_view/scenes_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_slider/interactive_slider.dart';
import '../../Icons/custom_icons.dart';
import '../../constants/app_colors.dart';

class LampBody extends StatelessWidget {
  double? screenWidth;
  double? screenHeigth;
  LampBody({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ColorPicker(
          pickerAreaHeightPercent: screenHeigth! < 800 ? 0.7 : 1,
          colorPickerWidth: screenWidth! * 0.6,
          pickerColor: Get.find<ScenesViewController>().selectedColor(),
          displayThumbColor: false,
          onColorChanged: (color) =>
              Get.find<ScenesViewController>().monitorColor(color),
          portraitOnly: false,
          showLabel: false,
          hexInputBar: false,
          enableAlpha: false,
          pickerAreaBorderRadius: BorderRadius.circular(200),
        ),
        Obx(
          () => InteractiveSlider(
            focusedHeight: 60,
            unfocusedHeight: 60,
            foregroundColor: Get.find<ScenesViewController>().selectedColor(),
            startIcon: Icon(
              CustomIcons.sun,
              color: Get.find<ScenesViewController>().selectedColor(),
              size: 25,
            ),
            endIcon: Icon(
              CustomIcons.sun_filled,
              color: Get.find<ScenesViewController>().selectedColor(),
              size: 25,
            ),
            min: 19,
            max: 32,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async =>
                  await Get.find<ScenesViewController>().toggleHue(),
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  height: 50,
                  width: screenWidth! * 0.6,
                  decoration: BoxDecoration(
                      color: AppColors.colorTexture,
                      borderRadius: BorderRadius.circular(10)),
                  child: Obx(() => Get.find<ScenesViewController>().isHueOn()
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
                            ),
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
                            ),
                          ],
                        ))),
            ),
            InkWell(
              onTap: () async =>
                  await Get.find<ScenesViewController>().fireHue(),
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
                        "Monitor",
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
