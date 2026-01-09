// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MediaViewModel on _MediaViewModelBase, Store {
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

  late final _$fetchFilesAsyncAction = AsyncAction(
    '_MediaViewModelBase.fetchFiles',
    context: context,
  );

  @override
  Future<void> fetchFiles(MediaType type) {
    return _$fetchFilesAsyncAction.run(() => super.fetchFiles(type));
  }

  @override
  String toString() {
    return '''
homeState: ${homeState},
folders: ${folders}
    ''';
  }
}
