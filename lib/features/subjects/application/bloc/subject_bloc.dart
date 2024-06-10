import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  SubjectBloc() : super(SubjectInitial()) {
    on<SubjectEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
