part of '../index.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;

  const UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email_address'] as String,
      createdAt: json['created_at'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email_address': email,
      'created_at': createdAt,
    };
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      createdAt: createdAt,
    );
  }
}
