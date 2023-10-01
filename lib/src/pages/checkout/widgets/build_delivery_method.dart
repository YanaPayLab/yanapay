part of '../checkout_page.dart';

class _BuildDeliveryMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(
      builder: (context, checkout, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildLabelSection(
              label: 'delivery_method',
              trailing: 'change',
              onViewAllTap: () => Get.toNamed<dynamic>(Routes.shipping),
            ),
            const SizedBox(height: Const.space8),
            Container(
              width: Screens.width(context),
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: Const.margin),
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
                color: const Color(0xFFE3F1F2),
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(
                      23,
                    ),
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: ColorLight.fontTitle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
