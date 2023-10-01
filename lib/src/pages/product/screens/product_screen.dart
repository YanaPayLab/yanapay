part of '../product_page.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isLiked = false;
  int _qty = 1;
  late ProductModel product;

  @override
  void initState() {
    super.initState();
    product = Get.arguments as ProductModel;
  }

  @override
  Widget build(BuildContext context) {
    final price = product.price!;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _BuildAppBar(
                  product: product,
                  isLiked: _isLiked,
                  onFavoriteTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  onLeadingTap: () {
                    Future.delayed(
                      const Duration(microseconds: 100),
                      () => Get.back<dynamic>(),
                    ).then((value) => setState(() {}));
                  },
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: Const.margin),
                      _BuildName(product: product),
                      const SizedBox(height: Const.space25),
                      _BuildDescription(product: product),
                      const SizedBox(height: Const.space25),
                    ],
                  ),
                )
              ],
            ),
          ),
          _FooterSection(
            product: product,
            qty: _qty,
            total: price.toInt() * _qty,
            onAddTap: () {
              setState(() => _qty = max(1, _qty + 1));
            },
            onRemoveTap: () {
              if (_qty != 1) {
                setState(() {
                  _qty = min(50, _qty - 1);
                });
              }
            },
            onAddToCartTap: () {
              showToast(msg: 'Agregar al carrito');
            },
          )
        ],
      ),
    );
  }
}
