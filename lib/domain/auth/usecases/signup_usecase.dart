part of '../index.dart';

class SignUpUseCase extends UseCase<String, StoreUserRequest> {
  @override
  Future<Either<Failure, String>> call([StoreUserRequest? param]) async {
    return await sl<AuthRepository>().signUp(param!);
  }
}
