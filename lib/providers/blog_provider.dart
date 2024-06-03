import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/blog_post_model.dart';

// A provider class that manages the state of blog posts
class BlogProvider with ChangeNotifier {
  List<BlogPost> _blogPosts = []; // List to store blog posts
  bool _isLoading = true; // Loading state indicator

  List<BlogPost> get blogPosts => _blogPosts;

  bool get isLoading => _isLoading;
  // Constructor that fetches blog posts when the provider is created
  BlogProvider() {
    fetchBlogPosts();
  }

  // Method to fetch blog posts from Firestore
  Future<void> fetchBlogPosts() async {
    try {
      // Fetching blog posts from 'blogPosts' collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('blogPosts').get();
      _blogPosts =
          snapshot.docs.map((doc) => BlogPost.fromDocument(doc)).toList();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
