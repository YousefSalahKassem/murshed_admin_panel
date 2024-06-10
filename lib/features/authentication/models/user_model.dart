class UserModel {
  final String? name;
  final String? email;
  final String? uid;
  final String? image;

  UserModel({
    this.name = "",
    this.email = "",
    this.uid = "",
    this.image = "",
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      uid: json['uid'] ?? "",
      image: json['image'] ?? "",
    );
  }

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, image: $image}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uid'] = uid;
    data['image'] = image;
    return data;
  }

  factory UserModel.guest() {
    return UserModel(
      email: "Guest@Guest.com",
      name: "Guest",
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? uid,
    String? image,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      image: image ?? this.image,
    );
  }
}
