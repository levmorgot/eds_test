import 'package:eds_test/features/albums/presentation/pages/albums_screen.dart';
import 'package:eds_test/features/albums/presentation/widgets/albums_list_widget.dart';
import 'package:flutter/material.dart';

class AlbumsPreviewList extends StatelessWidget {
  final int userId;

  const AlbumsPreviewList({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Альбомы пользователя',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 250,
          child: AlbumsList(userId: userId, count: 3),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          child: const Text("К списку альбомов"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<AlbumsPage>(
                builder: (context) => AlbumsPage(userId: userId),
              ),
            );
          },
        ),
      ],
    );
  }
}
