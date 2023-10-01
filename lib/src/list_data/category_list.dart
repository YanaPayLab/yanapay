import 'package:flutter/material.dart';
import 'package:yanapay/src/helpers/constants.dart';
import 'package:yanapay/src/models/category_model.dart';

class CategoryList {
  static List<CategoryModel> categoryList(BuildContext context) => [
        CategoryModel(
          name: 'Blouse',
          icon: CustomIcon.blouse,
        ),
        CategoryModel(
          name: 'sneaker',
          icon: CustomIcon.sneaker,
        ),
        CategoryModel(
          name: 'tshirt',
          icon: CustomIcon.tshirt,
        ),
        CategoryModel(
          name: 'watch',
          icon: CustomIcon.watch,
        ),
      ];

  static List<CategoryModel> menList(BuildContext context) => [
        CategoryModel(
          name: 'sneaker',
          icon: CustomIcon.sneaker,
        ),
        CategoryModel(
          name: 'tshirt',
          icon: CustomIcon.tshirt,
        ),
        CategoryModel(
          name: 'watch',
          icon: CustomIcon.watch,
        ),
      ];

  static List<CategoryModel> womanList(BuildContext context) => [
        CategoryModel(
          name: 'blouse',
          icon: CustomIcon.blouse,
        ),
        CategoryModel(
          name: 'sneaker',
          icon: CustomIcon.sneaker,
        ),
        CategoryModel(
          name: 'tshirt',
          icon: CustomIcon.tshirt,
        ),
        CategoryModel(
          name: 'watch',
          icon: CustomIcon.watch,
        ),
      ];
  static List<CategoryModel> kidsList(BuildContext context) => [
        CategoryModel(
          name: 'blouse',
          icon: CustomIcon.blouse,
        ),
        CategoryModel(
          name: 'sneaker',
          icon: CustomIcon.sneaker,
        ),
        CategoryModel(
          name: 'tshirt',
          icon: CustomIcon.tshirt,
        ),
        CategoryModel(
          name: 'watch',
          icon: CustomIcon.watch,
        ),
      ];
  static List<CategoryModel> luxuryList(BuildContext context) => [
        CategoryModel(
          name: 'blouse',
          icon: CustomIcon.blouse,
        ),
        CategoryModel(
          name: 'sneaker',
          icon: CustomIcon.sneaker,
        ),
        CategoryModel(
          name: 'tshirt',
          icon: CustomIcon.tshirt,
        ),
        CategoryModel(
          name: 'watch',
          icon: CustomIcon.watch,
        ),
      ];
}
