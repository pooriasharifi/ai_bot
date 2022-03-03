import 'package:ai_bot/modules/constans.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtFeild extends StatelessWidget {
  const TxtFeild(
      {Key? key,
        this.keyboadtype,
        this.labelText,
        this.obscureText,
        this.onChanged,
        this.onSaved,
        this.prefixIcon,
        this.styleTextStyleTextForm,
        this.suffixIcon,
        this.textInputAction,
        this.validator,
        this.maxLines,
        this.wi,
        this.customWidthSize=false,
        this.he,
        this.minLine,
        this.customHeightSize=false

      })
      : super(key: key);
  final keyboadtype;
  final textInputAction;
  final onSaved;
  final onChanged;
  final validator;
  final styleTextStyleTextForm;
  final obscureText;
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final customWidthSize;
  final customHeightSize;
  final he;
  final wi;
  final maxLines;
  final minLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeightSize?he:60,
      width: customWidthSize? wi:Get.width - 30,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          cursorColor: sec,
          autofocus: false,
          maxLines: maxLines,
          keyboardType: keyboadtype,
          textInputAction: textInputAction,
          onSaved: onSaved,
          onChanged: onChanged,
          validator: validator,

          style: styleTextStyleTextForm,
          obscureText: obscureText,
          decoration: InputDecoration(
              labelText: labelText,

              fillColor: fill,
              labelStyle: Get.textTheme.subtitle1,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: backLight, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: sec, width: 1.5),
              ),
              prefixIcon: Icon(
                prefixIcon,
                size: 16,
                color: backLight,
              ),
              suffixIcon: Icon(
                suffixIcon,
                size: 16,
                color: backLight,
              )),
        ),
      ),
    );
  }
}
