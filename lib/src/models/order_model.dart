import 'package:yanapay/src/models/cart_model.dart';

enum OrderStatus {Pagado, Anulado, Pausa, Finalizado }

class OrderModel {
  final List<CartModel>? products;
  final int? total;
  final OrderStatus? status;
  final DateTime? dateOrder;

  OrderModel({this.products, this.total, this.status, this.dateOrder});
}
