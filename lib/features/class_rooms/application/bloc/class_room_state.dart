part of 'class_room_bloc.dart';

@immutable
abstract class ClassRoomState {}

abstract class ClassRoomDetailsState extends ClassRoomState{}

final class ClassRoomInitial extends ClassRoomState {}

final class ClassRoomListLoadingState extends ClassRoomState {}

final class ClassRoomListLoadedState extends ClassRoomState{

  final List<ClassRoomEntity>? classRoom;
  ClassRoomListLoadedState({required this.classRoom});
}

final class ClassRoomDetailsLoadingState extends ClassRoomDetailsState {}

final class ClassRoomDetailsLoadedState extends ClassRoomDetailsState{

  final ClassRoomEntity? classRoom;
  ClassRoomDetailsLoadedState({required this.classRoom});
}

final class ClassRoomDetailUpdatedState extends ClassRoomDetailsState {}
