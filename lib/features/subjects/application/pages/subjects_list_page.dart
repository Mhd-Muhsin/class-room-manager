import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/subjects/application/pages/subject_detail_page.dart';
import 'package:classroom_manager/features/subjects/application/widgets/subjects_list_tile.dart';
import 'package:flutter/material.dart';

class SubjectsListPage extends StatelessWidget {
  const SubjectsListPage({super.key, this.isSubjectSelectionPage = false});

  final bool isSubjectSelectionPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Subjects",
            style: TextStyle().HeadingTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SubjectsListTile(
                      name: "Mathematics",
                      teacher: "Branda Miller",
                      credit: "10",
                    ),
                    onTap: () {
                      if(isSubjectSelectionPage) {
                        //TODO : API call to change subject of a class
                        Navigator.of(context).pop('subject data');
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectDetailPage()));
                      }
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
