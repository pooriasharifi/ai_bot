
import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/textFeild.dart';
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
   return GetBuilder<ProfileController>(builder: (controller){
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: CircleAvatar(
                        maxRadius: 80,
                        backgroundColor: backLight,
                        child: Text('P',style: Get.textTheme.headline1,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Email',style: Get.textTheme.headline3,),
                  ),
                  Btn(
                    hasBorder: true,
                    title: 'example@mail.com',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Expiration',style: Get.textTheme.headline3,),
                  ),
                  Btn(
                    hasBorder: true,
                    title: '22/10/2022',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Text('Password',style: Get.textTheme.headline3,),
                        SizedBox(width: 5,),
                        GestureDetector(
                            onTap: (){
                              controller.password.value?controller.password.value=false:controller.password.value=true;
                              controller.refresh();
                            },
                            child: Icon(Icons.remove_red_eye_rounded,color: sec,))
                      ],
                    ),
                  ),
                  Btn(
                    hasBorder: true,
                    title: controller.password.value?'**********':'123456789',

                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
 }
}