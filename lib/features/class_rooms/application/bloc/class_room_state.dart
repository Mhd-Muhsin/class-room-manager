part of 'class_room_bloc.dart';

@immutable
sealed class ClassRoomState {}

final class ClassRoomInitial extends ClassRoomState {}

final class ClassRoomLoadingState extends ClassRoomState {}

final class ClassRoomListLoadedState extends ClassRoomState{

  final List<ClassRoomEntity>? classRoom;
  ClassRoomListLoadedState({required this.classRoom});
}
