import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:market_app_test/core/utils/debouncer.dart';
import 'package:market_app_test/core/utils/utils.dart';
import 'package:market_app_test/data/models/models.dart';
import 'package:market_app_test/pages/home_page/widgets/widgets.dart';

import '../riverpod/home_page_states.dart';

class HomeViewMobile extends ConsumerWidget {
  const HomeViewMobile({
    super.key,
    required this.productsList,
  });
  final List<ProductModel> productsList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageProvider);
    final notifier = ref.watch(homePageProvider.notifier);
    final List<ProductModel> productsSearchList = [];
    final debouncer = Debouncer(milliseconds: 500);

    return SizedBox(
      height: size.fullHeight(context),
      width: size.fullWidth(context),
      child: Column(
        children: [
          Container(
            height: size.height(context, .1),
            width: size.fullWidth(context),
            color: colors.primaryColor,
            alignment: Alignment.centerLeft,
            padding: size.horizontal(context, .08),
            child: Text(
              'Prueba de ingreso',
              style: textStyles.medium(color: colors.white),
            ),
          ),
          Expanded(
            child: Padding(
              padding: size.symmetric(context, .1, .08),
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    controller: searchBarController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colors.transparent,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colors.primaryColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: colors.primaryColor,
                        ),
                      ),
                      labelText: 'Buscar producto',
                      labelStyle: textStyles.small(
                        color: colors.primaryColor,
                      ),
                    ),
                    style: textStyles.small(
                      color: colors.textColor,
                    ),
                    onChanged: (value) {
                      debouncer.run(() {
                        notifier.changeSearch(text: value);
                      });
                    },
                  ),
                  SizedBox(height: size.height(context, .05)),
                  state.productSearchList!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: productsSearchList.length,
                            itemBuilder: (context, index) => CardProduct(
                              product: productsSearchList[index],
                              index: index,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: productsList.length,
                            itemBuilder: (context, index) => CardProduct(
                              product: productsList[index],
                              index: index,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
