import 'package:classroom_manager/features/students/domain/entities/student_entity.dart';

class StudentListResponseModel {
  List<StudentModel>? students;

  StudentListResponseModel({this.students});

  StudentListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <StudentModel>[];
      json['students'].forEach((v) {
        students!.add(new StudentModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentModel extends StudentEntity {
  int? age;
  String? email;
  int? id;
  String? name;

  StudentModel(
      {required this.age,
      required this.email,
      required this.id,
      required this.name})
      : super(age: age, email: email, id: id, name: name);

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        age: json['age'],
        email: json['email'],
        id: json['id'],
        name: json['name']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
