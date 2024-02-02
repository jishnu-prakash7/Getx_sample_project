class StudentModel {
  int? id;
  String? name;

  StudentModel({
    required this.id,
    required this.name,
  });

  factory StudentModel.fromMap(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
