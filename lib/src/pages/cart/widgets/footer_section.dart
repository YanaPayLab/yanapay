part of '../cart_page.dart';

class _FooterSection extends StatelessWidget {
  final int? total;
  final VoidCallback? onCheckoutTap;

  const _FooterSection({
    Key? key,
    this.total,
    this.onCheckoutTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CartProvider>(
      builder: (context, cart, snapshot) {
        return Container(
          width: Screens.width(context),
          height: 155,
          color: theme.cardColor,
          padding: const EdgeInsets.symmetric(
            horizontal: Const.margin,
            vertical: Const.space8,
          ),
          child: Column(
            children: [
              const SizedBox(height: Const.space12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'total',
                    style: theme.textTheme.bodyLarge,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: r'$',
                    ).format(total),
                    style: theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(height: Const.space12),
              CustomElevatedButton(
                onTap: onCheckoutTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FeatherIcons.shoppingBag,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: Const.space12),
                    AutoSizeText(
                      'Realizar compra',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
