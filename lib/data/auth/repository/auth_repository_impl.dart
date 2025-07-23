part of '../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login(
    LoginUserRequest userRequest,
  ) async {
    try {
      UserEntity userEntity = await sl<AuthFirebaseService>().login(
        userRequest,
      );
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> register(StoreUserRequest userRequest) async {
    try {
      String result = await sl<AuthFirebaseService>().register(userRequest);
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }
}
