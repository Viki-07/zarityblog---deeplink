import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPost {
  final String id;
  final String image;
  final String title;
  final String summary;
  final String content;

  BlogPost(
      {required this.id,
      required this.image,
      required this.title,
      required this.summary,
      required this.content});

  factory BlogPost.fromDocument(DocumentSnapshot doc) {
    return BlogPost(
      id: doc.id,
      image: doc['image'],
      title: doc['title'],
      summary: doc['summary'],
      content: doc['content'],
    );
  }
}
