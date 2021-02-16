import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final _optiuniDeSelectare = [
    new DropdownMenuItem(
      child: Center(child: Text(TipTranzactie.Vanzare)),
      value: TipTranzactie.Vanzare,
    ),
    new DropdownMenuItem(
      child: Center(child: Text(TipTranzactie.Cumparare)),
      value: TipTranzactie.Cumparare,
    ),
  ];

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class TipTranzactie {
  static const String Cumparare = "Cumpărare";
  static const String Vanzare = "Vânzare";
}

class _TransactionFormState extends State<TransactionForm> {
  var _tipulTranzactieiCurente = TipTranzactie.Cumparare;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Center(
              child: DropdownButton(
                value: _tipulTranzactieiCurente,
                items: widget._optiuniDeSelectare,
                onChanged: laSelectareaTipuluiDeTranzactie,
              ),
            ),
            subtitle: Center(
              child: Text("Selectați tipul tranzacției"),
            ),
          ),
        ],
      ),
    );
  }

  laSelectareaTipuluiDeTranzactie(String tipTranzactieSelectat) {
    setState(() => _tipulTranzactieiCurente = tipTranzactieSelectat);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Ați selectat tipul de tranzactie $tipTranzactieSelectat"),
      duration: Duration(seconds: 1),
    ));
  }
}
