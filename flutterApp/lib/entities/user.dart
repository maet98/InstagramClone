import 'package:instagramclone/entities/userInfo.dart';

class User {
  final int id;
  final String bio;
  final dynamic profile_picture;
  final UserInfo user;
  User(
      this.id,
    this.bio,
    this.profile_picture,
    this.user,
  );
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['bio'],
      json['profile_picture'],
      UserInfo.fromMap(json['user']),
    );
  }
  Map toMap() {
    var map = new Map();
    map['id'] = id;
    map['bio'] = bio;
    map['profile_picture'] = profile_picture;
    map['user'] = user.toMap();

    return map;
  }
}
