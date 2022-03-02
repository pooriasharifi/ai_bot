import 'package:ai_bot/screen/Models/history.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';

class SignalController extends GetxController{
  RxBool loading = true.obs;
  RxList<CandleData> data = MockDataTesla.candles.obs;
  RxBool darkMode = true.obs;
  RxBool showAverage = true.obs;

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
}