import 'package:flutter/material.dart';
import 'package:genie101/constants/app_fonts.dart';
import 'package:genie101/widgets/scene_widgets/utility_card.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

List<String> xy = ['xbox', 'speakers', "tv", "car", "Conditioner"];

class ScenesView extends StatelessWidget {
  double? screenHeigth;
  double? screenWidth;
  ScenesView({super.key});
  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.defaultBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.defaultBgColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text(
          "Living Room",
          style: AppFonts.titleFont,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.view_quilt,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeigth! < 800
                ? screenHeigth! * 0.25
                : screenHeigth! * 0.2,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: xy.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    UtilityCard(
                        utilityName: xy[index],
                        utilityIcon: const Icon(Icons.abc_outlined),
                        bgColor: AppColors.colorTexture,
                        utilityFunction: () {}),
                  ],
                );
              },
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: AppColors.darkBgColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ))
        ],
      ),
    );
  }
}
