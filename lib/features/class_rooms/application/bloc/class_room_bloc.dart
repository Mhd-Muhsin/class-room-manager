import 'package:bloc/bloc.dart';
import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';
import 'package:classroom_manager/features/class_rooms/domain/usecases/get_class_room_list_usecase.dart';
import 'package:meta/meta.dart';

part 'class_room_event.dart';
part 'class_room_state.dart';

class ClassRoomBloc extends Bloc<ClassRoomEvent, ClassRoomState> {
  ClassRoomBloc() : super(ClassRoomInitial()) {
    on<ClassRoomListRequestEvent>((event, emit) async{
      emit(ClassRoomLoadingState());
      final classRooms = await GetClassRoomListUseCase().getClassRoomListFromDataSource();
      emit(ClassRoomListLoadedState(classRoom: classRooms));
    });
  }
}
