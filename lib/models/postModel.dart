import 'dart:convert';

class Postmodel {
  final String imageUrl;
  final String title;
  final String content;

  Postmodel({
    required this.imageUrl,
    required this.title,
    required this.content,
  });

  // Factory constructor to create a Postmodel from a Map
  factory Postmodel.fromMap(Map<String, dynamic> map) {
    return Postmodel(
      imageUrl: map['image'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  // Convert the Postmodel to a Map
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'title': title,
      'content': content,
    };
  }

  // Factory constructor to create a Postmodel from JSON
  factory Postmodel.fromJson(String source) =>
      Postmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  // Convert the Postmodel to JSON
  String toJson() => json.encode(toMap());
}
