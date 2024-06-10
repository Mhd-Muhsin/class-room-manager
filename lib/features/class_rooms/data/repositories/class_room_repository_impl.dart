import 'package:classroom_manager/features/class_rooms/data/datasources/class_room_remote_datasource.dart';
import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';
import 'package:classroom_manager/features/class_rooms/domain/repositories/class_room_repository.dart';

class ClassRoomRepositoryImpl extends ClassRoomRepository{

  ClassRoomRemoteDataSource classRoomRemoteDataSource = ClassRoomRemoteDataSourceImpl();

  @override
  Future<List<ClassRoomEntity>?> getClassRoomListFromDataSource() async{
    return await classRoomRemoteDataSource.getClassRoomListFromApi();
  }
}