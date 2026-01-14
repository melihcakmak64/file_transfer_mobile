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

  // ---------------- UI STATE ----------------

  @observable
  HomeState homeState = HomeState.idle;

  @observable
  MediaType currentType = MediaType.videos;

  /// Aktif tabın klasörleri (UI bunu dinler)
  @observable
  ObservableMap<String, List<AssetEntity>> folders = ObservableMap();

  // ---------------- CACHE ----------------

  /// MediaType bazlı cache
  @observable
  ObservableMap<MediaType, Map<String, List<AssetEntity>>> cache =
      ObservableMap();

  // ---------------- SELECTION STATE ----------------

  /// Her MediaType için ayrı seçim
  @observable
  ObservableMap<MediaType, ObservableSet<String>> selectedByType =
      ObservableMap.of({
    MediaType.videos: ObservableSet<String>(),
    MediaType.music: ObservableSet<String>(),
    MediaType.images: ObservableSet<String>(),
  });

  // ---------------- PRIVATE HELPERS ----------------

  ObservableSet<String> get _currentSelection =>
      selectedByType[currentType]!;

  // ---------------- DATA ACTIONS ----------------

  @action
  Future<void> fetchFiles(MediaType type) async {
    currentType = type;

    // ✅ Cache varsa direkt kullan
    if (cache.containsKey(type)) {
      folders
        ..clear()
        ..addAll(cache[type]!);
      homeState = HomeState.loaded;
      return;
    }

    homeState = HomeState.loading;

    final hasPermission =
        await PermissionService.requestMediaPermissions();
    if (!hasPermission) {
      homeState = HomeState.idle;
      return;
    }

    final result = await repository.fetchFiles(type);

    // Cache'e yaz
    cache[type] = result;

    folders
      ..clear()
      ..addAll(result);

    homeState = HomeState.loaded;
  }

  // ---------------- SELECTION ACTIONS ----------------

  @action
  void toggleAsset(AssetEntity asset) {
    final id = asset.id;
    if (_currentSelection.contains(id)) {
      _currentSelection.remove(id);
    } else {
      _currentSelection.add(id);
    }
  }

  @action
  void toggleFolder(String folderName) {
    final assets = folders[folderName];
    if (assets == null || assets.isEmpty) return;

    final allSelected =
        assets.every((a) => _currentSelection.contains(a.id));

    for (final asset in assets) {
      if (allSelected) {
        _currentSelection.remove(asset.id);
      } else {
        _currentSelection.add(asset.id);
      }
    }
  }

  // ---------------- DERIVED (HESAPLANAN) ----------------

  bool isAssetSelected(AssetEntity asset) =>
      _currentSelection.contains(asset.id);

  bool isFolderSelected(String folderName) {
    final assets = folders[folderName];
    if (assets == null || assets.isEmpty) return false;

    return assets.every((a) => _currentSelection.contains(a.id));
  }

  bool isFolderPartiallySelected(String folderName) {
    final assets = folders[folderName];
    if (assets == null || assets.isEmpty) return false;

    final selectedCount =
        assets.where((a) => _currentSelection.contains(a.id)).length;

    return selectedCount > 0 && selectedCount < assets.length;
  }

  @computed
  int get selectedCount => _currentSelection.length;

  // ---------------- EXTRA (TRANSFER / UX) ----------------

  /// Aktif tab için seçilenler
  List<String> getSelectedIdsForCurrentType() =>
      _currentSelection.toList();

  /// Tüm tablardan seçilenler
  List<String> getAllSelectedIds() =>
      selectedByType.values.expand((e) => e).toList();

  /// Aktif tabı zorla yenile
  @action
  Future<void> refreshCurrentTab() async {
    cache.remove(currentType);
    await fetchFiles(currentType);
  }

  /// Tüm cache ve seçimleri temizle
  @action
  void clearAll() {
    cache.clear();
    for (final set in selectedByType.values) {
      set.clear();
    }
    folders.clear();
    homeState = HomeState.idle;
  }
}
