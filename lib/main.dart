import 'package:flutter/material.dart';

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

class TransactionForm extends StatefulWidget {
  @override
  TransactionFormState createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(validator: validateInput),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hello World!")));
                }
              },
              child: Text('Input'))
        ],
      ),
    );
  }

  String validateInput(String value) => value.isEmpty ? "Value cannot be empty" : null;
}
