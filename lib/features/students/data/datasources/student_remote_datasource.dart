import 'dart:convert';

import 'package:classroom_manager/features/students/data/models/student_list_response_model.dart';
import 'package:http/http.dart' as http;

abstract class StudentRemoteDataSource{
  Future<List<StudentModel>?> getStudentsListFromApi();
}

class StudentRemoteDataSourceImpl extends StudentRemoteDataSource{

  final client = http.Client();
  @override
  Future<List<StudentModel>?> getStudentsListFromApi() async{
    try {
      final response = await client.get(
          Uri.parse('https://nibrahim.pythonanywhere.com/students/?api_key=fCD5d'),
      );

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final StudentListResponseModel studentResponseModel = StudentListResponseModel.fromJson(responseBody);

        return studentResponseModel.students;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

