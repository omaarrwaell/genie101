import 'package:flutter/material.dart';
import 'package:genie101/constants/app_fonts.dart';
import 'package:genie101/views/home/home_view_controller.dart';
import 'package:genie101/widgets/scene_widget.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  late final double screenHeigth;
  late final double screenWidth;
  final HomeViewController _homeViewController = Get.put(HomeViewController());
  @override
  Widget build(BuildContext context) {
    screenHeigth = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColors.defaultBgColor,
      appBar: AppBar(
          backgroundColor: AppColors.defaultBgColor,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Morning !",
                style: AppFonts.defaultFont,
              ),
              SizedBox(
                child: Icon(
                  Icons.fiber_smart_record_sharp,
                  size: 100,
                  color: AppColors.colorTexture,
                ),
              )
            ],
          )),
      body: Column(
        children: [
          SizedBox(
              height:
                  screenHeigth < 800 ? screenHeigth * 0.2 : screenHeigth * 0.15,
              width: screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100,
                    child: Obx(() => SceneWidget(
                        sceneName: _homeViewController.names[index],
                        sceneIcon: _homeViewController.icons[index],
                        bgColor: _homeViewController.selectedIcon() ==
                                _homeViewController.icons[index]
                            ? Colors.white
                            : Colors.grey[800]!,
                        sceneFunction: () {
                          _homeViewController
                              .selectedIcon(_homeViewController.icons[index]);
                        })),
                  );
                },
              )),
          Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 19, 26, 32),
                      borderRadius: BorderRadius.circular(30))))
        ],
      ),
    );
  }
}
