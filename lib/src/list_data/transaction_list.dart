import 'package:yanapay/src/models/transaction_model.dart';

class TransactionList {
  static List<TransactionModel> transactionList = [
    TransactionModel(
      title: 'Transferencia a elvis2e3',
      date: DateTime.now(),
      type: TransactionType.transfer,
    ),
    TransactionModel(
      title: 'Transferencia a martech',
      date: DateTime.now(),
      type: TransactionType.topUp,
    ),
    TransactionModel(
      title: 'Transferencia a YanaPay',
      date: DateTime.now(),
      type: TransactionType.pay,
    ),
  ];
}
