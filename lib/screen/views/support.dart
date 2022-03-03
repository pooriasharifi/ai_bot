
import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/textFeild.dart';
import 'package:ai_bot/screen/controllers/supportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: GestureDetector(
        onTap: (){

          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: _builBody()));
  }

 Widget _builBody() {
   SupportController controller = Get.put(SupportController());
return GetBuilder<SupportController>(builder: (controller){
  return Scaffold(
    appBar: AppBar(title: Text('Support'),),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(height: Get.height/12,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text('Subject',style: Get.textTheme.headline3,),
          ),
          TxtFeild(
            labelText: '',
            obscureText: false,
            prefixIcon: null,
            suffixIcon: null,
            textInputAction: TextInputAction.next,
            keyboadtype: TextInputType.emailAddress,
          ),
          SizedBox(height: 10,),
          Expanded(
            child: TxtFeild(
              customHeightSize: true,
              he: Get.height/6,
              maxLines: 15,
              labelText: '!Suggestions or Questions',

              obscureText: false,
              textInputAction: TextInputAction.newline,
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Btn(
              title: 'Send',
              iconBtn: true,
              itemIcon: Icon(Icons.send,color: wh,size: 20,),
              hasBorder: false,
            ),
          )

        ],
      ),
    ),
  );
});
 }
}