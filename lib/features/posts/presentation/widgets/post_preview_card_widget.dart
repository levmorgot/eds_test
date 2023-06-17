import 'package:flutter/material.dart';
import 'package:eds_test/common/app_colors.dart';
import 'package:eds_test/features/posts/domain/entities/post_entity.dart';
import 'package:eds_test/features/posts/presentation/pages/post_detail_screen.dart';

class PostPreviewCard extends StatelessWidget {
  final PostEntity post;

  const PostPreviewCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<PostDetailPage>(
                builder: (BuildContext context) => PostDetailPage(post: post)));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                '${post.body.split("\n")[0]}...',
                style: const TextStyle(
                  color: AppColors.greyColor,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
