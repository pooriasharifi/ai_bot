import 'package:ai_bot/modules/button.dart';
import 'package:ai_bot/modules/textFeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';


class LoginPage extends GetView{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _buildBody());
  }

 Widget _buildBody()=>Scaffold(
   appBar: AppBar(
     title: Text('Login'),
   ),
   body: SingleChildScrollView(
     child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: Get.height*.2,),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 15),
             child: Text('Email',style: Get.textTheme.headline3,),
           ),
            TxtFeild(
              labelText: '',
              obscureText: false,
              prefixIcon: null,
              suffixIcon: null,
              textInputAction: TextInputAction.next,
              keyboadtype: TextInputType.emailAddress,
            ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 15),
             child: Text('Password',style: Get.textTheme.headline3,),
           ),
           TxtFeild(
             labelText: '',
             obscureText: false,
             prefixIcon: null,
             suffixIcon: null,
             textInputAction: TextInputAction.done,
           ),
           SizedBox(height: 50,),
           GestureDetector(
             onTap: ()=>Get.offNamed('/menu'),
             child: Btn(

                title: 'Log in',
                hasBorder: false,
              ),
           )
         ],
       ),
     ),
   ),
 );
}
