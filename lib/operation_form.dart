import 'package:flutter/material.dart';
import 'package:transact_me/transaction_form.dart';
import 'package:transact_me/transfer_form.dart';

class OperationForm extends StatefulWidget {
  final _optiuniDeSelectare = [
    new DropdownMenuItem(
      child: Center(child: Text(Operatiuni.Tranzactie)),
      value: Operatiuni.Tranzactie,
    ),
    new DropdownMenuItem(
      child: Center(child: Text(Operatiuni.Transfer)),
      value: Operatiuni.Transfer,
    ),
  ];

  @override
  _OperationFormState createState() => _OperationFormState();
}

class Operatiuni {
  static const String Tranzactie = "Tranzacție";
  static const String Transfer = "Transfer";
}

class _OperationFormState extends State<OperationForm> {
  String _operatiuneaCurenta;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Center(
              child: DropdownButton(
                value: _operatiuneaCurenta,
                items: widget._optiuniDeSelectare,
                onChanged: laSelectareaOperatiunii,
              ),
            ),
            subtitle: Center(
              child: Text("Cel fel de operațiune ați dori să efectuați?"),
            ),
          ),
        ],
      ),
    );
  }

  laSelectareaOperatiunii(operatiuneSelectata) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ați selectat operațiunea $operatiuneSelectata"),
      duration: Duration(seconds: 1),
    ));

    setState(() => _operatiuneaCurenta = operatiuneSelectata);

    if (_operatiuneaCurenta == Operatiuni.Tranzactie)
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionScreen(),
          ));
    if (_operatiuneaCurenta == Operatiuni.Transfer)
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransferScreen(),
          ));
  }
}
