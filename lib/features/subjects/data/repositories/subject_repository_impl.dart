import 'package:classroom_manager/features/subjects/data/datasources/subject_remote_datasource.dart';
import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';
import 'package:classroom_manager/features/subjects/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl extends SubjectRepository{
  SubjectRemoteDataSource subjectRemoteDataSource = SubjectRemoteDataSourceImpl();

  @override
  Future<List<SubjectEntity>?> getSubjectsListFromDataSource() async{
    return await subjectRemoteDataSource.getSubjectsListFromApi();
  }
}