part of '../checkout_page.dart';

class _BuildLabelSection extends StatelessWidget {
  const _BuildLabelSection({
    required this.label,
    required this.onViewAllTap,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? trailing;
  final VoidCallback onViewAllTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.headlineSmall),
          InkWell(
            onTap: onViewAllTap,
            borderRadius: BorderRadius.circular(15),
            child: Text(
              trailing ?? 'see_all',
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
