part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoadingState extends StudentState {}

class StudentListLoadedState extends StudentState {
  final List<StudentEntity>? students;

  StudentListLoadedState({required this.students});
}
