part of '../index.dart';

class AppPages {
  static const signIn = '/signin';
  static const signUp = '/signup';
  static const home = '/home';
  static final routes = [
    GetPage(name: signIn, page: () => SignInView(), binding: SignInBinding()),
    GetPage(name: signUp, page: () => SignUpView(), binding: SignUpBinding()),
    GetPage(name: home, page: () => HomeView(), binding: HomeBinding()),
  ];
}
