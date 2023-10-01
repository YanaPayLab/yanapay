part of '../home_page.dart';

class _BuildHeader extends StatelessWidget {
  const _BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Const.margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Hola!!',
            style: theme.textTheme.headlineLarge!.copyWith(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
