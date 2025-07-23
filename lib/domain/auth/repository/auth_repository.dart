part of '../index.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> register(StoreUserRequest userRequest);

  Future<Either<Failure, UserEntity>> login(LoginUserRequest userRequest);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, bool>> isLogged();
}
