import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/pages/login_page/views/login_view_mobile.dart';

import '../../core/utils/utils.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final  = ref.watch();

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
                return const LoginViewMobile();
              }
            },
          ),
        ),
      ),
    );
  }
}
