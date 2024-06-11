import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension TextStyleHelpers on TextStyle {

 TextStyle get homeMenuItemTextStyle => TextStyle(
     color: Colors.black,
     fontSize: 18,
     fontWeight: FontWeight.w600);

 TextStyle get headingTextStyle => copyWith(
     color: Colors.black,
     fontSize: 22,
     fontWeight: FontWeight.w800);

 TextStyle get subHeadingTextStyle => TextStyle(
     color: Colors.black,
     fontSize: 22,
     fontWeight: FontWeight.w500);

 TextStyle get lightHeadingTextStyle => TextStyle(
     color: Colors.black,
     fontSize: 17,
     fontWeight: FontWeight.w500);

 TextStyle get listTileTitleTextStyle => TextStyle(fontWeight: FontWeight.bold);

 TextStyle get listTileSubTitleTextStyle => TextStyle(fontWeight: FontWeight.bold);

 TextStyle get listTileTrailingTextStyle => TextStyle(fontWeight: FontWeight.bold, fontSize: 15);

 TextStyle get snackBarTextStyle => TextStyle(
     color: AppColors.greenShadeButtonText,
     fontSize: 18,
     fontWeight: FontWeight.w600);

}
