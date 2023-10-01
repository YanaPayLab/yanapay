part of '../checkout_page.dart';

class _FooterSection extends StatelessWidget {
  final int? couponId;
  final CheckoutModel? checkout;
  final double? discount;
  final int? priceTotal;
  final int? total;

  const _FooterSection({
    Key? key,
    this.couponId,
    this.checkout,
    this.discount,
    this.priceTotal,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<CheckoutProvider>(
      builder: (context, provider, snapshot) {
        return Container(
          width: Screens.width(context),
          height: 225,
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: Const.space12,
          ),
          decoration: BoxDecoration(
            color: theme.cardColor,
          ),
          child: Column(
            children: [
              const SizedBox(height: Const.space8),
              const SizedBox(height: Const.space8),
              _BuildPriceDetail(
                title: 'price_total',
                value: priceTotal,
              ),
              const SizedBox(height: Const.space8),
              Divider(color: theme.hintColor),
              const SizedBox(height: Const.space8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'total',
                    style: theme.textTheme.headlineSmall,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                      decimalDigits: 0,
                    ).format(total ?? 0),
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: Const.space8),
              if (provider.isLoading ?? true)
                const CustomLoadingIndicator()
              else
                CustomElevatedButton(
                  onTap: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.toNamed<dynamic>(Routes.checkoutSuccess);
                      provider.isLoading = false;
                    });
                  },
                  label: 'Comprar',
                ),
            ],
          ),
        );
      },
    );
  }
}
