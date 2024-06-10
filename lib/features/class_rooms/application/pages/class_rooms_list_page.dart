import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/class_rooms/application/pages/class_room_detail_page.dart';
import 'package:classroom_manager/features/class_rooms/application/widgets/class_rooms_list_tile.dart';
import 'package:classroom_manager/features/students/application/pages/student_detail_page.dart';
import 'package:flutter/material.dart';

class ClassRoomsListPage extends StatelessWidget {
  const ClassRoomsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Class Rooms",
            style: TextStyle().HeadingTextStyle,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ClassRoomsListTile(
                      name: "Brown",
                      type: "Conference",
                      seats: "18",
                    ),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassRoomDetailPage(noOfSeats: 24, type: 'Class Room',)));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 6,
                  );
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
