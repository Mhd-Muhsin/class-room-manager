import 'package:flutter/material.dart';

extension TextStyleHelpers on TextStyle {

 TextStyle get HomeMenuItemTextStyle => TextStyle(
     color: Colors.black,
     fontSize: 18,
     fontWeight: FontWeight.w600);

 TextStyle get HeadingTextStyle => copyWith(
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

}
