import 'package:ai_bot/screen/Models/history.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignalController extends GetxController{
  RxBool loading = true.obs;
  RxList<CandleData> data = MockDataTesla.candles.obs;
  RxBool darkMode = true.obs;
  RxBool showAverage = true.obs;
  RxBool sell= false.obs;
  RxBool buy= false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _handleSignal();
  }

  void _handleSignal() async{
    await Future.delayed(Duration(seconds: 4));
    loading=false.obs;
    update();
  }
  void sellIndicator()async{
    await Future.delayed(Duration(seconds: 10));
    if(sell==true){sell=false.obs;}else{sell=true.obs;}
    update();
    buyIndicator();
  }

  void buyIndicator() async{
    await Future.delayed(Duration(seconds: 5));
    if(buy==true){buy=false.obs;}else{buy=true.obs;}
    update();
    sellIndicator();
    }


}