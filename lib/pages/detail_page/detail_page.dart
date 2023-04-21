import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/data/models/models.dart';
import 'package:market_app_test/pages/detail_page/views/detail_view_mobile.dart';

import '../../core/utils/utils.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final ProductModel product;

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
                return DetailViewMobile(
                  index: index,
                  product: product,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
