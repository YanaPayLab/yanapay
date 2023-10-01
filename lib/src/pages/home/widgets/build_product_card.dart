part of '../home_page.dart';

class _BuildProductCard extends StatelessWidget {
  const _BuildProductCard({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final discountPrice = product.price!;

    return Padding(
      padding: const EdgeInsets.only(right: Const.space15),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(Routes.product, arguments: product),
        borderRadius: BorderRadius.circular(Const.radius),
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(Const.radius),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: theme.disabledColor,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                    product.images!.first,
                  ),
                ),
              ),
              const SizedBox(height: Const.space8),
              Container(
                width: 170,
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
                        symbol: r'YP ',
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
      ),
    );
  }
}
