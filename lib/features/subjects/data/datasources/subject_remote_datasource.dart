import 'dart:convert';
import 'package:classroom_manager/features/subjects/data/mdoels/subjects_list_reponse_model.dart';
import 'package:http/http.dart' as http;

abstract class SubjectRemoteDataSource{
  Future<List<SubjectModel>?> getSubjectsListFromApi();
}

class SubjectRemoteDataSourceImpl extends SubjectRemoteDataSource{

  final client = http.Client();
  @override
  Future<List<SubjectModel>?> getSubjectsListFromApi() async{
    try {
      final response = await client.get(
        Uri.parse('https://nibrahim.pythonanywhere.com/subjects/?api_key=fCD5d'),
      );

      if (response.statusCode == 200) {
        print(response.body);

        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final SubjectListResponseModel subjectListResponseModel = SubjectListResponseModel.fromJson(responseBody);

        return subjectListResponseModel.subjects;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}