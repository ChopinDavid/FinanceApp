import 'package:FinanceApp/chart_bar.dart';
import 'package:FinanceApp/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ChartWidget({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        Transaction transaction = recentTransactions[i];
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {"day": DateFormat.E().format(weekDay).substring(0, 1), "amount": totalSum};
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, value) {
      return sum += value["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBarWidget(label: data["day"], spending: data["amount"], spendingPercentOfTotal: totalSpending == 0.0 ? 0.0 : (data["amount"] as double) / totalSpending,),
            );
          }).toList(),
        ),
      ),
    );
  }
}