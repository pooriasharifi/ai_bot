import 'dart:ui';

import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/preference.dart';
import 'package:ai_bot/modules/textFeild.dart';
import 'package:ai_bot/screen/Models/symbols.dart';
import 'package:ai_bot/screen/controllers/alertController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AlertPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildBody());
  }

 Widget _buildBody() {

    AlertController controller =Get.put(AlertController());
    controller.alertHandle();
    controller.setData();
    return GetBuilder<AlertController>(builder: (controller){
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
                          hasBorder: controller.today.value==false?true:false,

                          title: 'Today',
                        ),
                        onTap: () {
                          controller.today.value==true?controller.today.value=false:controller.today.value=true;
                          controller.weekly.value=false;
                          controller.yesterday.value=false;
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
                          hasBorder: controller.weekly.value==false?true:false,

                          title: 'Yesterday',
                        ),
                        onTap: () {
                          controller.weekly.value==true?controller.weekly.value=false:controller.weekly.value=true;
                          controller.today.value=false;
                          controller.yesterday.value=false;
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
                          hasBorder: controller.yesterday.value==false?true:false,

                          title: 'Weekly',
                        ),
                        onTap: () {
                          controller.yesterday.value==true?controller.yesterday.value=false:controller.yesterday.value=true;
                          controller.weekly.value=false;
                          controller.today.value=false;
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

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          color: bg,
                          elevation: 10,
                          shadowColor: background6,
                          borderRadius: BorderRadius.circular(1),
                          child: Container(
                            child: ListTile(
                              tileColor: bg,
                              subtitle: Align(
                                alignment: Alignment.center,
                                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',style: Get.textTheme.subtitle1!.copyWith(
                                    color: controller.txtColor.value['${data.id}'] ? Colors.green:Colors.red
                                ),
                                textAlign: TextAlign.center,
                                ),
                              ),
                              trailing: Text('22:32',style: Get.textTheme.subtitle1,),
                              minVerticalPadding: 60,

                              horizontalTitleGap: 20,
                              style: ListTileStyle.drawer,

                              title: Transform.translate(
                                offset: Offset(0, -35),

                                child: Text(
                                  data.name,
                                  style: Get.textTheme.headline3,
                                ),
                              ),
                              iconColor: wh,
                              leading: data.logoUrl.length == 0
                                  ? Container(height: 50,width: 50,)
                                  : data.logoUrl.split('.svg').length == 2
                                  ? (data.logoUrl.split('TRX').length == 2
                                  ? SvgPicture.network(
                                '${data.logoUrl.toString()}',
                                height: 50,
                                color: Colors.red,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                width: 50,
                              )
                                  : SvgPicture.network(
                                '${data.logoUrl.toString()}',
                                height: 50,

                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                width: 50,

                              ))
                                  : Image.network(
                                data.logoUrl,
                                height: 35,
                                width: 35,
                                fit: BoxFit.cover,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                              onTap: () async {
                                Get.toNamed('/signal');
                                await SimpleUserPreferences.setNameSignalPage(data.name);


                              },
                            ),
                          ),
                        ),
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