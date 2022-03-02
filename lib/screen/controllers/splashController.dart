import 'dart:async';

import 'package:get/get.dart';


class Splash_controller extends GetxController{
  bool firstLogin =false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _handleSplash();
  }

  void _handleSplash() async{
    await Future.delayed(Duration(seconds: 2));
    firstLogin ? null : Get.offNamed('/login');
  }
}