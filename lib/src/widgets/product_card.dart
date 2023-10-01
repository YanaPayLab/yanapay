import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discountPrice = product.price!;

    return InkWell(
      onTap: () => Get.toNamed<dynamic>(Routes.product, arguments: product),
      borderRadius: BorderRadius.circular(Const.radius),
      child: Container(
        // width: 170,
        height: 280,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        child: Column(
          children: [
            Expanded(
              child: OctoImage(
                image: CachedNetworkImageProvider(
                  product.images!.first,
                ),
              ),
            ),
            const SizedBox(height: Const.space8),
            Container(
              // width: 170,
              height: 70,
              padding: const EdgeInsets.all(Const.space8),
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Const.radius),
                  bottomRight: Radius.circular(Const.radius),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      product.name ?? '',
                      maxLines: 1,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: Const.space8),
                  Text(
                    NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(product.price),
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
