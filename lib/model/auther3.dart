class Author3 {
  late int id;
  late String name;
  late String age;
  late String bio;
  Author3(
      {required this.id,
      required this.name,
      required this.age,
      required this.bio});
  factory Author3.fromJson(Map<String, dynamic> author) => Author3(
      // هنا يقوم بتحويل بيانات الجيسن الى بيانات ممكنة القراءة
      id: author['id'],
      name: author['name'],
      age: author['age'],
      bio: author['bio']);
// هنا يقوم باخذ البيانات ويحولها الى جيسن
  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "bio": bio, "age": age};
}
