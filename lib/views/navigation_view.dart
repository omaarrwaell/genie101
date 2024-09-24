import 'package:flutter/material.dart';
import 'package:genie101/constants/app_colors.dart';
import 'package:genie101/views/home/home_view.dart';
import 'package:genie101/views/profile_view.dart';
import 'package:genie101/views/scene_view.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends StatelessWidget {
  NavigationView({super.key});
  final navigationController = Get.put(NavigationController());
  final screens = [HomeView(), const SceneView(), const ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(255, 223, 234, 243),
        body: Obx(
          () => IndexedStack(
            index: navigationController.selectedIndex(),
            children: screens,
          ),
        ),
        bottomNavigationBar: Obx(() => SalomonBottomBar(
                curve: Curves.easeInOut,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                duration: const Duration(milliseconds: 300),
                onTap: (index) => navigationController.changeIndex(index),
                currentIndex: navigationController.selectedIndex(),
                backgroundColor: AppColors.defaultBgColor,
                selectedItemColor: const Color.fromARGB(255, 141, 138, 241),
                unselectedItemColor: const Color.fromARGB(255, 124, 114, 114),
                selectedColorOpacity: 1,
                items: [
                  SalomonBottomBarItem(
                    activeIcon: const Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    icon: const Icon(Icons.home_outlined,
                        color: Color.fromARGB(255, 124, 114, 114)),
                    title: const Text("Home",
                        style: TextStyle(color: Colors.white)),
                  ),

                  /// Search
                  SalomonBottomBarItem(
                    activeIcon: const Icon(
                      Icons.add_circle_sharp,
                      color: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.add_circle_sharp,
                      color: Color.fromARGB(255, 85, 84, 84),
                    ),
                    title: const Text(
                      "Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SalomonBottomBarItem(
                    activeIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    icon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 85, 84, 84),
                    ),
                    title: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  /// Profile
                ])));
  }
}
