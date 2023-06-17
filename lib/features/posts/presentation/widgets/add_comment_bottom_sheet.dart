import 'package:flutter/material.dart';
import 'package:eds_test/features/posts/presentation/widgets/add_comment_form.dart';

class AddCommentBottomSheet extends StatelessWidget {
  final int postId;

  const AddCommentBottomSheet({Key? key, required this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddCommentForm(postId: postId);
  }
}
