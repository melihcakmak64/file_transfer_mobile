import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import '../viewmodel/media_view_model.dart';

@RoutePage()
class FolderDetailScreen extends StatelessWidget {
  final String title;
  final List<AssetEntity> assets;

  FolderDetailScreen({super.key, required this.title, required this.assets});

  final MediaViewModel vm = GetIt.I<MediaViewModel>();

  bool get _isImageGrid =>
      assets.isNotEmpty && assets.first.type == AssetType.image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _isImageGrid ? _buildGrid() : _buildList(),
    );
  }

  // 🖼️ IMAGE GRID
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

        return Observer(
          builder: (_) {
            final isSelected = vm.isAssetSelected(asset);

            return GestureDetector(
              onTap: () => vm.toggleAsset(asset),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetEntityImageProvider(
                      asset,
                      thumbnailSize: const ThumbnailSize(300, 300),
                    ),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (_) => vm.toggleAsset(asset),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // 📄 VIDEO / AUDIO LIST
  Widget _buildList() {
    return ListView.builder(
      itemCount: assets.length,
      itemBuilder: (_, i) {
        final asset = assets[i];

        return Observer(
          builder: (_) {
            final isSelected = vm.isAssetSelected(asset);

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
              trailing: Checkbox(
                value: isSelected,
                onChanged: (_) => vm.toggleAsset(asset),
              ),
              onTap: () => vm.toggleAsset(asset),
            );
          },
        );
      },
    );
  }
}
