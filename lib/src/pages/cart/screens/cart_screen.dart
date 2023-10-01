part of '../cart_page.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        title: 'Carrito de compras',
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.search),
            icon: const Icon(FeatherIcons.search),
          ),
        ],
      ),
      body: (CartList.cartList.isNotEmpty)
          ? const _BuildBody()
          : IllustrationWidget(
              icon: CustomIcon.shoppingBag,
              title: 'To tienes productos en tu carrito',
              subtitle: 'Cuando tengas productos en tu carrito, aparecerán aquí',
            ),
    );
  }
}
