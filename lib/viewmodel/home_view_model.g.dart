// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$appsAtom = Atom(
    name: '_HomeViewModelBase.apps',
    context: context,
  );

  @override
  List<AppInfo> get apps {
    _$appsAtom.reportRead();
    return super.apps;
  }

  @override
  set apps(List<AppInfo> value) {
    _$appsAtom.reportWrite(value, super.apps, () {
      super.apps = value;
    });
  }

  late final _$homeStateAtom = Atom(
    name: '_HomeViewModelBase.homeState',
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

  late final _$getInstalledAppsAsyncAction = AsyncAction(
    '_HomeViewModelBase.getInstalledApps',
    context: context,
  );

  @override
  Future<void> getInstalledApps() {
    return _$getInstalledAppsAsyncAction.run(() => super.getInstalledApps());
  }

  @override
  String toString() {
    return '''
apps: ${apps},
homeState: ${homeState}
    ''';
  }
}
