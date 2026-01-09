import 'package:auto_route/auto_route.dart';
import 'package:file_transfer_mobile/routes/app_router.gr.dart';
import 'package:file_transfer_mobile/viewmodel/media_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MediaViewModel mediaViewModel = GetIt.I<MediaViewModel>();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      mediaViewModel.fetchFiles(MediaType.values[_tabController.index]);
    });

    mediaViewModel.fetchFiles(MediaType.videos);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (mediaViewModel.homeState == HomeState.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (mediaViewModel.homeState == HomeState.idle &&
            mediaViewModel.folders.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('Dosyalara erişim izni gerekli')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('File Transfer'),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Videos'),
                Tab(text: 'Music'),
                Tab(text: 'Images'),
              ],
            ),
          ),
          body: ListView(
            children: mediaViewModel.folders.entries.map((entry) {
              return ListTile(
                leading: const Icon(Icons.folder),
                title: Text(entry.key),
                subtitle: Text('${entry.value.length} item'),
                onTap: () {
                  context.router.push(
                    FolderDetailRoute(title: entry.key, assets: entry.value),
                  );
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
