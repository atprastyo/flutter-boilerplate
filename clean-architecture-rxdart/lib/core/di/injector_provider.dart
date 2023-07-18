import 'package:flutter_boilerplate/app/data/auth.repository.dart';
import 'package:flutter_boilerplate/app/data/sources/remote/auth.service.dart';
import 'package:flutter_boilerplate/app/data/sources/remote/user.service.dart';
import 'package:flutter_boilerplate/app/presentation/modules/authenticated/home/home.viewmodel.dart';
import 'package:flutter_boilerplate/app/presentation/modules/unauthenticated/login/login.viewmodel.dart';

import 'package:get_it/get_it.dart';

import 'http_client.dart';

final GetIt inject = GetIt.I;

Future<void> setupInjection() async {
  //Components
  inject.registerSingleton(HttpClient());

  //Remote Services
  inject.registerFactory(() => AuthService());
  inject.registerFactory(() => UserService());
  
  //Repositories
  inject.registerFactory(() => AuthRepository());

  //ViewModels
  inject.registerLazySingleton(() => LoginViewModel());
  inject.registerLazySingleton(() => HomeViewModel());
}