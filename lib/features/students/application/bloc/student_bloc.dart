import 'package:bloc/bloc.dart';
import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';
import 'package:classroom_manager/features/students/domain/usecases/get_students_list_usecase.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
    on<StudentsListRequestEvent>((event, emit) async{
        emit(StudentLoadingState());
        final students = await GetStudentsListUseCase().getStudentsListFromDataSource();
        emit(StudentListLoadedState(students: students));
    });
  }
}
