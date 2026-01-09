// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:file_transfer_mobile/view/folder_details_screen.dart' as _i1;
import 'package:file_transfer_mobile/view/home_screen.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:photo_manager/photo_manager.dart' as _i5;

/// generated route for
/// [_i1.FolderDetailScreen]
class FolderDetailRoute extends _i3.PageRouteInfo<FolderDetailRouteArgs> {
  FolderDetailRoute({
    _i4.Key? key,
    required String title,
    required List<_i5.AssetEntity> assets,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         FolderDetailRoute.name,
         args: FolderDetailRouteArgs(key: key, title: title, assets: assets),
         initialChildren: children,
       );

  static const String name = 'FolderDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FolderDetailRouteArgs>();
      return _i1.FolderDetailScreen(
        key: args.key,
        title: args.title,
        assets: args.assets,
      );
    },
  );
}

class FolderDetailRouteArgs {
  const FolderDetailRouteArgs({
    this.key,
    required this.title,
    required this.assets,
  });

  final _i4.Key? key;

  final String title;

  final List<_i5.AssetEntity> assets;

  @override
  String toString() {
    return 'FolderDetailRouteArgs{key: $key, title: $title, assets: $assets}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}
