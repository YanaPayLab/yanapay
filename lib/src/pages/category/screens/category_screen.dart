part of '../category_page.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'Categorias',
      ),
      body: ResponsiveGridList(
        desiredItemWidth: 100,
        minSpacing: Const.margin,
        children: CategoryList.categoryList(context).map((e) {
          final category = e;
          return CategoryCard(
            category: category,
          );
        }).toList(),
      ),
    );
  }
}
