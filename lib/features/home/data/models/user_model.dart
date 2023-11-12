import 'package:json_annotation/json_annotation.dart';
import 'package:testapp/features/home/data/models/user_model.g.dart';
import 'package:testapp/features/home/domain/entity/user_entity.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.name,
      required super.phone,
      required super.email,
      required super.address,
      required super.company,
      required super.username,
      required super.website});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModelFromJson(json);
}
