import 'package:instagramclone/entities/user.dart';

class Comment {
  final int id;
  final String comment;
  final User user;
  final int postId;

  Comment(this.id, this.comment, this.user, this.postId);

  factory Comment.fromMap(Map<String, dynamic> json) {
    return Comment(json['id'], json['comment'], User.fromMap(json['user']),
        json['postId']);
  }

  Map toMap() {
    var map = new Map();
    map['id'] = id;
    map['comment'] = comment;
    map['user'] = user.toMap();
    map['postId'] = postId;
    return map;
  }
}
