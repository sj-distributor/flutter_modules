/*
 * @Author: Marlon.M
 * @Email: maiguangyang@163.com
 * @Date: 2024-07-31 18:52:22
 */

import 'package:flutter/material.dart' hide Route;
import 'package:go_router/go_router.dart';

import '../../utils/index.dart';
import 'route.dart';

abstract class IRouterAbstract {
  late List<FlutterRoute> routes;
  late List<NavigatorObserver>? observers = [];
  Route? initRoute;

  /// 根据自定义路由FlutterRoute
  /// 组装成GoRoute
  GoRouter generateRoutes() {
    List<GoRoute> routes = [];
    for (var item in this.routes) {
      final route = GoRoute(
        name: item.name,
        path: item.path,
        builder: item.builder,
      );

      routes.add(route);
    }

    final router = GoRouter(
      initialLocation: initRoute?.path,
      routes: routes,
      navigatorKey: NavigatorUtils.navigatorKey,
      observers: observers,
    );
    return router;
  }
}
