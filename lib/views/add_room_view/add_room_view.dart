import 'package:flutter/material.dart';
import 'package:genie101/constants/app_colors.dart';

import '../../constants/app_fonts.dart';

class AddRoomView extends StatelessWidget {
  const AddRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.defaultBgColor,
        foregroundColor: Colors.white,
        title: Text("Add Room", style: AppFonts.titleFont),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_rounded))
        ],
        actionsIconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
    );
  }
}
