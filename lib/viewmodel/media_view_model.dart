import 'package:file_transfer_mobile/core/services/permission_handler.dart';
import 'package:file_transfer_mobile/repository/media_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:photo_manager/photo_manager.dart';

part 'media_view_model.g.dart';

enum HomeState { idle, loading, loaded }

enum MediaType { videos, music, images }

class MediaViewModel = _MediaViewModelBase with _$MediaViewModel;

abstract class _MediaViewModelBase with Store {
  final MediaRepository repository;
  _MediaViewModelBase({required this.repository});

  @observable
  HomeState homeState = HomeState.idle;

  @observable
  ObservableMap<String, List<AssetEntity>> folders = ObservableMap();

  @action
  Future<void> fetchFiles(MediaType type) async {
    homeState = HomeState.loading;

    final hasPermission = await PermissionService.requestMediaPermissions();
    if (!hasPermission) {
      homeState = HomeState.idle;
      return;
    }

    folders.clear();
    final result = await repository.fetchFiles(type);
    folders.addAll(result);

    homeState = HomeState.loaded;
  }
}
