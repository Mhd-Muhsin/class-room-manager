import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/common/widgets/app_snack_bar.dart';
import 'package:classroom_manager/features/class_rooms/application/bloc/class_room_bloc.dart';
import 'package:classroom_manager/features/subjects/application/pages/subjects_list_page.dart';
import 'package:classroom_manager/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRoomDetailPage extends StatefulWidget {
  const ClassRoomDetailPage({super.key, required this.classRoomId});

  final int classRoomId;

  @override
  State<ClassRoomDetailPage> createState() => _ClassRoomDetailPageState();
}

class _ClassRoomDetailPageState extends State<ClassRoomDetailPage> {

  @override
  void initState() {
    BlocProvider.of<ClassRoomBloc>(context).add(ClassRoomDetailsRequestEvent(classRoomId: widget.classRoomId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ClassRoomBloc, ClassRoomState>(
      listener: (context, state) {
        if(state is ClassRoomDetailUpdatedState){
          showAppSnackBar(context: context, text: 'Subject Updated');
        }
      },
      builder: (context, state) {
            if(state is ClassRoomDetailsLoadedState && state.classRoom != null){
              int leftChairs = ((state.classRoom!.size ?? 0) / 2).ceil();
              int rightChairs = (state.classRoom!.size ?? 0) - leftChairs;
              return Center(
                child: Column(
                  children: [
                    Text(
                      "${state.classRoom?.name}",
                      style: TextStyle().headingTextStyle,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                          color: AppColors.appGrey,
                          child: ListTile(
                            title: Text(
                              "${state.classRoom?.subject == '' ? "Add Subject" : state.classRoom?.subject}",
                              style: TextStyle().listTileTitleTextStyle,
                            ),
                            trailing: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SubjectsListPage(
                                    isClassRoomSubjectSelectionPage: true,
                                    onTap: (subjectId){
                                      BlocProvider.of<ClassRoomBloc>(context).add(ChangeClassRoomSubjectEvent(classRoomId: widget.classRoomId, subjectId: subjectId));
                                    },
                                  ),
                                ),
                                );
                              },
                              child: Text("Add", style: TextStyle(
                                  color: AppColors.greenShadeButtonText),
                              ),
                              color: AppColors.greenShadeButtonBackground,
                            ),
                            minTileHeight: 70,
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: state.classRoom!.layout == 'conference'
                          ? Row(
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
                      )
                          : GridView.count(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        crossAxisCount: 4,
                        children: buildChairList(
                            count: state.classRoom!.size ?? 0, isGrid: true),
                      ),
                    ),
                  ],
                ),
              );
            } else if(state is ClassRoomDetailsLoadingState){
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.appGreen,
                ),
              );
            }
            return Center(
              child: Text(
                "Something went wrong!",
                style: TextStyle().subHeadingTextStyle,
              ),
            );},
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