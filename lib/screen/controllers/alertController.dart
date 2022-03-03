import 'package:get/get.dart';


class AlertController extends GetxController{
  RxBool loading = true.obs;



  void alertHandle() async{
    await Future.delayed(Duration(seconds: 2));
    loading=false.obs;
    update();
  }
}