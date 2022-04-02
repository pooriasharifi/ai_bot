


// ignore_for_file: annotate_overrides, prefer_const_constructors, override_on_non_overriding_member

import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/controllers/bottomNavController.dart';
import 'package:ai_bot/screen/views/alert.dart';
import 'package:ai_bot/screen/views/candle.dart';
import 'package:ai_bot/screen/views/home.dart';
import 'package:ai_bot/screen/views/profile.dart';
import 'package:ai_bot/screen/views/signal.dart';
import 'package:ai_bot/screen/views/support.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomNavBar extends GetView{
  @override
  final List<Widget> _children = [
    SignalPage(),
    AlertPage(),
    SupportPage(),
    ProfilePage()
  ];
  Widget build(BuildContext context) {
    BottomNavBarController controller =Get.put(BottomNavBarController());
    return GetBuilder<BottomNavBarController>(builder: (controller){
      return Scaffold(
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: background,

          selectedIndex: controller.currentIndex.value,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            controller.currentIndex.value = index;
            controller.update();
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: sec,
              inactiveColor: backLight,

              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.add_alert),
              title: Text('Alert'),
              activeColor: sec,
              inactiveColor: backLight,

              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.support_agent),
              title: Text(
                'Support ',
              ),
              activeColor: sec,
              inactiveColor: backLight,

              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: sec,
              inactiveColor: backLight,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: _children[controller.currentIndex.value],
      );
    });
  }
}