part of '../index.dart';

class RegisterUserCase extends UseCase<String, StoreUserRequest> {
  @override
  Future<Either<Failure, String>> call([StoreUserRequest? param]) async {
    return await sl<AuthRepository>().register(param!);
  }
}
