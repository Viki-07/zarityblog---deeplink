import 'package:hive/hive.dart';

part 'blog_hive_model.g.dart';

@HiveType(typeId: 1)
class Blog extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String image;

  @HiveField(2)
  String title;

  @HiveField(3)
  String summary;

  @HiveField(4)
  String content;

  Blog(
      {required this.id,
      required this.image,
      required this.title,
      required this.summary,
      required this.content});
}
