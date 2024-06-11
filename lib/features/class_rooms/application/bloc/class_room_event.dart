part of 'class_room_bloc.dart';

@immutable
abstract class ClassRoomEvent {}

class ClassRoomListRequestEvent extends ClassRoomEvent {}

class ClassRoomDetailsRequestEvent extends ClassRoomEvent {
  final int classRoomId;

  ClassRoomDetailsRequestEvent({required this.classRoomId});
}

class ChangeClassRoomSubjectEvent extends ClassRoomEvent {
  final int classRoomId;
  final int subjectId;

  ChangeClassRoomSubjectEvent({required this.classRoomId, required this.subjectId});
}
