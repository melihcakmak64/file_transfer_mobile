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
  final MediaViewModel vm = GetIt.I<MediaViewModel>();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);

    vm.fetchFiles(MediaType.videos);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    vm.fetchFiles(MediaType.values[_tabController.index]);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            vm.selectedCount > 0
                ? '${vm.selectedCount} seçili'
                : 'File Transfer',
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Videos'),
            Tab(text: 'Music'),
            Tab(text: 'Images'),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          if (vm.homeState == HomeState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.homeState == HomeState.idle && vm.folders.isEmpty) {
            return const Center(child: Text('Dosyalara erişim izni gerekli'));
          }

          return ListView.separated(
            itemCount: vm.folders.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, index) {
              final entry = vm.folders.entries.elementAt(index);
              final folderName = entry.key;
              final assets = entry.value;

              return Observer(
                builder: (_) {
                  final isSelected = vm.isFolderSelected(folderName);
                  final isPartial = vm.isFolderPartiallySelected(folderName);

                  return ListTile(
                    leading: Checkbox(
                      tristate: true,
                      value: isSelected
                          ? true
                          : isPartial
                          ? null
                          : false,
                      onChanged: (_) => vm.toggleFolder(folderName),
                    ),
                    title: Text(folderName),
                    subtitle: Text('${assets.length} öğe'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(
                        FolderDetailRoute(title: folderName, assets: assets),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
