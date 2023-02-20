
class User {
    int id;
    String name;
    String email;
    String password;

   User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
   // final data = json['data'];
    final attributes = json['attributes'];
    return User(
      id: json['id'] ?? 0,
      name: attributes['name'] ?? '',
      email: attributes['email'] ?? '',
      password: attributes['password']?? '',
    );
  }
}



class TextSelector {
  int id;
  String text;

  TextSelector({
    required this.id,
    required this.text,

  });

  factory TextSelector.fromJson(Map<String, dynamic> json) {
    // final data = json['data'];
    final attributes = json['attributes'];
    return TextSelector(
      id: json['id'] ?? 0,
      text: attributes['text'] ?? ''
    );
  }
}