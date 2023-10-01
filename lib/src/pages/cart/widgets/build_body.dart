part of '../cart_page.dart';

class _BuildBody extends StatefulWidget {
  const _BuildBody({Key? key}) : super(key: key);

  @override
  __BuildBodyState createState() => __BuildBodyState();
}

class __BuildBodyState extends State<_BuildBody> {
  var _total = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final priceList = CartList.cartList.map((cart) => cart.price);
    _total = priceList.fold<int>(0, (p, c) => p + c!);

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: CartList.cartList.length,
            separatorBuilder: (context, index) {
              return Divider(color: theme.hintColor);
            },
            itemBuilder: (context, index) {
              final cart = CartList.cartList[index];
              return CartCard(
                cart: cart,
                onRemoveTap: (_) {
                  showToast(msg: 'Eliminar producto');
                  CartList.cartList.removeAt(index);
                  setState(() {});
                },
              );
            },
          ),
        ),
        _FooterSection(
          total: _total,
          onCheckoutTap: () async {
            print('Enviar monedas a Yanapay');
            String keyBuyer = '0f98e692655e696cb317af59fe106ca638811ffd67fe5c36c3537d9752e61b06';
            int pay = 1110;
            // await sendYanaPay(keyBuyer, pay);
            Get.toNamed<dynamic>(
              Routes.checkoutSuccess,
              arguments: CheckoutModel(
                products: CartList.cartList,
                couponId: 2,
              ),
            );
          },
        )
      ],
    );
  }
}
