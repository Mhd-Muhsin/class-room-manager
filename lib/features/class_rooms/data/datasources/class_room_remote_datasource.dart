import 'dart:convert';

import 'package:classroom_manager/features/class_rooms/data/models/class_room_list_response_model.dart';
import 'package:http/http.dart' as http;

abstract class ClassRoomRemoteDataSource{

  Future<List<ClassroomModel>?> getClassRoomListFromApi();

  Future<ClassroomModel?> getClassRoomDetailsFromApi({required int classRoomId});

  Future<ClassroomModel?> changeClassRoomSubjectFromApi({required int classRoomId, required int subjectId});

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

  @override
  Future<ClassroomModel?> getClassRoomDetailsFromApi({required int classRoomId}) async{
    try {
      final response = await client.get(
        Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/$classRoomId?api_key=fCD5d'),
      );

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final ClassroomModel classroom = ClassroomModel.fromJson(responseBody);

        return classroom;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Future<ClassroomModel?> changeClassRoomSubjectFromApi({required int classRoomId, required int subjectId}) async{

    final Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Map<String, String> body = {
      'subject': '$subjectId',
    };

    try {
      final response = await client.patch(
        Uri.parse('https://nibrahim.pythonanywhere.com/classrooms/$classRoomId?api_key=fCD5d'),
        headers: headers,
        body: body
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final ClassroomModel classroom = ClassroomModel.fromJson(responseBody);

        return classroom;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}