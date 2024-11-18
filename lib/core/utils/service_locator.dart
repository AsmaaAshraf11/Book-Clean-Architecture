// core/utils/service_locator.dart
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// import '../../features/home/data/repos/home_repo_impl.dart';
// import 'api_service.dart';

// final GetIt getIt = GetIt.instance;

//  Future<void> setupServiceLocator() async {
  
// //final apiService = getIt.get<ApiService>();


// getIt.registerSingleton<Dio>(Dio());
  
// getIt.registerSingleton<ApiService>(
//     ApiService(getIt.get<Dio>()),
//   );

//   getIt
//     .registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
//     //..registerSingleton<LoginRepoImpl>(LoginRepoImpl(apiService))

//   // getIt..registerSingleton<ApiService>(ApiService(Dio()))
//   // ..registerSingleton(HomeRepoImpl(
//   //   getIt.get<ApiService>(),
//   // ));
// }

import 'package:book/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  _registerDio();
  _registerApiService();
  _registerRepositories();
}

void _registerDio() {
  getIt.registerSingleton<Dio>(Dio());
}

void _registerApiService() {
  getIt.registerSingleton<ApiService>(
    ApiService(getIt.get<Dio>()),
  );
}

void _registerRepositories() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceIml(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
