import 'package:classroom_manager/features/subjects/domain/entities/subject_entity.dart';

class SubjectListResponseModel {
  List<SubjectModel>? subjects;

  SubjectListResponseModel({this.subjects});

  SubjectListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['subjects'] != null) {
      subjects = <SubjectModel>[];
      json['subjects'].forEach((v) {
        subjects!.add(new SubjectModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubjectModel extends SubjectEntity{
  int? credits;
  int? id;
  String? name;
  String? teacher;

  SubjectModel({required this.credits, required this.id, required this.name, required this.teacher}) : super(id: id, name: name, teacher: teacher, credits: credits);

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        id: json['id'],
       name: json['name'],
       teacher: json['teacher'],
       credits: json['credits']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credits'] = this.credits;
    data['id'] = this.id;
    data['name'] = this.name;
    data['teacher'] = this.teacher;
    return data;
  }
}