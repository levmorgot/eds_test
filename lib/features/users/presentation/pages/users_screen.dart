import 'package:flutter/material.dart';
import 'package:eds_test/features/users/presentation/widgets/users_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список пользователей'),
        centerTitle: true,
      ),
      body: const UsersList(),
    );
  }
}
