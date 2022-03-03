import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/controllers/candleController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';



class CandlePage extends GetView{
  const CandlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _builBody());
  }

Widget _builBody() {
    CandleController controller =Get.put(CandleController());
    return GetBuilder<CandleController>(builder: ((controller){
      controller.handlecandle();
      if(controller.loading.value){
        return Center(child: SpinKitFadingCircle(color: sec,),);

      }return Scaffold(
        body: InteractiveChart(
          candles: controller.data.value,
          style: ChartStyle(
            volumeColor: grey.withOpacity(0.8),
          ),
        ),
      );
    }));
}
}