part of '../index.dart';

class LoginUseCase extends UseCase<UserEntity, LoginUserRequest> {
  @override
  Future<Either<Failure, UserEntity>> call([LoginUserRequest? param]) async {
    return await sl<AuthRepository>().login(param!);
  }
}
