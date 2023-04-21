import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/pages/home_page/riverpod/home_page_states.dart';
import 'package:market_app_test/pages/home_page/views/home_view_mobile.dart';

import '../../core/utils/utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageProvider);
    final productsList = ref.watch(homePageProvider.select((valueState) => valueState.productsList));
    // final notifier = ref.watch(homePageProvider.notifier);

    _homeInit(ref: ref);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.fullHeight(context),
          width: size.fullWidth(context),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1280) {
                return Container(
                  color: Colors.red,
                );
              } else if (constraints.maxWidth >= 650) {
                return Container(
                  color: Colors.blue,
                );
              } else {
                return HomeViewMobile(
                  productsList: productsList!,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _homeInit({required WidgetRef ref}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (ref.read(homePageProvider).productsList!.isEmpty) {
        await ref.read(homePageProvider.notifier).getAllProducts();
      }
    });
  }
}
