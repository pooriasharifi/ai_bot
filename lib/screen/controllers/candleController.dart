import 'package:ai_bot/screen/Models/history.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';


class CandleController extends GetxController{
RxBool loading = true.obs;
RxList<CandleData> data = MockDataTesla.candles.obs;
@override
  void onClose() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
    super.onClose();
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
void handlecandle() async{
  await Future.delayed(Duration(seconds: 2));
  loading=false.obs;
  update();
}

}