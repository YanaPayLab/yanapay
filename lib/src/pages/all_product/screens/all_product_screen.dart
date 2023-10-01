part of '../all_product_page.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);
  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  String _title = '';
  bool _isLowerPrice = false;
  List<ProductModel> productList = ProductList.allProduct;
  Comparator<ProductModel>? priceComparator;

  @override
  void initState() {
    super.initState();
    _title = Get.arguments as String;
  }

  Future<dynamic> _priceSort(bool? val) async {
    switch (val) {
      case true:
        priceComparator = (a, b) => a.price!.compareTo(b.price!);
        ProductList.newProductList.sort(priceComparator);
        break;
      case false:
        priceComparator = (a, b) => b.price!.compareTo(a.price!);
        ProductList.newProductList.sort(priceComparator);
        break;
      default:
        priceComparator = (a, b) => a.price!.compareTo(b.price!);
        ProductList.newProductList.sort(priceComparator);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: _title,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.search),
            icon: const Icon(FeatherIcons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: Screens.width(context),
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  _title,
                  style: theme.textTheme.headlineLarge!.copyWith(fontSize: 30),
                ),
                const SizedBox(height: Const.space15),
                Row(
                  children: [
                    _BuildFilterButton(
                      icon: (_isLowerPrice == true)
                          ? FeatherIcons.arrowDown
                          : FeatherIcons.arrowUp,
                      label: 'sort_by',
                      onTap: () {
                        setState(() {
                          _priceSort(_isLowerPrice = !_isLowerPrice);
                        });
                      },
                      isSort: true,
                    ),
                    const SizedBox(width: 2),
                    _BuildFilterButton(
                      icon: FeatherIcons.filter,
                      label: 'filter',
                      onTap: () {
                        showFlexibleBottomSheet<dynamic>(
                          minHeight: 0,
                          initHeight: 0.5,
                          maxHeight: 1,
                          context: context,
                          builder: (
                            context,
                            scrollController1,
                            bottomSheetOffset,
                          ) =>
                              FilterScreen(scrollController: scrollController1),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ResponsiveGridList(
              desiredItemWidth: 150,
              minSpacing: Const.margin,
              children: ProductList.newProductList.map((e) {
                final product = e;
                return ProductCard(product: product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
