import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/modules/textFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';



class HomePage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildBody());
  }

 Widget _buildBody()=>Scaffold(
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
           child: GestureDetector(
             child: Btn(
               customWidth: true,
               customWidthtSize: Get.width/3,
               customHeight: true,
               customHeightSize: 35.toDouble(),
               hasBorder: true,
              iconBtn: true,
               itemIcon: Icon(Icons.arrow_drop_down_sharp,color: wh,size: 20,),
               title: 'filter',
             ),
             onTap: ()=>Get.bottomSheet(Container(
               color: backLight,
               height: 300,
               width: Get.width,
             )),
           ),
         ),
       Expanded(
         child: ListView.builder(
             itemCount: 20,
             itemBuilder: (BuildContext context, int index) {
               return ListTile(
                 // shape:  RoundedRectangleBorder(
                 //   side: BorderSide(
                 //     color: Colors.green.shade300,
                 //   ),),
                 style: ListTileStyle.drawer,
                 title: Text(
                   'usd/gpy',
                   style: Get.textTheme.headline3,
                 ),
                 iconColor: wh,
                 leading: Icon(Icons.circle),
                 contentPadding: EdgeInsets.symmetric(vertical: 5),
                 onTap: ()=>Get.toNamed('/signal'),

               );
             }),
       )
       ],
     ),
   ),
 );
}