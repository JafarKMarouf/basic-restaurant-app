part of '../index.dart';

abstract class AuthFirebaseService {
  Future<String> signUp(StoreUserRequest userRequest);

  Future<UserEntity> signIn(LoginUserRequest userRequest);

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, bool>> isLogged();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<String> signUp(StoreUserRequest userRequest) async {
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
    return "User Account created Successfully!";
  }

  @override
  Future<UserEntity> signIn(LoginUserRequest userRequest) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: userRequest.email,
          password: userRequest.password,
        );
    var userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(credential.user!.uid)
        .get();
    UserEntity userEntity = UserModel.fromJson(userDoc.data()!).toEntity();
    return userEntity;
  }

  @override
  Future<Either<Failure, bool>> isLogged() {
    // TODO: implement isLogged
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
