part of '../home_page.dart';

class _BuildAppBar extends StatelessWidget {
  const _BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      height: 60,
      child: Container(
        color: theme.colorScheme.background,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(Const.radius),
            image: const DecorationImage(
              image: CachedNetworkImageProvider(
                'https://s2.coinmarketcap.com/static/img/coins/200x200/1027.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
