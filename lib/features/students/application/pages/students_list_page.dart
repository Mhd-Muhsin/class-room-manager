import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/students/application/bloc/student_bloc.dart';
import 'package:classroom_manager/features/students/application/pages/student_detail_page.dart';
import 'package:classroom_manager/features/students/application/widgets/students_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsListPage extends StatefulWidget {
  const StudentsListPage({super.key});

  @override
  State<StudentsListPage> createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {

  @override
  void initState() {
    BlocProvider.of<StudentBloc>(context).add(StudentsListRequestEvent());
    super.initState();
  }

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
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                if(state is StudentInitial || state is StudentLoadingState){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if(state is StudentListLoadedState && state.students != null){
                  if(state.students!.isNotEmpty){
                    return ListView.separated(
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: StudentsListTile(
                              name: "${state.students![index].name}",
                              email: "${state.students![index].email}",
                              age: "${state.students![index].age}",
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => StudentDetailPage()));
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 6,
                          );
                        },
                        itemCount: state.students!.length);
                  } else {
                    return Center(
                      child: Text("No Students found ", style: TextStyle().subHeadingTextStyle,),
                    );
                  }
                }
                return Center(
                  child: Text("Something went wrong!", style: TextStyle().subHeadingTextStyle,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
