import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StudentsListTile extends StatelessWidget {
  const StudentsListTile({super.key, this.name, this.email, this.age});

  final String? name;
  final String? email;
  final String? age;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.appGrey,
        child: ListTile(
          title: Text("$name", style: TextStyle().listTileTitleTextStyle,),
          subtitle: Text("$email", style: TextStyle().listTileSubTitleTextStyle,),
          trailing: Text("Age : $age", style: TextStyle().listTileTrailingTextStyle,)
        )
    );
  }
}
