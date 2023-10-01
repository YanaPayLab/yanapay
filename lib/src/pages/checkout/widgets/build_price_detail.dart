part of '../checkout_page.dart';

class _BuildPriceDetail extends StatelessWidget {
  final String title;
  final int? value;
  final bool isDiscount;

  const _BuildPriceDetail({
    required this.title,
    this.value,
    this.isDiscount = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(title, style: theme.textTheme.bodyLarge),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isDiscount ? '- ' : '',
                style: theme.textTheme.headlineSmall,
              ),
              TextSpan(
                text: NumberFormat.currency(
                  symbol: r'$',
                  decimalDigits: 0,
                ).format(value),
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
