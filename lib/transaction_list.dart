import 'package:FinanceApp/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                child: Text(
                  "\$${transaction.amount}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
                margin: EdgeInsets.all(10),
              ),
              Column(
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('MMM d, yyyy').format(transaction.date),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
