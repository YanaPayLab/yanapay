part of '../product_page.dart';

class _BuildDescription extends StatelessWidget {
  const _BuildDescription({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'description',
            style: theme.textTheme.headlineSmall,
          ),
          ReadMoreText(
            product.description!,
            style: theme.textTheme.bodyLarge,
            trimMode: TrimMode.Line,
            trimLines: 5,
            trimCollapsedText: 'read_more',
            trimExpandedText: 'show_less',
            lessStyle: theme.textTheme.titleLarge!.copyWith(
              color: theme.primaryColor,
            ),
            moreStyle: theme.textTheme.titleLarge!.copyWith(
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
