class User {
  final String name;
  final String uId;

  User({
    required this.name,
    required this.uId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      uId: json['uId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'uId': uId,
    };
  }
}
