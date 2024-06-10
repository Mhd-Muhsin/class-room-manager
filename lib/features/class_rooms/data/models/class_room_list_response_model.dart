import 'package:classroom_manager/features/class_rooms/domain/entities/class_room_entity.dart';

class ClassRoomListResponseModel {
  List<ClassroomModel>? classrooms;

  ClassRoomListResponseModel({this.classrooms});

  ClassRoomListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['classrooms'] != null) {
      classrooms = <ClassroomModel>[];
      json['classrooms'].forEach((v) {
        classrooms!.add(new ClassroomModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classrooms != null) {
      data['classrooms'] = this.classrooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassroomModel extends ClassRoomEntity {
  int? id;
  String? layout;
  String? name;
  int? size;

  ClassroomModel(
      {required this.id,
      required this.layout,
      required this.name,
      required this.size})
      : super(id: id, name: name, layout: layout, size: size);

  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return ClassroomModel(
        id: json['id'],
        layout: json['layout'],
        name: json['name'],
        size: json['size']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['layout'] = this.layout;
    data['name'] = this.name;
    data['size'] = this.size;
    return data;
  }
}
