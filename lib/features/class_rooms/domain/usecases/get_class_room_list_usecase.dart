import 'package:classroom_manager/features/class_rooms/data/repositories/class_room_repository_impl.dart';
import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';
import 'package:classroom_manager/features/class_rooms/domain/repositories/class_room_repository.dart';

class GetClassRoomListUseCase{
  ClassRoomRepository classRoomRepository = ClassRoomRepositoryImpl();

  Future<List<ClassRoomEntity>?> getClassRoomListFromDataSource() async {
    return await classRoomRepository.getClassRoomListFromDataSource();
  }
}