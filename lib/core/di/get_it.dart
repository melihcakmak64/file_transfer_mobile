import 'package:file_transfer_mobile/repository/home_repository.dart';
import 'package:file_transfer_mobile/routes/app_router.dart';
import 'package:file_transfer_mobile/viewmodel/home_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Repositories
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());

  // ViewModels

  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(repository: getIt<HomeRepository>()),
  );

  // Router
  getIt.registerSingleton<AppRouter>(AppRouter());
}
