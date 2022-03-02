import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/controllers/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';



class SplashPage extends StatelessWidget{

  @override

  Widget build(BuildContext context) {
  Splash_controller _splashController = Get.put(Splash_controller());
    return SafeArea(
      bottom: false,
      child: _buildBody(),
    );
  }

 Widget _buildBody()=>Scaffold(
   body: Column(
     children: <Widget>[
       SizedBox(height: Get.height/2-80,)
       ,Center(child: Text('Lorem Ipsum',style: Get.textTheme.headline1,)),
       Spacer(),
       Padding(
         padding: const EdgeInsets.all(35),
         child: Center(child: SpinKitFadingCircle(color: sec,),),
       )
     ],
   ),
 );
 

}