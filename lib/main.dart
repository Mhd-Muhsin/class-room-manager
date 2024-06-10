import 'package:classroom_manager/features/class_rooms/application/bloc/class_room_bloc.dart';
import 'package:classroom_manager/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/students/application/bloc/student_bloc.dart';
import 'features/subjects/application/bloc/subject_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StudentBloc>(
          create: (context)=> StudentBloc(),
        ),
        BlocProvider<SubjectBloc>(
          create: (context) => SubjectBloc(),
        ),
        BlocProvider<ClassRoomBloc>(
          create: (context) => ClassRoomBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}


// Students list and details page - 30
// Subject list and details page - 30
// Class room list and details page - 30

// Class room => Conference and class room - 30
// Class room => Assign and change subject - 30

// Registration

// List - 30
// Detail => Delete option - 1 hour
// Create => Subject and Student selection - 1 hour