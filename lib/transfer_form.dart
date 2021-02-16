import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Înregistrează un nou transfer"),
      ),
      body: TransferForm(),
    );
  }
}

class TransferForm extends StatefulWidget {
  @override
  _TransferFormState createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("TODO"),
    );
  }
}
