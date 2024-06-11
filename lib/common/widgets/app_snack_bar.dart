import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

showAppSnackBar({required BuildContext context, required String text}){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text,
      textAlign: TextAlign.center,
      style: TextStyle().snackBarTextStyle,
    ),
    backgroundColor: AppColors.greenShadeButtonBackground,
  ));
}