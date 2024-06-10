import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ClassRoomsListTile extends StatelessWidget {
  const ClassRoomsListTile({super.key, this.name, this.type, this.seats});

  final String? name;
  final String? type;
  final seats;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.appGrey,
        child: ListTile(
            title: Text("$name", style: TextStyle().listTileTitleTextStyle,),
            subtitle: Text("$type", style: TextStyle().listTileSubTitleTextStyle,),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$seats", style: TextStyle().listTileTrailingTextStyle,),
                Text("Seats", style: TextStyle().listTileTrailingTextStyle,),
              ],
            )
        )
    );
  }
}