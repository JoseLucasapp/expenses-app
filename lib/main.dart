import 'package:expenses/components/transaction_list.dart';

import './models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas pessoais'),
        ),
        body: Column(children: [
          Container(
            width: 250,
            height: 50,
            child: Card(
              color: Colors.purple,
              elevation: 5,
              child: Center(
                child: Text(
                  'Gráfico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          TransactionList(_transactions),
          Card(
            elevation: 5,
            child: Column(children: [
              Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título',
                    ),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            print(titleController.text);
                            print(valueController.text);
                          },
                          child: Text('Nova Transação')),
                    ],
                  )
                ],
              )
            ]),
          )
        ]));
  }
}
