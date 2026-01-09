import 'package:file_transfer_mobile/repository/media_repository.dart';
import 'package:file_transfer_mobile/routes/app_router.dart';
import 'package:file_transfer_mobile/viewmodel/media_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  //Repositories
  getIt.registerLazySingleton<MediaRepository>(() => MediaRepository());

  // ViewModels

  getIt.registerLazySingleton<MediaViewModel>(
    () => MediaViewModel(repository: getIt<MediaRepository>()),
  );

  // Router
  getIt.registerSingleton<AppRouter>(AppRouter());
}
