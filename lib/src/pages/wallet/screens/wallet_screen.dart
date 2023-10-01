part of '../wallet_page.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back<dynamic>(),
          icon: const Icon(
            FeatherIcons.arrowLeft,
          ),
          color: Colors.white,
        ),
        title: AutoSizeText(
          'Billetera',
          style: theme.textTheme.headlineSmall!.copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          _HeaderSection(),
          const SizedBox(height: Const.space25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: AutoSizeText(
              'Transacciones recientes',
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: Const.space8),
          ListView.builder(
            itemCount: TransactionList.transactionList.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final transaction = TransactionList.transactionList[index];
              return TransactionCard(transaction: transaction);
            },
          )
        ],
      ),
    );
  }
}
