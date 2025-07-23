part of '../index.dart';

class UserEntity {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? createdAt;

  const UserEntity({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.createdAt,
  });
}
