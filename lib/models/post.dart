
import 'dart:convert';

class Post {
  final String? id;
  final String userId;
  final String title;
  final String content;
  final String? image;
  final Map<String, dynamic>? comments; 
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    this.id,
    required this.userId,
    required this.title,
    required this.content,
    this.image,
    this.comments,
    this.createdAt,
    this.updatedAt,
  });

  get postTitle => null;

  get postContent => null;

  get imageurl => null;

  get commentCount => null;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
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
      id: map['id'] as String?,
      userId: map['userId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      image: map['image'] as String?,
      comments: map['comments'] as Map<String, dynamic>?,
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
