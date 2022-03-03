import 'package:get/get.dart';


class ProfileController extends GetxController{
  RxBool loading = true.obs;
  RxBool password = true.obs;


  profileHandle() async {
    await Future.delayed(Duration(seconds: 2));
    loading=false.obs;
    update();
  }

}