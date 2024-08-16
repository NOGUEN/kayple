import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  ArticleModel({
    required this.title,
    required this.content,
    required this.id,
    required this.uploadTime,
  });

  final String title;
  final String content;
  final String id;
  final DateTime uploadTime;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
      uploadTime: (json['uploadTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'id': id,
      'uploadTime': Timestamp.fromDate(uploadTime),
    };
  }
}
