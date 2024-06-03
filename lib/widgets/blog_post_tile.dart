import 'package:flutter/material.dart';
import '../models/blog_post_model.dart';
import 'package:go_router/go_router.dart';

class BlogPostTile extends StatelessWidget {
  final BlogPost blogPost;

  BlogPostTile({super.key, required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Colors.black54,
          width: 2.0,
        ),
      ),
      elevation: 6,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: ListTile(
          horizontalTitleGap: 12,
          trailing: TextButton(
              onPressed: () {
                print(blogPost.id);
                context.go('/blog/${blogPost.id}');
              },
              child: const SizedBox(
                width: 50,
                child: Text(
                  "Read More",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )),
          leading: SizedBox(
            width: 100,
            // height: 50,
            child: Image.network(
              blogPost.image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(blogPost.title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text(
            blogPost.summary,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
