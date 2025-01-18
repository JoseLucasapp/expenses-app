import 'dart:math';

import 'transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
      id: '1',
      title: 'Shirt',
      amount: 110.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Shoes',
      amount: 710.0,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        amount: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionList(_transactions),
      TransactionForm(_addTransaction),
    ]);
  }
}
