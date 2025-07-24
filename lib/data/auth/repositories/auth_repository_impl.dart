part of '../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> signIn(
    LoginUserRequest userRequest,
  ) async {
    try {
      UserEntity userEntity = await sl<AuthFirebaseService>().signIn(
        userRequest,
      );
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUp(StoreUserRequest userRequest) async {
    try {
      String result = await sl<AuthFirebaseService>().signUp(userRequest);
      return Right(result);
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }
}
