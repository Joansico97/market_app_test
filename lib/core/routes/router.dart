import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app_test/pages/pages.dart';

part './routes_handlers.dart';

class RouterNavConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: <GoRoute>[
      GoRoute(
        path: '/login',
        builder: _loginPage,
      ),
      GoRoute(
        path: '/home',
        builder: _homePageBuilder,
      ),
      GoRoute(
        path: '/detail',
        name: '/detail',
        builder: _detailPage,
      ),
    ],
    errorBuilder: _errorBuilder,
  );
}
