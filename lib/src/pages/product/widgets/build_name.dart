part of '../product_page.dart';

class _BuildName extends StatelessWidget {
  const _BuildName({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AutoSizeText(
              product.name!,
              style: theme.textTheme.headlineLarge,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
