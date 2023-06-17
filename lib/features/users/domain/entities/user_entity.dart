import 'package:eds_test/features/users/domain/entities/company_entity.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final String address;
  final CompanyEntity company;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        phone,
        website,
        address,
        company,
      ];
}
