import 'package:flutter/material.dart';
import 'package:eds_test/common/app_colors.dart';
import 'package:eds_test/features/users/domain/entities/company_entity.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';

class UserInfo extends StatelessWidget {
  final UserEntity user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Персональные данные",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ..._buildInfoField("Name:", user.name),
        ..._buildInfoField("Email:", user.email),
        ..._buildInfoField("Phone:", user.phone),
        ..._buildInfoField("Website:", user.website),
        ..._buildCompanyInfo(user.company),
        ..._buildInfoField("Address:", user.address),
      ],
    );
  }

  List<Widget> _buildCompanyInfo(CompanyEntity company) {
    return [
      const Divider(
        color: Colors.grey,
      ),
      const Text(
        'Company:',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 20,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      ..._buildInfoField('Name:', company.name),
      ..._buildInfoField('Business strategy:', company.bs),
      const Text(
        'Catch phrase:',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        '"${company.catchPhrase}"',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      const Divider(
        color: Colors.grey,
      ),
    ];
  }

  List<Widget> _buildInfoField(String title, String value) {
    return [
      Text(
        title,
        style: const TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
