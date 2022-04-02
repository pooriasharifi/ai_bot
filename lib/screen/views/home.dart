import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/preference.dart';
import 'package:ai_bot/modules/textFeild.dart';
import 'package:ai_bot/screen/Models/symbols.dart';
import 'package:ai_bot/screen/controllers/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildBody());
  }

  Widget _buildBody() {
    HomeController controller = Get.put(HomeController());
  controller.setData();
    return GetBuilder<HomeController>(builder: (controller){
      if (controller.loading.value) {
        return Center(
          child: SpinKitFadingCircle(
            color: sec,
          ),
        );
      } else if (controller.err.value) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('error to connect Server',style: Get.textTheme.headline3,),
              SizedBox(height: 20,),
              GestureDetector(

                onTap: (){
                  controller.setData();
                  controller.loading.value=true;
                  controller.refresh();
                },
                child: Btn(
                  title: 'Refresh',
                  hasBorder: true,
                  customHeight: true,
                  customHeightSize: 40.toDouble(),
                  customWidth: true,
                  customWidthtSize: Get.width/2,
                ),
              )
            ],
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TxtFeild(
                labelText: 'Search',
                obscureText: false,
                textInputAction: TextInputAction.done,
                prefixIcon: Icons.search,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Btn(
                          customWidth: true,
                          customWidthtSize: Get.width / 3,
                          customHeight: true,
                          customHeightSize: 35.toDouble(),
                          hasBorder: true,
                          iconBtn: true,
                          itemIcon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: wh,
                            size: 20,
                          ),
                          title: 'filter',
                        ),
                        onTap: () => Get.bottomSheet(Container(
                          color: backLight,
                          height: 300,
                          width: Get.width,
                        )),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Btn(
                          customWidth: true,
                          customWidthtSize: Get.width / 3,
                          customHeight: true,
                          customHeightSize: 35.toDouble(),
                          hasBorder: controller.crypto.value==false?true:false,

                          title: 'crypto',
                        ),
                        onTap: () {
                          controller.crypto.value==true?controller.crypto.value=false:controller.crypto.value=true;
                          controller.stock.value=false;
                          controller.forex.value=false;
                          controller.setData();

                        },
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Btn(
                          customWidth: true,
                          customWidthtSize: Get.width / 3,
                          customHeight: true,
                          customHeightSize: 35.toDouble(),
                          hasBorder: controller.stock.value==false?true:false,

                          title: 'stock',
                        ),
                        onTap: () {
                          controller.stock.value==true?controller.stock.value=false:controller.stock.value=true;
                          controller.crypto.value=false;
                          controller.forex.value=false;
                          controller.setData();

                        },
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        child: Btn(
                          customWidth: true,
                          customWidthtSize: Get.width / 3,
                          customHeight: true,
                          customHeightSize: 35.toDouble(),
                          hasBorder: controller.forex.value==false?true:false,

                          title: 'forex',
                        ),
                        onTap: () {
                          controller.forex.value==true?controller.forex.value=false:controller.forex.value=true;
                          controller.stock.value=false;
                          controller.crypto.value=false;
                          controller.setData();

                        },
                      ),
                      SizedBox(width: 10,),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      FetchData data = controller.data[index];

                      return ListTile(
                        horizontalTitleGap: 20,
                        style: ListTileStyle.drawer,
                        title: Text(
                          data.name,
                          style: Get.textTheme.headline3,
                        ),
                        iconColor: wh,
                        leading: data.logoUrl.length == 0
                            ? Container(height: 35,width: 35,)
                            : data.logoUrl.split('.svg').length == 2
                                ? (data.logoUrl.split('TRX').length == 2
                                    ? SvgPicture.network(
                                        '${data.logoUrl.toString()}',
                                        height: 35,
                                        color: Colors.red,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                        width: 35,
                                      )
                                    : SvgPicture.network(
                                        '${data.logoUrl.toString()}',
                                        height: 35,

                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                        width: 35,

                                        // semanticsLabel: 'A shark?!',
                                        // placeholderBuilder: (BuildContext context) => Container(
                                        //     padding: const EdgeInsets.all(30.0),
                                        //     child: const CircularProgressIndicator()),
                                      ))
                                : Image.network(
                                    data.logoUrl,
                                    height: 35,
                                    width: 35,
                                    fit: BoxFit.cover,
                                  ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5),
                        onTap: () async {
                          Get.toNamed('/signal');
                          await SimpleUserPreferences.setNameSignalPage(data.name);


                        },
                      );
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
