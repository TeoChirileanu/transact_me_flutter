import 'package:flutter/material.dart';
import 'package:transact_me/models/Tranzactie.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Înregistrează o nouă tranzacție"),
      ),
      body: TransactionForm(),
    );
  }
}

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

class _TransactionFormState extends State<TransactionForm> {
  var _tipulTranzactieiCurente = TipTranzactie.Cumparare;
  var _numeClient = "";
  var _prenumeClient = "";
  var _clientulEsteRezident = false;
  var _sumaIncasata = 0.0;

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
            subtitle: Center(child: Text("Selectați tipul tranzacției")),
          ),
          ListTile(
            subtitle: Center(child: Text("Nume client")),
            title: Center(
              child: TextField(
                onChanged: (numeClient) => setState(() => _numeClient = numeClient),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            subtitle: Center(child: Text("Prenume client")),
            title: Center(
              child: TextField(
                onChanged: (prenumeClient) => setState(() => _prenumeClient = prenumeClient),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SwitchListTile(
            title: Center(child: Text("Clientul este rezident?")),
            value: _clientulEsteRezident,
            onChanged: (clientulEsteRezident) => setState(() => _clientulEsteRezident = clientulEsteRezident),
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
