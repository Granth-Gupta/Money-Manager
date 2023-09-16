import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import '../models/transaction.dart';
import './transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction) {
    // print('Constructor TransactionList');
  }

  @override
  Widget build(BuildContext context) {
    // print('Build() TransactionList');
    return Container(
        // height: 500,
        height: MediaQuery.of(context).size.height * 0.6,
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, Constraints) {
                  return Column(
                    children: [
                      Text(
                        'No transactions added yet!',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: Constraints.maxHeight * .6,
                        child: Image.asset(
                          'assets/image/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              )
            // : ListView.builder(
            //     // ListView(children: []) is column with SingleChildScrollView
            //     // But it loads all list, hence reduce performance for large list
            //     itemBuilder: (context, index) {
            //       return TransactionItem(
            //           transaction: transactions[index],
            //           deleteTransaction: deleteTransaction);
            //     },
            //     itemCount: transactions.length,
            //   ),
            : ListView(
                children: transactions
                    .map((tx) => TransactionItem(
                          // key: UniqueKey(),
                          key: ValueKey(tx.id),
                          transaction: tx,
                          deleteTransaction: deleteTransaction,
                        ))
                    .toList(),
              ));
  }
}
