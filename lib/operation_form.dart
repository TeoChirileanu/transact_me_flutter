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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: ListTile(
            title: Center(
              child: Text("Cel fel de operațiune ați dori să efectuați?"),
            ),
            subtitle: Center(
              child: DropdownButton(
                value: null,
                items: widget._optiuniDeSelectare,
                onChanged: laSelectareaOperatiunii,
              ),
            ),
          ),
        )
      ],
    );
  }

  laSelectareaOperatiunii(operatiuneSelectata) {
    if (operatiuneSelectata == Operatiuni.Tranzactie)
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionScreen(),
          ));
    if (operatiuneSelectata == Operatiuni.Transfer)
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransferScreen(),
          ));
  }
}
