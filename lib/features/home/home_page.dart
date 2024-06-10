import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/class_rooms/application/pages/class_rooms_list_page.dart';
import 'package:classroom_manager/features/students/application/pages/students_list_page.dart';
import 'package:classroom_manager/features/subjects/application/pages/subjects_list_page.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello,\nGood Morning'),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.menu : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: isGrid ? buildGrid() : buildList(),
      ),
    );
  }

  Widget buildGrid() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 60, 12, 08),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 16,
        children: [
          buildCard('Students', AppColors.homeStudentTile, Icons.school_outlined, Colors.green),
          buildCard('Subjects', AppColors.homeSubjectTile, Icons.menu_book_outlined, Colors.blue),
          buildCard('Class Rooms', AppColors.homeClassRoomTile, Icons.door_sliding_outlined, Colors.red),
          buildCard('Registration', AppColors.homeRegistrationTile, Icons.mode_edit_outline_outlined, Colors.orange),
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 100, 12, 08),
      children: [
        buildListTile('Students', AppColors.homeStudentTile),
        SizedBox(height: 26,),
        buildListTile('Subjects', AppColors.homeSubjectTile),
        SizedBox(height: 26,),
        buildListTile('Class Rooms', AppColors.homeClassRoomTile),
        SizedBox(height: 26,),
        buildListTile('Registration', AppColors.homeRegistrationTile),
      ],
    );
  }

  Widget buildCard(String title, Color color, IconData icon, Color iconColor) {
    return GestureDetector(
      child: Card(
        color: color,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: iconColor),
              SizedBox(height: 10),
              Text(title, style: TextStyle().HomeMenuItemTextStyle),
            ],
          ),
        ),
      ),
      onTap: (){
        navigateToSelection(title);
      },
    );
  }

  Widget buildListTile(String title, Color color) {
    return GestureDetector(
      child: Card(
        color: color,
        child: Column(
          children: [
            ListTile(
              title: Text(title, style: TextStyle().HomeMenuItemTextStyle, textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
      onTap: (){
        navigateToSelection(title);
      },
    );
  }

  void navigateToSelection(String title){
    if(title == 'Students'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentsListPage()));
    } else if(title == 'Subjects'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectsListPage()));
    } else if(title == 'Class Rooms'){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassRoomsListPage()));
    } else if(title == 'Registration'){
      print("Navigate to Registration");
    }
  }
}