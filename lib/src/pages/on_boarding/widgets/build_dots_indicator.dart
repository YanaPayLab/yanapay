part of '../on_boarding_page.dart';


class _BuildDotsIndicator extends StatelessWidget {
  const _BuildDotsIndicator({
    required int? currentIndex,
    Key? key,
  }) : _currentIndex = currentIndex, super(key: key);

  final int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Screens.heigth(context) / 5,
      left: 0,
      right: 0,
      child: CustomDotsIndicator(
        dotsCount: OnBoardingList.onBoardingList(context),
        position: _currentIndex,
      ),
    );
  }
}
