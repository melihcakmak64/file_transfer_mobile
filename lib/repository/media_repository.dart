import 'package:photo_manager/photo_manager.dart';
import '../viewmodel/media_view_model.dart';

class MediaRepository {
  Future<Map<String, List<AssetEntity>>> fetchFiles(MediaType type) async {
    switch (type) {
      case MediaType.videos:
        return _fetchByRequestType(RequestType.video);
      case MediaType.music:
        return _fetchByRequestType(RequestType.audio);
      case MediaType.images:
        return _fetchByRequestType(RequestType.image);
    }
  }

  Future<Map<String, List<AssetEntity>>> _fetchByRequestType(
    RequestType requestType,
  ) async {
    final albums = await PhotoManager.getAssetPathList(
      type: requestType,
      hasAll: true,
    );

    final Map<String, List<AssetEntity>> result = {};

    for (final album in albums) {
      final assets = await album.getAssetListPaged(
        page: 0,
        size: 500,
      );

      if (assets.isEmpty) continue;
      result[album.name] = assets;
    }

    return result;
  }
}
