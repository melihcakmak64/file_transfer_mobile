// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MediaViewModel on _MediaViewModelBase, Store {
  Computed<int>? _$selectedCountComputed;

  @override
  int get selectedCount => (_$selectedCountComputed ??= Computed<int>(
    () => super.selectedCount,
    name: '_MediaViewModelBase.selectedCount',
  )).value;

  late final _$homeStateAtom = Atom(
    name: '_MediaViewModelBase.homeState',
    context: context,
  );

  @override
  HomeState get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(HomeState value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  late final _$currentTypeAtom = Atom(
    name: '_MediaViewModelBase.currentType',
    context: context,
  );

  @override
  MediaType get currentType {
    _$currentTypeAtom.reportRead();
    return super.currentType;
  }

  @override
  set currentType(MediaType value) {
    _$currentTypeAtom.reportWrite(value, super.currentType, () {
      super.currentType = value;
    });
  }

  late final _$foldersAtom = Atom(
    name: '_MediaViewModelBase.folders',
    context: context,
  );

  @override
  ObservableMap<String, List<AssetEntity>> get folders {
    _$foldersAtom.reportRead();
    return super.folders;
  }

  @override
  set folders(ObservableMap<String, List<AssetEntity>> value) {
    _$foldersAtom.reportWrite(value, super.folders, () {
      super.folders = value;
    });
  }

  late final _$cacheAtom = Atom(
    name: '_MediaViewModelBase.cache',
    context: context,
  );

  @override
  ObservableMap<MediaType, Map<String, List<AssetEntity>>> get cache {
    _$cacheAtom.reportRead();
    return super.cache;
  }

  @override
  set cache(ObservableMap<MediaType, Map<String, List<AssetEntity>>> value) {
    _$cacheAtom.reportWrite(value, super.cache, () {
      super.cache = value;
    });
  }

  late final _$selectedByTypeAtom = Atom(
    name: '_MediaViewModelBase.selectedByType',
    context: context,
  );

  @override
  ObservableMap<MediaType, ObservableSet<String>> get selectedByType {
    _$selectedByTypeAtom.reportRead();
    return super.selectedByType;
  }

  @override
  set selectedByType(ObservableMap<MediaType, ObservableSet<String>> value) {
    _$selectedByTypeAtom.reportWrite(value, super.selectedByType, () {
      super.selectedByType = value;
    });
  }

  late final _$fetchFilesAsyncAction = AsyncAction(
    '_MediaViewModelBase.fetchFiles',
    context: context,
  );

  @override
  Future<void> fetchFiles(MediaType type) {
    return _$fetchFilesAsyncAction.run(() => super.fetchFiles(type));
  }

  late final _$refreshCurrentTabAsyncAction = AsyncAction(
    '_MediaViewModelBase.refreshCurrentTab',
    context: context,
  );

  @override
  Future<void> refreshCurrentTab() {
    return _$refreshCurrentTabAsyncAction.run(() => super.refreshCurrentTab());
  }

  late final _$_MediaViewModelBaseActionController = ActionController(
    name: '_MediaViewModelBase',
    context: context,
  );

  @override
  void toggleAsset(AssetEntity asset) {
    final _$actionInfo = _$_MediaViewModelBaseActionController.startAction(
      name: '_MediaViewModelBase.toggleAsset',
    );
    try {
      return super.toggleAsset(asset);
    } finally {
      _$_MediaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFolder(String folderName) {
    final _$actionInfo = _$_MediaViewModelBaseActionController.startAction(
      name: '_MediaViewModelBase.toggleFolder',
    );
    try {
      return super.toggleFolder(folderName);
    } finally {
      _$_MediaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo = _$_MediaViewModelBaseActionController.startAction(
      name: '_MediaViewModelBase.clearAll',
    );
    try {
      return super.clearAll();
    } finally {
      _$_MediaViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
homeState: ${homeState},
currentType: ${currentType},
folders: ${folders},
cache: ${cache},
selectedByType: ${selectedByType},
selectedCount: ${selectedCount}
    ''';
  }
}
