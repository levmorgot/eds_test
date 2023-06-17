import 'package:eds_test/common/app_colors.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';
import 'package:eds_test/features/users/presentation/pages/user_detail_screen.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<UserDetailPage>(
            builder: (context) => UserDetailPage(user: user),
          ),
        );
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
                user.username,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                user.name,
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
