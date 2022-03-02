
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constans.dart';

class Btn extends StatelessWidget {
  const Btn(
      {Key? key,
        this.alignmentText,
        this.customAlignmentText = false,
        this.hasBorder,
        this.title,
        this.customHeightSize,
        this.customHeight = false,
        this.customWidth=false,
        this.customWidthtSize,
  this.itemIcon,
  this.iconBtn=false
      })
      : super(key: key);
  final hasBorder;
  final customAlignmentText;
  final alignmentText;
  final title;
  final customHeight;
  final customWidth;
  final customHeightSize;
  final customWidthtSize;
  final iconBtn;
  final itemIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeight ? customHeightSize : 60,
      width: customWidth?customWidthtSize:Get.width - 30,
      decoration: BoxDecoration(
          color: hasBorder ? backLight : null,
          gradient: hasBorder?null:LinearGradient(colors: [
            sec,
            // background6,

            background4,


          ]),
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(color: backLight)
              : Border.fromBorderSide(BorderSide.none)),
      child: Container(
        alignment: customAlignmentText ? alignmentText : Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          iconBtn ?
          [

            Text(
              title,
              style: hasBorder ? Get.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w900
              ) : Get.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w900
              ),
            ),
            SizedBox(width: 10,),
            itemIcon
          ]:[
            Text(
              title,
              style: hasBorder ? Get.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w900
              ) : Get.textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w900
              ),
            ),
          ],
        ),
      ),
    );
  }
}
