import 'dart:convert';

import 'package:instagramclone/dataFunctions.dart';
import 'package:instagramclone/entities/comment.dart';
import 'package:instagramclone/entities/user.dart';

class Post {
  final int id;
  final String photo;
  final String caption;
  dynamic user;
  final List<Comment> comments;
  final int like;

  Post(this.id, this.photo, this.caption, this.user, this.comments, this.like);

  factory Post.fromMap(Map<String, dynamic> json) {
    return Post(
        json['id'],
        json['photo'],
        json['caption'],
        User.fromMap(json['user']),
        List<Comment>.from(
            jsonDecode(json['comments']).map((com) => Comment.fromMap(com))),
        json['like']);
  }

  Future<void> setUser() async {
    this.user = await ServiceConsoomer().getUser(this.user);
  }

  Map toMap() {
    var map = new Map();
    map['id'] = id;
    map['photo'] = photo;
    map['caption'] = caption;
    map['user'] = user.toMap();
    map['comments'] = json.encode(List<dynamic>.from(comments.map((com) => com.toMap())));
    map['like'] = like;
    return map;
  }
}
