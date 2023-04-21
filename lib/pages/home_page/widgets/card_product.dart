import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app_test/core/utils/utils.dart';
import 'package:market_app_test/data/models/models.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height(context, .14),
      width: size.fullWidth(context),
      alignment: Alignment.center,
      margin: size.bottom(context, .08),
      padding: size.vertical(context, .02),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: size.borderRadius(context, .03),
        border: Border.all(
          color: colors.primaryColor,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            // height: size.height(context, .14),
            width: size.width(context, .395),
            padding: size.all(context, .03),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.medium(
                      color: colors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: size.height(context, .01)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.brand!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.small(
                        color: colors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height(context, .01),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.sell_outlined,
                          color: colors.primaryColor,
                        ),
                        Text(
                          '\$ ${product.price!}',
                          style: textStyles.small(
                            color: colors.primaryColor,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: size.height(context, .14),
            width: size.width(context, .4),
            alignment: Alignment.centerRight,
            padding: size.all(context, .02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: size.height(context, .04),
                  width: size.width(context, .25),
                  decoration: BoxDecoration(
                    color: colors.primaryColor,
                    borderRadius: size.borderRadius(context, .01),
                  ),
                  padding: size.horizontal(context, .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: colors.yellow,
                      ),
                      Text(
                        '${product.rating!}',
                        style: textStyles.medium(
                          color: colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => context.pushNamed(
                    '/detail',
                    extra: {
                      'index': index,
                      'product': product,
                    },
                  ),
                  child: Container(
                    height: size.height(context, .04),
                    width: size.width(context, .35),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colors.secondaryColor,
                      borderRadius: size.borderRadius(context, .01),
                    ),
                    child: Text(
                      'Ver Detalle',
                      style: textStyles.small(
                        color: colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
