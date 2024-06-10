import 'dart:convert';

import 'package:classroom_manager/features/class_rooms/data/models/class_room_list_response_model.dart';
import 'package:http/http.dart' as http;

abstract class ClassRoomRemoteDataSource{
  Future<List<ClassroomModel>?> getClassRoomListFromApi();
}

class ClassRoomRemoteDataSourceImpl extends ClassRoomRemoteDataSource{

  final client = http.Client();
  @override
  Future<List<ClassroomModel>?> getClassRoomListFromApi() async{
    try {
      final response = await client.get(
        Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/?api_key=fCD5d'),
      );

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final ClassRoomListResponseModel classRoomListResponseModel = ClassRoomListResponseModel.fromJson(responseBody);

        return classRoomListResponseModel.classrooms;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}