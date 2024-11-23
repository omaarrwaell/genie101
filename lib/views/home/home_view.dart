import 'package:flutter/material.dart';
import 'package:genie101/constants/app_fonts.dart';
import 'package:genie101/views/add_room_view/add_room_view.dart';
import 'package:genie101/views/home/home_view_controller.dart';
import 'package:genie101/views/scenes_view/scenes_view.dart';
import 'package:genie101/widgets/home_widgets/scene_container.dart';
import 'package:genie101/widgets/home_widgets/scene_trigger.dart';
import 'package:genie101/widgets/home_widgets/scene_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              const SizedBox(
                width: 80,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Image.asset(
                    "assets/images/genie-Photoroom.png",
                  ),
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
                            : AppColors.colorTexture,
                        sceneFunction: () {
                          _homeViewController
                              .selectedIcon(_homeViewController.icons[index]);
                        })),
                  );
                },
              )),
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.darkBgColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(30),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: _homeViewController.roomImages[index] == ""
                            ? () => Get.to(() => const AddRoomView(),
                                transition: Transition.rightToLeft)
                            : () => Get.to(() => ScenesView(),
                                transition: Transition.rightToLeft),
                        child: SceneContainer(
                          screenWidth: screenWidth,
                          bgImage: _homeViewController.roomImages[index],
                          containerChild: SizedBox(
                            height: screenHeigth * 0.15,
                            width: screenWidth,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      _homeViewController.rooms[index],
                                      style: AppFonts.largeFont,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text.rich(TextSpan(
                                        text: "2",
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                              text: "/5 is ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w200)),
                                          TextSpan(
                                              text: "on",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w400))
                                        ]))
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeigth * 0.084,
                                  width: screenWidth,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(left: 10),
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Obx(() => SceneTrigger(
                                              sceneIcon: Icon(
                                                _homeViewController
                                                    .triggerIcons[index],
                                                color: _homeViewController
                                                            .selectedTriggerIcon() ==
                                                        _homeViewController
                                                            .triggerIcons[index]
                                                    ? Colors.black
                                                    : const Color.fromARGB(
                                                        255, 218, 209, 209),
                                              ),
                                              bgColor: _homeViewController
                                                          .selectedTriggerIcon() ==
                                                      _homeViewController
                                                          .triggerIcons[index]
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              sceneFunction: () {
                                                _homeViewController
                                                    .selectedTriggerIcon(
                                                        _homeViewController
                                                                .triggerIcons[
                                                            index]);
                                              })),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ))),
        ],
      ),
    );
  }
}
