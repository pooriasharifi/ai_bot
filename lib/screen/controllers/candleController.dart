import 'package:ai_bot/screen/Models/history.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';


class CandleController extends GetxController{
RxBool loading = true.obs;
RxBool macd=true.obs;
RxBool rsi=true.obs;
RxBool ema20=false.obs;
RxBool ema50=false.obs;
RxBool ema100=false.obs;
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


computeTrendLines() {
  CandleController controller = Get.put(CandleController());

  final ma20 = CandleData.computeMA(data, 7);


  for (int i = 0; i < data.length; i++) {
    data[i].trends = [ma20[i]];
  }
}
removeTrendLines() {
  for (final data in data) {
    data.trends = [];
  }
}

}