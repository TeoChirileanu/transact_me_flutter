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
  // todo: move to resources
  static const String Tranzactie = "Tranzacție";
  static const String Transfer = "Transfer";
}

class _OperationFormState extends State<OperationForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Center(
                child: Text("Cel fel de operațiune ați dori să efectuați?"),
              ),
              subtitle: Center(
                child: DropdownButton(
                  value: null,
                  items: widget._optiuniDeSelectare,
                  onChanged: (operatiuneaSelectata) {
                    if (operatiuneaSelectata == Operatiuni.Tranzactie)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransactionScreen(),
                          ));
                    if (operatiuneaSelectata == Operatiuni.Transfer)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferScreen(),
                          ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
