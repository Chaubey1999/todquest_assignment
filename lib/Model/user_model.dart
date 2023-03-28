class User {
  int? id;
  String? name;
  String? email;
  String? source;

  User({this.id, this.name, this.email, this.source});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'source': source,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      source: map['source'],
    );
  }
}
