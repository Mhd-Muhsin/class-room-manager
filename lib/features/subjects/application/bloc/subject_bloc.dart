import 'package:bloc/bloc.dart';
import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';
import 'package:classroom_manager/features/subjects/domain/usecases/get_subjects_list_usecase.dart';
import 'package:meta/meta.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(SubjectInitial()) {
    on<SubjectListRequestEvent>((event, emit) async{
      emit(SubjectLoadingState());
      final subjects = await GetSubjectsListUseCase().getSubjectsListFromDataSource();
      emit(SubjectListLoadedState(subjects: subjects));
    });
  }
}
