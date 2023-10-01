import 'package:flutter/material.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/models/on_boarding_model.dart';
 

class OnBoardingList {
  static List<OnBoardingModel> onBoardingList(BuildContext context) => [
    OnBoardingModel(
      image: Images.onBoarding1,
      title: 'YanaPay',
      subtitle: 'Facilita la vida, ahorra tiempo.',
    ),
    OnBoardingModel(
      image: Images.onBoarding2,
      title: 'Pagos en línea',
      subtitle: 'Transacciones seguras con criptomonedas.',
    ),
    OnBoardingModel(
      image: Images.onBoarding3,
      title: 'Seguridad',
      subtitle: 'Transparencia, compromiso, calidad e integridad.',
    ),
  ];
}
