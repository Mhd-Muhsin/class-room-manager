import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/class_rooms/application/bloc/class_room_bloc.dart';
import 'package:classroom_manager/features/class_rooms/application/pages/class_room_detail_page.dart';
import 'package:classroom_manager/features/class_rooms/application/widgets/class_rooms_list_tile.dart';
import 'package:classroom_manager/features/students/application/pages/student_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassRoomsListPage extends StatefulWidget {
  const ClassRoomsListPage({super.key});

  @override
  State<ClassRoomsListPage> createState() => _ClassRoomsListPageState();
}

class _ClassRoomsListPageState extends State<ClassRoomsListPage> {
  @override
  void initState() {
    BlocProvider.of<ClassRoomBloc>(context).add(ClassRoomListRequestEvent());
    super.initState();
  }

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
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<ClassRoomBloc, ClassRoomState>(
              builder: (context, state) {
                if (state is ClassRoomInitial || state is ClassRoomLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is ClassRoomListLoadedState && state.classRoom != null) {
                  if (state.classRoom!.isNotEmpty) {
                    return ListView.separated(
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: ClassRoomsListTile(
                              name: "${state.classRoom![index].name}",
                              layout: "${state.classRoom![index].layout}",
                              size: "${state.classRoom![index].size}",
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ClassRoomDetailPage(
                                        noOfSeats: 24,
                                        type: 'Class Room',
                                      )));
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 6,
                          );
                        },
                        itemCount: state.classRoom!.length);
                  } else {
                    return Center(
                      child: Text(
                        "No Class Rooms found ",
                        style: TextStyle().subHeadingTextStyle,
                      ),
                    );
                  }
                } else {
                  return Center(
                    child: Text(
                      "Some error occurred",
                      style: TextStyle().subHeadingTextStyle,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
