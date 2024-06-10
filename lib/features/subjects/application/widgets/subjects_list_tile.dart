import 'dart:ffi';

import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SubjectsListTile extends StatelessWidget {
  const SubjectsListTile({super.key, this.name, this.teacher, this.credit});

  final String? name;
  final String? teacher;
  final String? credit;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.appGrey,
        child: ListTile(
            title: Text("$name", style: TextStyle().listTileTitleTextStyle,),
            subtitle: Text("$teacher", style: TextStyle().listTileSubTitleTextStyle,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$credit", style: TextStyle().listTileTrailingTextStyle,),
                Text("Credit", style: TextStyle().listTileTrailingTextStyle,),
              ],
            ),
        )
    );
  }
}
