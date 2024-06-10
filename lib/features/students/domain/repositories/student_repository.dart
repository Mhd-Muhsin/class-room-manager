import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';

abstract class StudentRepository{

  Future<List<StudentEntity>?> getStudentsListFromDataSource();

}