import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/core/config/app_config.dart';
import 'package:market_app_test/core/routes/router.dart';
import 'package:market_app_test/core/utils/utils.dart';

void main() async {
  await initConfig();
  runApp(
    const ProviderScope(
      child: MarketAppTest(),
    ),
  );
}

class MarketAppTest extends StatelessWidget {
  const MarketAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Market App Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colors.primaryColor,
        scaffoldBackgroundColor: colors.bodyColor,
      ),
      localeResolutionCallback: localeCallback,
      routeInformationProvider: RouterNavConfig.router.routeInformationProvider,
      routeInformationParser: RouterNavConfig.router.routeInformationParser,
      routerDelegate: RouterNavConfig.router.routerDelegate,
      scrollBehavior: AppScrollBehavior(),
    );
  }
}
