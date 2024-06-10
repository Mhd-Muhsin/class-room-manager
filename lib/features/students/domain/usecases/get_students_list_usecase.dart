import 'package:classroom_manager/features/students/data/repositories/student_repository_impl.dart';
import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';
import 'package:classroom_manager/features/students/domain/repositories/student_repository.dart';

class GetStudentsListUseCase {
  StudentRepository studentRepository = StudentRepositoryImpl();

  Future<List<StudentEntity>?> getStudentsListFromDataSource() async {
    return await studentRepository.getStudentsListFromDataSource();
  }
}