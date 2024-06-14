import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/blog_provider.dart';
import '../widgets/blog_post_tile.dart';

// A stateless widget representing the blog list page
class BlogListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accessing the BlogProvider to get the list of blog posts and loading status
    final blogProvider = Provider.of<BlogProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: blogProvider.isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator if data is being fetched
          : ListView.builder(
              itemCount: blogProvider.blogPosts.length,
              itemBuilder: (context, index) {
                blogProvider.addHive(blogProvider.blogPosts[index]);
                var blogPost = blogProvider.blogPosts[index];
                return BlogPostTile(
                    blogPost:
                        blogPost); // Display each blog post in a BlogPostTile
              },
            ),
    );
  }
}
