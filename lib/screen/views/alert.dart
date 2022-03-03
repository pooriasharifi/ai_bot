
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/controllers/alertController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AlertPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildBody());
  }

 Widget _buildBody() {

    AlertController controller =Get.put(AlertController());
    controller.alertHandle();
    return GetBuilder<AlertController>(builder: (controller){
      if(controller.loading.value==true){
        return Center(child: SpinKitFadingCircle(color: sec,),);

      }return Scaffold();
    });
 }
}