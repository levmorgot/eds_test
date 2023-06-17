import 'package:eds_test/features/users/data/models/company_model.dart';
import 'package:eds_test/features/users/domain/entities/company_entity.dart';
import 'package:eds_test/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required String address,
    required CompanyEntity company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          phone: phone,
          website: website,
          address: address,
          company: company,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'] == null
        ? ''
        : json['address'] is String
            ? json['address'] as String
            : _getFullAddress(json['address'] as Map<String, dynamic>);
    return UserModel(
      id: json['id'] != null ? json['id'] as int : 0,
      name: json['name']?.toString() ?? '',
      username: json['username']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      website: json['website']?.toString() ?? '',
      address: address,
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );
  }

  static String _getFullAddress(Map<String, dynamic> address) {
    return '${address["zipcode"] ?? ''}, ${address["suite"] ?? ''}, ${address["street"] ?? ''}, ${address["city"] ?? ''}';
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'address': address,
      'company': company,
    };
  }
}
