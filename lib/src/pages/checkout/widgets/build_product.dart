part of '../checkout_page.dart';

class _BuildProducts extends StatelessWidget {
  const _BuildProducts({
    required this.checkout,
    Key? key,
  }) : super(key: key);

  final CheckoutModel? checkout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: AutoSizeText(
            '${checkout!.products!.length} items',
            style: theme.textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: Const.space8),
        SizedBox(
          width: Screens.width(context),
          height: 145,
          child: ListView.builder(
            itemCount: checkout!.products!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: Const.margin,
            ),
            itemBuilder: (context, index) {
              final product = checkout!.products![index];

              return ProductCheckoutCard(product: product);
            },
          ),
        ),
      ],
    );
  }
}
