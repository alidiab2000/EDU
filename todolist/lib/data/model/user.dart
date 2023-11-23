// ignore_for_file: public_member_api_docs, sort_constructors_first

 

class User {
  int userId, id;
  String title;
  bool completed;
  User({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
