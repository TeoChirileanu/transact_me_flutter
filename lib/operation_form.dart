import 'package:flutter/material.dart';

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
  var _operatiuneaCurenta = Operatiuni.Tranzactie;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cel fel de operațiune ați dori să efectuați?"),
          DropdownButton(
            value: _operatiuneaCurenta,
            items: widget._optiuniDeSelectare,
            onChanged: laSelectareaOperatiunii,
          ),
        ],
      ),
    );
  }

  laSelectareaOperatiunii(operatiuneSelectata) {
    setState(() => _operatiuneaCurenta = operatiuneSelectata);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ați selectat operațiunea $operatiuneSelectata"),
      duration: Duration(seconds: 1),
    ));
  }
}
