import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions) {
    // print('Constructor Chart');
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalAmount = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalAmount += recentTransactions[i].money;
        }
      }

      // print(DateFormat.E().format(weekday));
      // print(totalAmount);

      return {
        'date': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalAmount,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('Build() Chart');
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,

            // By default flex of all rows are same i.e 1
            // flex: 2 means it takes double space
            // Expanded() is fit with tigth
            // So it only take flex value

            child: ChartBar(
              data['date'],
              data['amount'],
              totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending,
            ),
          );
        }).toList(),
      ),
    );
  }
}
