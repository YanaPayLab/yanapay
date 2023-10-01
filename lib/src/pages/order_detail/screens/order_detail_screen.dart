part of '../order_detail_page.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final order = OrderList.orderList[0];

    String statusOrderLabelType(OrderStatus val) {
      switch (val) {
        case OrderStatus.Pagado:
          return 'Pagado';
        case OrderStatus.Anulado:
          return 'Anulado';
        case OrderStatus.Pausa:
          return 'Caso abierto';
        case OrderStatus.Finalizado:
          return 'Finalizado';
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: 'Detalle del pedido',
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          AutoSizeText(
            'Estado',
            style: theme.textTheme.bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                statusOrderLabelType(order.status!),
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              CustomTextButton(
                label: 'Finalizar',
                onTap: () async {
                  print('Enviar al vendedor');
                  String privateKey = '0f98e692655e696cb317af59fe106ca638811ffd67fe5c36c3537d9752e61b06';
                  // await sendSeller(privateKey, 1169);
                },
                textColor: theme.primaryColor,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                'Fecha de la compra',
                style: theme.textTheme.titleLarge,
              ),
              AutoSizeText(
                DateFormat.yMMMEd().format(order.dateOrder!),
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: Const.space15),
          AutoSizeText(
            '${order.products!.length} ${'productos'}',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: Const.space15),
          AutoSizeText(
            'Informacion de pago',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: 'Token de pago',
            trailing: 'YanaPay',
          ),
          Divider(color: theme.hintColor),
          _BuildPaymentInformation(
            label: 'Comision',
            value: 11,
          ),
          const SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: 'Descuento 70YP',
            value: 70,
            isDiscount: true,
          ),
          const SizedBox(height: Const.space8),
          _BuildPaymentInformation(
            label: 'Precio total',
            value: 1169,
          ),
          Divider(color: theme.hintColor),
          _BuildPaymentInformation(
            label: 'Total',
            value: 1110,
            isTotal: true,
          ),
          const SizedBox(height: Const.space25),
        ],
      ),
    );
  }
}
