import 'package:auto_route/auto_route.dart';
import 'package:file_transfer_mobile/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel homeViewModel = GetIt.I<HomeViewModel>();
  int activeGenreIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await homeViewModel.getInstalledApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            // Loading State
            if (homeViewModel.homeState == HomeState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: homeViewModel.apps.length,
              itemBuilder: (context, index) {
                return Text("Initial");
              },
            );
          },
        ),
      ),
    );
  }
}
