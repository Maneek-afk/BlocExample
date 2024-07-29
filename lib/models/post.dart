// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  final String userId;
  final String title;
  final String content;
  final String? image;
  final List<String>? comments; // List of comment IDs
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    required this.userId,
    required this.title,
    required this.content,
    required this.image,
    this.comments,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'content': content,
      'image': image,
      'comments': comments,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      comments: map['comments'] != null
          ? List<String>.from(map['comments'] as List)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
