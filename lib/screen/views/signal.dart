import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/preference.dart';
import 'package:ai_bot/screen/controllers/signalController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';

class SignalPage extends GetView{

  @override

  Widget build(BuildContext context) {
    return SafeArea(child: _builBody());
  }

 Widget _builBody() {
   SignalController controller =Get.put(SignalController());

   return GetBuilder<SignalController>(builder: (controller){
     controller.buyIndicator();
     controller.sellIndicator();
     if(controller.loading.value==true){
       return Center(child: SpinKitFadingCircle(color: sec,),);
     }
     return Scaffold(
       appBar: AppBar(
         actions: [
           GestureDetector(
               onTap: (){
                 Get.toNamed('/candle');
               },
               child: Icon(Icons.fullscreen))
         ],
         title: Text('${SimpleUserPreferences.getNameSignalPage()}'),
       ),
       body: SingleChildScrollView(
         child: Center(
           child: Padding(
             padding: const EdgeInsets.symmetric(vertical: 20),
             child: Column(
               children: [
                 Container(
                   height: Get.height/2,
                   child: InteractiveChart(
                     candles: controller.data.value,
                     style: ChartStyle(
                       volumeColor: grey.withOpacity(0.8),
                     ),
                   ),
                 ),
                 
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 20),
                   child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit',
                     style: Get.textTheme.headline3),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       width: Get.width/3,
                       height: 35,
                       color: controller.sell.value?Colors.red:Colors.red.withOpacity(.2),
                       child: Center(
                           child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Sell',style: Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.w900),),
                     Icon(Icons.arrow_drop_down_sharp,color: wh,)
                   ],
                 )),
                     ),
               SizedBox(width: 10,)
               ,Container(
                       width: Get.width/3,
                       height: 35,
                       color: controller.buy.value?Colors.green:Colors.green.withOpacity(.2),
                       child: Center(child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Buy',style: Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.w900),),
                           Icon(Icons.arrow_drop_up_sharp,color: wh,)
                         ],
                       )),
                     ),
                   ],
                 )
               ],
             ),
           ),
         ),
       ),
     );
    });
 }

}