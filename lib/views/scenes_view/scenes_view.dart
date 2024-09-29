import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:genie101/constants/app_fonts.dart';
import 'package:genie101/views/scenes_view/scenes_view_controller.dart';
import 'package:genie101/widgets/scene_widgets/utility_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_colors.dart';

class ScenesView extends StatelessWidget {
  double? screenHeigth;
  double? screenWidth;
  final ScenesViewController _scenesViewController =
      Get.put(ScenesViewController());
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: screenHeigth! < 800
                ? screenHeigth! * 0.25
                : screenHeigth! * 0.2,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _scenesViewController.utilities.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    UtilityCard(
                        utilityName: _scenesViewController.utilities[index],
                        utilityIcon: _scenesViewController.utilityIcons[index],
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
            child: Column(
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
            ),
          ))
        ],
      ),
    );
  }
}
