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
RxList<CandleData> data20 = MockDataTesla.candles.obs;
RxList<CandleData> data50 = MockDataTesla.candles.obs;
RxList<CandleData> data100 = MockDataTesla.candles.obs;

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
    print(ema20);
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

//all

  comparison(){
if(ema20.isTrue&&ema50.isTrue&&ema100.isTrue){
  computeTrendLines() {
    final ma20 = CandleData.computeMA(data, 20);
    final ma50 = CandleData.computeMA(data, 50);
    final ma100 = CandleData.computeMA(data, 100);

    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma20[i], ma50[i], ma100[i]];
    }

  }

  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  removeTrendLines();
  computeTrendLines();
  update();

}else if(ema20.isTrue&&ema50.isTrue&&ema100.isFalse){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma20 = CandleData.computeMA(data, 20);
    final ma50 = CandleData.computeMA(data, 50);

    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma20[i], ma50[i]];
    }

  }
  removeTrendLines();
  computeTrendLines();
  update();

}else if(ema20.isTrue&&ema100.isTrue&&ema50.isFalse){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma20 = CandleData.computeMA(data, 20);
    final ma100 = CandleData.computeMA(data, 100);

    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma20[i], ma100[i]];
    }

  }
  removeTrendLines();
  computeTrendLines();
  update();

}else if(ema50.isTrue&&ema100.isTrue&&ema20.isFalse){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma50 = CandleData.computeMA(data, 50);
    final ma100 = CandleData.computeMA(data, 100);

    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ ma50[i], ma100[i]];
    }

  }
  removeTrendLines();
  computeTrendLines();
  update();

}else if(ema20.isFalse&&ema50.isFalse&&ema100.isFalse){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }

  removeTrendLines();
  update();

}else if(ema20.isTrue){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma20 = CandleData.computeMA(data, 20);


    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma20[i]];
    }

  }
  removeTrendLines();
  computeTrendLines();
  update();
}else if(ema50.isTrue){
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma50 = CandleData.computeMA(data, 50);


    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma50[i]];
    }

  }
  removeTrendLines();
  computeTrendLines();
  update();

}else {
  removeTrendLines() {
    for (final data in data) {
      data.trends = [];
    }
  }
  computeTrendLines() {
    final ma100 = CandleData.computeMA(data, 100);


    for (int i = 0; i < data.length; i++) {
      data[i].trends = [ma100[i]];
    }

  }

  removeTrendLines();
  computeTrendLines();
  update();

}


  }








}