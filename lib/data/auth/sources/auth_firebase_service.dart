part of '../index.dart';

abstract class AuthFirebaseService {
  Future<Either<Failure, String>> register(StoreUserRequest userRequest);

  Future<Either<Failure, UserEntity>> login();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, bool>> isLogged();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> register(StoreUserRequest userRequest) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userRequest.email,
            password: userRequest.password,
          );
      final CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );
      final String userId = const Uuid().v4();

      await users.doc(credential.user!.uid).set({
        'user_id': userId,
        'first_name': userRequest.firstName,
        'last_name': userRequest.lastName,
        'email_address': userRequest.email,
        'created_at': DateTime.now(),
      });
      return Right("User Account created Successfully!");
    } on Exception catch (e) {
      return Left(FirebaseExceptionMapper.map(e));
    }
  }
}
