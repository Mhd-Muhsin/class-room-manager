part of 'subject_bloc.dart';

@immutable
sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}

final class SubjectLoadingState extends SubjectState {}

class SubjectListLoadedState extends SubjectState {
  final List<SubjectEntity>? subjects;

  SubjectListLoadedState({required this.subjects});
}
