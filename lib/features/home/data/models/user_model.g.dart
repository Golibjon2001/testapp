import 'user_model.dart';

UserModel UserModelFromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    email: json['email'] as String? ?? '',
    address: json['address'] as Map<String, dynamic>? ?? {},
    company: json['company'] as Map<String, dynamic>? ?? {},
    username: json['username'] as String? ?? '',
    website: json['website'] as String? ?? '');

Map<String, dynamic> UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'company': instance.company,
      'username': instance.username,
      'website': instance.website,
    };
