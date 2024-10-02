import 'package:flutter/material.dart';
import 'package:genie101/constants/app_fonts.dart';
import 'package:genie101/views/scenes_view/scenes_view_controller.dart';
import 'package:genie101/widgets/scene_widgets/conditioner_body.dart';
import 'package:genie101/widgets/scene_widgets/lamp_body.dart';
import 'package:genie101/widgets/scene_widgets/utility_card.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../widgets/scene_widgets/fan_body.dart';

class ScenesView extends StatelessWidget {
  double? screenHeigth;
  double? screenWidth;
  final _utilitiesBody = [FanBody(), ConditionerBody(), LampBody()];
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
                ? screenHeigth! * 0.18
                : screenHeigth! * 0.15,
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
                    Obx(
                      () => UtilityCard(
                          utilityName: _scenesViewController.utilities[index],
                          utilityIcon: Icon(
                              _scenesViewController.utilityIcons[index],
                              size: 35,
                              color:
                                  index == _scenesViewController.currentIndex()
                                      ? Colors.black
                                      : Colors.white),
                          bgColor: index == _scenesViewController.currentIndex()
                              ? Colors.white
                              : AppColors.colorTexture,
                          utilityFunction: () {
                            _scenesViewController.currentIndex(index);
                          }),
                    ),
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
            child: Obx(() => AnimatedSwitcher(
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.5, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                  duration: const Duration(milliseconds: 300),
                  child: IndexedStack(
                    key: ValueKey<int>(_scenesViewController.currentIndex()),
                    index: _scenesViewController.currentIndex(),
                    children: _utilitiesBody,
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
