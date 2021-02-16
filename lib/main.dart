import 'package:flutter/material.dart';
import 'package:transact_me/transaction_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Transact Me App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transact Me"),
        ),
        body: TransactionForm(),
      ),
    );
  }
}
