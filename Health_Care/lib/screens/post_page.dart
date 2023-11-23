import 'package:fittech_app/data/post_data.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});
  static String id = "PostPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return postsData[index];
        },
        itemCount: postsData.length,
      ),
    );
  }
}
