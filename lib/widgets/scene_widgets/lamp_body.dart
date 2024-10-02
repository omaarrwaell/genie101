import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:genie101/views/scenes_view/scenes_view_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interactive_slider/interactive_slider.dart';
import '../../Icons/custom_icons.dart';

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
          pickerColor: Colors.red,
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
        InkWell(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 50,
              width: screenWidth! * 0.88,
              decoration: BoxDecoration(
                  color: const Color(0xff615FEC),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.power,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Turn Off",
                    style: GoogleFonts.poppins(
                        letterSpacing: 1,
                        wordSpacing: 1,
                        color: Colors.white,
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
