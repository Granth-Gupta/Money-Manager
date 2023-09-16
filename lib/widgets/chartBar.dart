import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageOfTotal) {
    // print('Constructor ChartBar');
  }

  @override
  Widget build(BuildContext context) {
    // print('Build() ChartBar');
    return Padding(
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(builder: (ctx, Constraints) {
          return Column(
            children: [
              Container(
                height: Constraints.maxHeight * .15,
                child: FittedBox(
                  child: Text('\u{20B9}${spendingAmount.toStringAsFixed(0)}'),
                ),
              ),
              SizedBox(
                height: Constraints.maxHeight * .05,
              ),
              Container(
                height: Constraints.maxHeight * .60,
                width: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercentageOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: Constraints.maxHeight * .05,
              ),
              Container(
                height: Constraints.maxHeight * .15,
                child: FittedBox(
                  child: Text(label),
                ),
              ),
            ],
          );
        }));
  }
}
