import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ClassRoomsListTile extends StatelessWidget {
  const ClassRoomsListTile({super.key, this.name, this.layout, this.size});

  final String? name;
  final String? layout;
  final size;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.appGrey,
        child: ListTile(
            title: Text("$name", style: TextStyle().listTileTitleTextStyle,),
            subtitle: Text("$layout", style: TextStyle().listTileSubTitleTextStyle,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$size", style: TextStyle().listTileTrailingTextStyle,),
                Text("Seats", style: TextStyle().listTileTrailingTextStyle,),
              ],
            )
        )
    );
  }
}