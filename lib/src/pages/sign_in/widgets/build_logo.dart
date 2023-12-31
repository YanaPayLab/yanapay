part of '../sign_in_page.dart';

class _BuildLogo extends StatelessWidget {
  const _BuildLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      CustomIcon.logo,
      width: Screens.width(context) / 10,
      height: Screens.width(context) / 10,
    );
  }
}
