import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class UserEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final int id;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String username;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final Map<String, dynamic> address;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String website;
  @JsonKey(defaultValue: '')
  final Map<String, dynamic> company;

  const UserEntity(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.address,
      required this.company,
      required this.username,
      required this.website});

  @override
  List<Object?> get props => [id, name, phone, email, address, company, username, website];
}
