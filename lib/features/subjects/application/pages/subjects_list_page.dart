import 'package:classroom_manager/common/text_style_helpers.dart';
import 'package:classroom_manager/features/subjects/application/bloc/subject_bloc.dart';
import 'package:classroom_manager/features/subjects/application/pages/subject_detail_page.dart';
import 'package:classroom_manager/features/subjects/application/widgets/subjects_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsListPage extends StatefulWidget {
  const SubjectsListPage({super.key, this.isSubjectSelectionPage = false});

  final bool isSubjectSelectionPage;

  @override
  State<SubjectsListPage> createState() => _SubjectsListPageState();
}

class _SubjectsListPageState extends State<SubjectsListPage> {

  @override
  void initState() {
    BlocProvider.of<SubjectBloc>(context).add(SubjectListRequestEvent());
    super.initState();
  }

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
            child: BlocBuilder<SubjectBloc, SubjectState>(
              builder: (context, state) {
                if(state is SubjectInitial || state is SubjectLoadingState){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if(state is SubjectListLoadedState && state.subjects != null){
                  if(state.subjects!.isNotEmpty){
                    return ListView.separated(
                        padding: EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: SubjectsListTile(
                              name: "${state.subjects![index].name}",
                              teacher: "${state.subjects![index].teacher}",
                              credit: "${state.subjects![index].credits}",
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SubjectDetailPage()));
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 6,
                          );
                        },
                        itemCount: state.subjects!.length);
                  } else {
                    return Center(
                      child: Text("No subjects found ", style: TextStyle().subHeadingTextStyle,),
                    );
                  }
                }
                return Center(
                  child: Text("Some error occurred", style: TextStyle().subHeadingTextStyle,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
