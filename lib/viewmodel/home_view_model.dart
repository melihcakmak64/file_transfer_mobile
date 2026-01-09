import 'dart:async';
import 'package:file_transfer_mobile/repository/home_repository.dart';
import 'package:installed_apps/app_info.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

enum HomeState { idle, loading, loaded }

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final HomeRepository repository;
  _HomeViewModelBase({required this.repository});

  @observable
  List<AppInfo> apps = [];

  @observable
  HomeState homeState = HomeState.idle;

  @action
  Future<void> getInstalledApps() async {
    homeState = HomeState.loading;
    homeState = HomeState.loaded;
  }
}
