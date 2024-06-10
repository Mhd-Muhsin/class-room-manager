import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';

abstract class ClassRoomRepository{
  Future<List<ClassRoomEntity>?> getClassRoomListFromDataSource();
}