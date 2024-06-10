import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/students/application/pages/student_detail_page.dart';
import 'package:classroom_manager/features/students/application/widgets/students_list_tile.dart';
import 'package:flutter/material.dart';

class StudentsListPage extends StatelessWidget {
  const StudentsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Students",
            style: TextStyle().HeadingTextStyle,
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: StudentsListTile(
                      name: "Loren Thomas",
                      email: "pkmuhsin38@gmail.com",
                      age: "21",
                    ),
                    onTap: (){
                      print("Students details page");
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentDetailPage()));
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
      // body: Container(
      //   child: Center(
      //     child: Text("Students"),
      //   ),
      // ),
    );
  }
}
