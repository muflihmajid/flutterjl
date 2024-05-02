import 'package:skeleton_mobileapps/app/ui/pages/main/view.dart';
import 'package:skeleton_mobileapps/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class Router {
  late RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic>? getRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case Pages.main:
        return _buildRoute(settings, new MainPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings? settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
