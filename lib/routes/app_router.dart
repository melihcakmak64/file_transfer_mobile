import 'package:auto_route/auto_route.dart';
import 'package:file_transfer_mobile/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: FolderDetailRoute.page),
  ];
}

final appRouter = AppRouter();
