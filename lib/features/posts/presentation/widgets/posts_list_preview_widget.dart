import 'package:eds_test/common/widgets/error_message_widget.dart';
import 'package:eds_test/common/widgets/loading_indicator_widget.dart';
import 'package:eds_test/features/posts/domain/entities/post_entity.dart';
import 'package:eds_test/features/posts/presentation/bloc/posts_list_cubit/posts_list_cubit.dart';
import 'package:eds_test/features/posts/presentation/bloc/posts_list_cubit/posts_list_state.dart';
import 'package:eds_test/features/posts/presentation/pages/posts_screen.dart';
import 'package:eds_test/features/posts/presentation/widgets/post_preview_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsListPreview extends StatelessWidget {
  final int userId;

  const PostsListPreview({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<PostsListCubit>().loadPosts(userId);
    return BlocBuilder<PostsListCubit, PostState>(builder: (context, state) {
      var posts = <PostEntity>[];
      if (state is PostLoadingState) {
        return const LoadingIndicator();
      } else if (state is PostErrorState) {
        return ErrorMessage(
          message: state.message,
        );
      } else if (state is PostLoadedState) {
        posts = state.postsList;
        posts = posts.isNotEmpty
            ? posts.sublist(0, posts.length < 3 ? posts.length : 3)
            : posts;
      }
      return Column(
        children: [
          const Text(
            'Посты пользователя',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return PostPreviewCard(post: posts[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: posts.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            child: const Text("К списку постов"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<PostsListPage>(
                      builder: (context) =>
                          PostsListPage(userId: userId)));
            },
          ),
        ],
      );
    });
  }
}
