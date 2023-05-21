class User {
  String? id;
  String? email;
  String? name;
  String? password;

  User({
    this.id,
    this.email,
    this.name,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
