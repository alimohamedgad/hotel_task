import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/data/repo/hotel_repository.dart';
import '../../features/presentation/hotel_cubit/hotel_cubit.dart';
import '../api_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register ApiService, Dio, and HotelRepository
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => ApiService(locator<Dio>()));
  locator.registerLazySingleton(() => HotelRepository(locator<ApiService>()));

  // Register HotelCubit with HotelRepository dependency
  locator.registerFactory(() => HotelCubit(locator<HotelRepository>()));
}
