class StudentModel {
  int? id;
  String name;
  String age;
  String phone;
  String study;
  String images;

  StudentModel(
      {this.id,
      required this.name,
      required this.age,
      required this.study,
      required this.images,
      required this.phone});

  factory StudentModel.fromMap(Map<String, Object?> data) {
    return StudentModel(
      id: data['id'] as int?,
      name: data['name'] as String,
      age: data['age'] as String,
      study: data['study'] as String,
      images: data['selectedImage'] as String,
      phone: data['phone'] as String,
    );
  }
}
