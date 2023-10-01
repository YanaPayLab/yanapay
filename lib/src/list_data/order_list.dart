import 'package:yanapay/src/models/cart_model.dart';
import 'package:yanapay/src/models/order_model.dart';

class OrderList {
  static List<OrderModel> orderList = [
    OrderModel(
      status: OrderStatus.Pagado,
      dateOrder: DateTime.now(),
      total: 590,
      products: [
        CartModel(
          productName: 'Morrissey',
          price: 1180,
          qty: 2,
          productImage:
            'https://firebasestorage.googleapis.com/v0/b/storage-bc221.appspot.com/o/PNG%20Files%2Fimage%2016.png?alt=media&token=ad173705-c97d-48ee-aaec-2699afc274a6',
        ),
      ],
    ),
  ];
}
