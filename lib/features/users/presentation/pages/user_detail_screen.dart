import 'package:flutter/material.dart';
import 'package:eds_test/features/albums/presentation/widgets/albums_preview_list_widget.dart';
import 'package:eds_test/features/posts/presentation/widgets/posts_list_preview_widget.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';
import 'package:eds_test/features/users/presentation/widgets/user_info_widget.dart';

class UserDetailPage extends StatelessWidget {
  final UserEntity user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: [
              UserInfo(user: user),
              const SizedBox(
                height: 30,
              ),
              PostsListPreview(userId: user.id),
              const SizedBox(
                height: 30,
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              AlbumsPreviewList(userId: user.id),
            ],
          ),
        ),
      ),
    );
  }
}
