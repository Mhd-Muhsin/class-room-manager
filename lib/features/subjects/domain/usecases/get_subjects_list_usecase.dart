import 'package:classroom_manager/features/subjects/data/repositories/subject_repository_impl.dart';
import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';
import 'package:classroom_manager/features/subjects/domain/repositories/subject_repository.dart';

class GetSubjectsListUseCase {
  SubjectRepository subjectRepository = SubjectRepositoryImpl();

  Future<List<SubjectEntity>?> getSubjectsListFromDataSource() async{
    return await subjectRepository.getSubjectsListFromDataSource();
  }
}