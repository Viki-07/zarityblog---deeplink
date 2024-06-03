import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:zarityblog/screens/bloglist.dart';
import 'providers/blog_provider.dart';
import 'screens/blog_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Firebase
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/', // The initial route when the app starts
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlogListPage(),
          routes: [
            GoRoute(
              path: 'blog/:id', // Route with a parameter for the blog ID
              builder: (context, state) {
                final id = state.pathParameters[
                    'id']!; // Retrieves the blog ID from the path
                return BlogDetailPage(blogId: id);
              },
            ),
          ],
        ),
      ],
    );

    return MultiProvider(
      providers: [
        // Registers the BlogProvider using ChangeNotifierProvider
        ChangeNotifierProvider(create: (_) => BlogProvider()),
      ],
      child: MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        title: 'Blog App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
