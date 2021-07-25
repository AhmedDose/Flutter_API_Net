class Auther4 {
  int userId;
  int id;
  String title;
  int body;
  Auther4(
      {required this.id,
      required this.body,
      required this.title,
      required this.userId});
  factory Auther4.fromJson(Map<String, dynamic> author) => Auther4(
      id: author['id'],
      userId: author['userId'],
      title: author['title'],
      body: author['body']);
  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'body': body};
}
