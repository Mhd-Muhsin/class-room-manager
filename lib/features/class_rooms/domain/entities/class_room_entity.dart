class ClassRoomEntity {
  int? id;
  String? name;
  String? layout;
  int? size;
  dynamic subject;

  ClassRoomEntity(
      {required this.id,
      required this.name,
      required this.layout,
      required this.size,
      this.subject});
}
