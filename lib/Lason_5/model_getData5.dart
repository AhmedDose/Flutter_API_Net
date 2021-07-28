class Author5 {
  int id;
  String name;
  String bio;
  int age;

  Author5(
      {
        required this.id,
      required this.name,
      required this.bio,
      required this.age


      });

  factory Author5.fromJson(Map<String, dynamic> author) => Author5(
      id: author['id'],
      name: author['title'],
      bio: author['body'],
      age: author['userId']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': name, 'body': bio, 'userId': age};
}
