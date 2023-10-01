import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/models/cart_model.dart';
import 'package:yanapay/src/widgets/custom_network_image.dart';

class ProductCheckoutCard extends StatelessWidget {
  const ProductCheckoutCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color colorType(int val) {
      switch (val) {
        case 0:
          return const Color(0xFF6D9BE1);
        case 1:
          return const Color(0xFFBF5E5A);
        case 2:
          return const Color(0xFFA1ABBD);
        case 3:
          return const Color(0xFF699156);
        case 4:
          return const Color(0xFFC58F5E);
        case 5:
          return const Color(0xFFA872B1);
        default:
          return const Color(0xFFFFFFFF);
      }
    }

    String sizeType(int val) {
      switch (val) {
        case 0:
          return 'M';
        case 1:
          return 'L';
        case 2:
          return 'XL';
        case 3:
          return 'XXL';
        default:
          return 'M';
      }
    }

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: const EdgeInsets.only(
        right: Const.space15,
        bottom: 2,
      ),
      child: SizedBox(
        width: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Const.space8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(
                    image: product.productImage!,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(width: Const.space8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.productName!,
                          style: theme.textTheme.headlineSmall,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            AutoSizeText(
                              'color',
                              style: theme.textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: colorType(product.color!),
                            ),
                            const SizedBox(width: Const.space8),
                            AutoSizeText(
                              'size',
                              style: theme.textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            AutoSizeText(
                              sizeType(product.size!),
                              style: theme.textTheme.headlineSmall,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        // const SizedBox(width: Const.space8),
                        Row(
                          children: [
                            AutoSizeText(
                              'qty',
                              style: theme.textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 5),
                            AutoSizeText(
                              product.qty.toString(),
                              style: theme.textTheme.headlineSmall,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: theme.hintColor),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'total',
                    style: theme.textTheme.bodyLarge,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(product.price),
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
