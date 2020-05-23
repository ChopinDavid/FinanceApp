import 'package:FinanceApp/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "No transactions added yet!",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  Transaction transaction = transactions[index];
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "\$${transaction.amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                          margin: EdgeInsets.all(10),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              transaction.title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat('MMM d, yyyy')
                                  .format(transaction.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
