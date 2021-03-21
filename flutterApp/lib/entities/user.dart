import 'package:instagramclone/entities/userInfo.dart';

class User {
  final String bio;
  final dynamic profile_picture;
  final UserInfo user;
  User(
    this.bio,
    this.profile_picture,
    this.user,
  );
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      json['bio'],
      json['profile_picture'],
      json['user'],
    );
  }
  Map toMap() {
    var map = new Map();
    map['bio'] = bio;
    map['profile_picture'] = profile_picture;
    map['user'] = user.toMap();

    return map;
  }
}
