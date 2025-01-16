import './models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
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
          Column(children: [
            ..._transactions.map((tx) => Card(
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tx.amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tx.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(DateFormat('d MMM y').format(tx.date),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 100, 100, 100),
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ]),
                ))
          ]),
          Card(
            elevation: 5,
            child: Column(children: [
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text('Nova Transação')),
                    ],
                  )
                ],
              )
            ]),
          )
        ]));
  }
}
