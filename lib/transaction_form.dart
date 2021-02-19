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
  final _tipuriDeTranzactii = [
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
  var _tipTranzactie = TipTranzactie.Cumparare;
  var _numeClient = "";
  var _prenumeClient = "";
  var _clientulEsteRezident = true;
  dynamic _taraRezidenta;
  dynamic _sumaIncasata;
  dynamic _cursSchimb;
  dynamic _sumaPlatita;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Selectați tipul tranzacției")),
            subtitle: Center(
              child: DropdownButton(
                value: _tipTranzactie,
                items: widget._tipuriDeTranzactii,
                onChanged: (tipTranzactie) => setState(() => _tipTranzactie = tipTranzactie),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Nume client")),
            subtitle: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (numeClient) => setState(() => _numeClient = numeClient),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Prenume client")),
            subtitle: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (prenumeClient) => setState(() => _prenumeClient = prenumeClient),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          child: CheckboxListTile(
            title: Center(child: Text("Clientul este rezident?")),
            value: _clientulEsteRezident,
            onChanged: (clientulEsteRezident) => setState(() => _clientulEsteRezident = clientulEsteRezident),
          ),
        ),
        Spacer(),
        Card(
          child: Visibility(
            visible: !_clientulEsteRezident,
            child: ListTile(
              title: Center(child: Text("Țara de rezidență a clientului")),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onSubmitted: (taraRezidenta) => setState(() => _taraRezidenta = taraRezidenta),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_clientulEsteRezident,
          child: Spacer(),
        ),
        Card(
          child: ListTile(
            title: Center(
              child: Text("Document Identitate"), // todo: store fields
            ),
            subtitle: Row(
              children: [
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Tip"),
                  ),
                ),
                Spacer(),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Serie"),
                  ),
                ),
                Spacer(),
                Flexible(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Număr"),
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Suma Încasată")),
            subtitle: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onSubmitted: (sumaIncasata) => setState(() => _sumaIncasata = sumaIncasata),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Cursul de Schimb")),
            subtitle: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onSubmitted: (cursSchimb) => setState(() => _cursSchimb = cursSchimb),
              ),
            ),
          ),
        ),
        Spacer(),
        Card(
          child: ListTile(
            title: Center(child: Text("Suma plătită clientului")),
            subtitle: Center(
              child: TextField(
                textAlign: TextAlign.center,
                onSubmitted: (sumaPlatita) => setState(() => _sumaPlatita = sumaPlatita),
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
