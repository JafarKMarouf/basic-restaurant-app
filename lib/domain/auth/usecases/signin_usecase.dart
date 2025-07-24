part of '../index.dart';

class SignInUseCase extends UseCase<UserEntity, LoginUserRequest> {
  @override
  Future<Either<Failure, UserEntity>> call([LoginUserRequest? param]) async {
    return await sl<AuthRepository>().signIn(param!);
  }
}
