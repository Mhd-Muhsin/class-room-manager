import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';

abstract class ClassRoomRepository{

  Future<List<ClassRoomEntity>?> getClassRoomListFromDataSource();

  Future<ClassRoomEntity?> getClassRoomDetailsFromDataSource({required int classRoomId});

  Future<ClassRoomEntity?> changeClassRoomSubjectFromDataSource({required int classRoomId, required int subjectId});

}