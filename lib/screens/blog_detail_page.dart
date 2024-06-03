import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/blog_post_model.dart';

// A stateless widget that displays the details of a blog post
class BlogDetailPage extends StatelessWidget {
  final String blogId;

  BlogDetailPage({required this.blogId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      // Fetch the blog post document from Firestore using the blogId
      future:
          FirebaseFirestore.instance.collection('blogPosts').doc(blogId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return Scaffold(
            appBar: AppBar(
              title: const Text('Loading...'),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          // Show an error message if there is an error
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          // Show a not found message if the blog post does not exist
          return Scaffold(
            appBar: AppBar(
              title: const Text('Not Found'),
            ),
            body: const Center(child: Text('Blog post not found')),
          );
        }

        // Convert the document snapshot to a BlogPost object
        final blogPost = BlogPost.fromDocument(snapshot.data!);
        return Scaffold(
          appBar: AppBar(
            title: Text(blogPost.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 280,
                    height: 180,
                    child: Image.network(
                      blogPost.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    blogPost.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(
                        color: Colors.black54,
                        width: 2.0,
                      ),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        blogPost.content, // Display the blog post content
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
