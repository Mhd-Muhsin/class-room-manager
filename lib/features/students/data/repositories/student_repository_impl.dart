import 'package:classroom_manager/features/students/data/datasources/student_remote_datasource.dart';
import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';
import 'package:classroom_manager/features/students/domain/repositories/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository{

  StudentRemoteDataSource studentRemoteDataSource = StudentRemoteDataSourceImpl();

  @override
  Future<List<StudentEntity>?> getStudentsListFromDataSource() async {
    return await studentRemoteDataSource.getStudentsListFromApi();
  }
}