import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/models/cart_model.dart';
import 'package:yanapay/src/widgets/custom_network_image.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  final void Function(BuildContext)? onRemoveTap;

  const CartCard({
    required this.cart,
    this.onRemoveTap,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onRemoveTap,
            icon: FeatherIcons.trash,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      // actionPane: const SlidableDrawerActionPane(),
      // secondaryActions: [
      //   IconSlideAction(
      //     icon: FeatherIcons.trash,
      //     color: Colors.red,
      //     onTap: onRemoveTap,
      //   ),
      // ],
      child: Container(
        height: 125,
        color: theme.cardColor,
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              image: cart.productImage!,
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space12,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      cart.productName!,
                      style: theme.textTheme.headlineSmall,
                      maxLines: 1,
                    ),
                    const SizedBox(height: Const.space8),
                    Row(
                      children: [
                        AutoSizeText(
                          'Cantidad:',
                          style: theme.textTheme.bodyMedium,
                          maxLines: 1,
                        ),
                        const SizedBox(width: 5),
                        AutoSizeText(
                          cart.qty.toString(),
                          style: theme.textTheme.headlineSmall,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    const SizedBox(height: Const.space8),
                    AutoSizeText(
                      NumberFormat.currency(
                        symbol: r'YP ',
                      ).format(cart.price),
                      style: theme.textTheme.headlineSmall,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
