import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/subjects/application/pages/subjects_list_page.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ClassRoomDetailPage extends StatelessWidget {
  const ClassRoomDetailPage({super.key, required this.noOfSeats, required this.type});

  final String className = "Oldlace";
  final int noOfSeats;
  final String type;

  @override
  Widget build(BuildContext context) {
    int leftChairs = (noOfSeats / 2).ceil();
    int rightChairs = noOfSeats - leftChairs;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "$className",
              style: TextStyle().HeadingTextStyle,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  color: AppColors.appGrey,
                  child: ListTile(
                    title: Text(
                      "Add Subject",
                      style: TextStyle().listTileTitleTextStyle,
                    ),
                    trailing: MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => SubjectsListPage(
                                      isSubjectSelectionPage: true,
                                    )))
                            .then((subjectData) {

                        });
                      },
                      child: Text("Add", style: TextStyle(color: AppColors.greenShareButtonText),),
                      color: AppColors.greenShareButtonBackground,
                    ),
                    minTileHeight: 70,
                  )),
            ),
            SizedBox(height: 40,),
            Expanded(
              child: type == 'Class Room' ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: buildChairList(count: leftChairs),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 170,
                        height: leftChairs * 44,
                        color: AppColors.appGrey,
                      ),
                    ],
                  ),
                  Column(
                    children: buildChairList(count: rightChairs),
                  ),
                ],
              ) : GridView.count(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                crossAxisCount: 4, // Number of columns in the grid
                children: buildChairList(count: noOfSeats, isGrid: true),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildChairList({required int count, bool isGrid = false}) {
    return List<Widget>.generate(count, (index) {
      return Padding(
        padding: EdgeInsets.all(isGrid ? 30.0 : 8),
        child: Image.network("https://s3-alpha-sig.figma.com/img/92ef/3841/05bfe3f6130168e7c1e50bc2edc830ad?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=E9NYcQBOMOZhD0MzUmPAqtRzch~R4RdWQjJmyapt3QFtZk-vwV10GWDs3ciqE4cNrRMhn~dsOZw1hm6FUV1TDFXoixETdAA8UiUiJi2bPq04j-snm7MiEnW-P23KEstZBs1nCEvn4TvkHGFaR-67Db2lfrdsIaGjWKo8LS5t-q~j3iWjWi1cFRm25IQSVnLIonzTl~iBdtcLzvpL5T~YxhF10D4nerItoG4pBPKmdDuSUY4p6aHSatXzCCF--jU2WrAFFGLmpOkUco4eJY4W5JP5zz73dPUzAeMDU124wgoGa97ieN4KEk7cEUxG9Y6VqXEyOCImDtT63nhaEuYMSg__", width: 28, height: 28,),
      );
    });
  }

}

// class ClassRoomDetailPage extends StatelessWidget {
//   const ClassRoomDetailPage({super.key, required this.noOfSeats});
//
//   final String className = "Oldlace";
//   final int noOfSeats;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Classroom Details"),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(
//               className,
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Card(
//                 color: AppColors.appGrey,
//                 child: ListTile(
//                   title: Text(
//                     "Add Subject",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   trailing: MaterialButton(
//                     onPressed: () {},
//                     child: Text(
//                       "Add",
//                       style: TextStyle(color: AppColors.greenShareButtonText),
//                     ),
//                     color: AppColors.greenShareButtonBackground,
//                   ),
//                   minVerticalPadding: 15,  // Adjust the height as needed
//                 ),
//               ),
//             ),
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 4, // Number of columns in the grid
//                 children: buildChairGrid(noOfSeats),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> buildChairGrid(int count) {
//     return List<Widget>.generate(count, (index) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Icon(Icons.chair, size: 48),
//       );
//     });
//   }
//
// }