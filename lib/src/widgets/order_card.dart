// ignore_for_file: no_default_cases

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/helpers/screens.dart';
import 'package:yanapay/src/models/order_model.dart';
import 'package:yanapay/src/widgets/custom_network_image.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    required this.order,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color statusOrderColorType(OrderStatus val) {
      switch (val) {
        case OrderStatus.Anulado:
          return const Color(0xFFE77E1D);
        case OrderStatus.Pagado:
          return const Color(0xFFE3E71D);
        case OrderStatus.Finalizado:
          return const Color(0xFF14BD18);
        default:
          return const Color(0xFFE3E71D);
      }
    }

    String statusOrderLabelType(OrderStatus val) {
      switch (val) {
        case OrderStatus.Pagado:
          return 'Pagado';
        case OrderStatus.Anulado:
          return 'Anulado';
        case OrderStatus.Pausa:
          return 'Caso abierto';
        case OrderStatus.Finalizado:
          return 'Finalizado';
      }
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: const EdgeInsets.only(bottom: Const.space15),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(Routes.orderDetail),
        borderRadius: BorderRadius.circular(Const.radius),
        child: SizedBox(
          width: Screens.width(context),
          height: 250,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space15,
                  vertical: Const.space8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Orden 001',
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: Const.space8),
                        AutoSizeText(
                          DateFormat.yMMMd().format(order.dateOrder!),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Icon(FeatherIcons.moreVertical, color: theme.hintColor)
                  ],
                ),
              ),
              Divider(color: theme.colorScheme.background, thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space15,
                ),
                child: Row(
                  children: [
                    CustomNetworkImage(
                      image: order.products!.first.productImage!,
                      width: 65,
                      height: 65,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Const.space12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              order.products!.first.productName!,
                              style: theme.textTheme.headlineSmall,
                              maxLines: 1,
                            ),
                            const SizedBox(height: Const.space8),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Cantidad',
                                  style: theme.textTheme.bodyMedium,
                                  maxLines: 1,
                                ),
                                const SizedBox(width: 5),
                                AutoSizeText(
                                  order.products!.first.qty.toString(),
                                  style: theme.textTheme.headlineSmall,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            const SizedBox(height: Const.space8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  NumberFormat.currency(
                                    symbol: r'YP ',
                                    decimalDigits: 0,
                                  ).format(order.products!.first.price),
                                  style: theme.textTheme.headlineSmall,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  // ignore: lines_longer_than_80_chars
                                  '${order.products!.length} ${'producto'}',
                                  style: theme.textTheme.bodyLarge,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(color: theme.colorScheme.background, thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.margin,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Pago total',
                          style: theme.textTheme.bodyLarge,
                        ),
                        AutoSizeText(
                          NumberFormat.currency(
                            symbol: r'YP ',
                            decimalDigits: 0,
                          ).format(order.total! * 2),
                          style: theme.textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: statusOrderColorType(order.status!),
                        borderRadius: BorderRadius.circular(Const.radius),
                      ),
                      child: AutoSizeText(
                        statusOrderLabelType(order.status!),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
