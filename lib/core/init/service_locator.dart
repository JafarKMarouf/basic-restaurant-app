part of '../index.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  //-------------------sources------------------------------------//
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //-------------------repositories-----------------------------------//
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //-------------------usecases------------------------------------//
  sl.registerSingleton<RegisterUserCase>(RegisterUserCase());
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
}
