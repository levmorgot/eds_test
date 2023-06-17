import 'package:flutter/material.dart';
import 'package:eds_test/features/posts/presentation/widgets/posts_list_widget.dart';

class PostsListPage extends StatelessWidget {
  final int userId;

  const PostsListPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список постов'),
        centerTitle: true,
      ),
      body: PostsList(
        userId: userId,
      ),
    );
  }
}
