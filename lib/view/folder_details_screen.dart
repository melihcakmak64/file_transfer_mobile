import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

@RoutePage()
class FolderDetailScreen extends StatelessWidget {
  final String title;
  final List<AssetEntity> assets;

  const FolderDetailScreen({
    super.key,
    required this.title,
    required this.assets,
  });

  bool get _isImageGrid =>
      assets.isNotEmpty && assets.first.type == AssetType.image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _isImageGrid ? _buildGrid() : _buildList(),
    );
  }

  /// 🖼️ GRID (Images)
  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: assets.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (_, i) {
        final asset = assets[i];

        return GestureDetector(
          onTap: () async {
            final file = await asset.file;
            if (file != null) {
              debugPrint(file.path);
            }
          },
          child: Image(
            image: AssetEntityImageProvider(
              asset,
              thumbnailSize: const ThumbnailSize(300, 300),
            ),
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  /// 📄 LIST (Video / Audio)
  Widget _buildList() {
    return ListView.builder(
      itemCount: assets.length,
      itemBuilder: (_, i) {
        final asset = assets[i];

        return ListTile(
          leading: Image(
            image: AssetEntityImageProvider(
              asset,
              thumbnailSize: const ThumbnailSize(120, 120),
            ),
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
          title: Text(asset.title ?? 'Unknown'),
          subtitle: Text(
            asset.type == AssetType.video
                ? 'Video • ${asset.duration}s'
                : 'Audio',
          ),
          onTap: () async {
            final file = await asset.file;
            if (file != null) {
              debugPrint(file.path);
            }
          },
        );
      },
    );
  }
}
