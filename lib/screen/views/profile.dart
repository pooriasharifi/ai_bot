
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView{

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _builBody());

  }

 Widget _builBody() {
   ProfileController controller =Get.put(ProfileController());
controller.profileHandle();
   return Obx((){
      if(controller.loading.value){
        return Center(
          child: SpinKitFadingCircle(
            color: sec,
          ),
        );
      }return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),

        ),
      );
    });
 }
}