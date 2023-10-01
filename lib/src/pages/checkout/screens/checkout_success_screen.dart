part of '../checkout_page.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IllustrationWidget(
                icon: CustomIcon.shoppingBag,
                title: 'Transferencia exitosa',
                subtitle: 'Cuando te llegue tu pedido, no olvides completar la compra',
              ),
              const SizedBox(height: Const.space25),
              CustomElevatedButton(
                onTap: () {
                  Get.offAllNamed<dynamic>(Routes.home);
                  context.read<CartProvider>().cartList.clear();
                },
                label: 'Seguir comprando',
              ),
              const SizedBox(height: Const.space15),
              CustomTextButton(
                label: 'Ver mis pedidos',
                onTap: () {
                  Get.offAllNamed<dynamic>(Routes.order);
                  context.read<CartProvider>().cartList.clear();
                },
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
