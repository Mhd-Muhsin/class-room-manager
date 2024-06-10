import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';

abstract class SubjectRepository{
  Future<List<SubjectEntity>?> getSubjectsListFromDataSource();
}