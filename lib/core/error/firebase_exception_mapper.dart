part of '../index.dart';

class FirebaseExceptionMapper {
  static ServerFailure map(Exception exception) {
    if (exception is FirebaseAuthException) {
      return ServerFailure(_mapAuthCode(exception.code));
    } else if (exception is FirebaseException) {
      return ServerFailure(exception.message ?? 'A Firebase error occurred.');
    } else {
      return const ServerFailure('An unexpected error occurred.');
    }
  }

  static String _mapAuthCode(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return 'Authentication error: $code';
    }
  }
}
