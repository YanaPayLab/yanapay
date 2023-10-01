import 'package:flutter/material.dart';

class SortAndFilterList {
  static List<String> sortList(BuildContext context) => [
        'popularity',
        'lowest_price_to_highest_price',
        'highest_price_to_lowest_price',
        'newly_listed',
        'discount',
      ];
  static List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  static List<Color> colorList = [
    const Color(0xFF6D9BE1),
    const Color(0xFFBF5E5A),
    const Color(0xFFA1ABBD),
    const Color(0xFF699156),
    const Color(0xFFC58F5E),
    const Color(0xFFA872B1),
  ];
  static List<String> categoryList(BuildContext context) => [
        'all',
        'men',
        'women',
        'boys',
        'girls',
      ];
  static List<String> brandList = [
    'Nike',
    'Supreme',
    'Adidas',
    'Rising 88',
    'Sophie Paris',
  ];
}
