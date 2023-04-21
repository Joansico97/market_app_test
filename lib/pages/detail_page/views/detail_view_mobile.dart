import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market_app_test/core/utils/utils.dart';
import 'package:market_app_test/data/models/models.dart';

class DetailViewMobile extends StatelessWidget {
  const DetailViewMobile({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.fullHeight(context),
      width: size.fullWidth(context),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            height: size.height(context, .1),
            width: size.fullWidth(context),
            color: colors.primaryColor,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                SizedBox(width: size.width(context, .03)),
                Text(
                  'Detalle del producto',
                  style: textStyles.medium(color: colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  Swiper(
                    itemCount: product.images!.length,
                    layout: SwiperLayout.STACK,
                    itemWidth: size.fullWidth(context),
                    itemHeight: size.height(context, .4),
                    itemBuilder: (_, int index) {
                      return SizedBox(
                        child: Image(
                          image: NetworkImage(product.images![index]),
                          fit: BoxFit.fitHeight,
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding: size.symmetric(context, .1, .05),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              // height: size.height(context, .1),
                              width: size.fullWidth(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width(context, .45),
                                    child: Text(
                                      product.title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: textStyles.large(
                                        size: 28,
                                        color: colors.primaryColor,
                                      ),
                                    ),
                                  ),
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
                                ],
                              ),
                            ),
                            SizedBox(height: size.height(context, .03)),
                            SizedBox(
                              height: size.height(context, .05),
                              width: size.fullWidth(context),
                              child: Text(
                                'Descripción',
                                style: textStyles.medium(
                                  color: colors.primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.fullWidth(context),
                              child: Text(
                                product.description!,
                                style: textStyles.regular(
                                  color: colors.primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height(context, .02)),
                            SizedBox(
                              width: size.fullWidth(context),
                              child: Row(
                                children: [
                                  Text(
                                    'Marca:',
                                    style: textStyles.medium(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: size.width(context, .02)),
                                  Icon(
                                    Icons.sell_outlined,
                                    color: colors.primaryColor,
                                  ),
                                  SizedBox(width: size.width(context, .01)),
                                  Text(
                                    product.brand!,
                                    style: textStyles.regular(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height(context, .02)),
                            SizedBox(
                              width: size.fullWidth(context),
                              child: Row(
                                children: [
                                  Text(
                                    'Precio:',
                                    style: textStyles.medium(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: size.width(context, .01)),
                                  Text(
                                    '\$ ${product.price!}',
                                    style: textStyles.regular(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height(context, .02)),
                            SizedBox(
                              width: size.fullWidth(context),
                              child: Row(
                                children: [
                                  Text(
                                    'Categoría:',
                                    style: textStyles.medium(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: size.width(context, .01)),
                                  Text(
                                    product.category!,
                                    style: textStyles.regular(
                                      color: colors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height(context, .05)),
                          ],
                        ),
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
