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
    return Center(
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Column(
          children: [
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Selectați tipul tranzacției",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: DropdownButton(
                  value: _tipTranzactie,
                  items: widget._tipuriDeTranzactii,
                  onChanged: (tipTranzactie) => setState(() => _tipTranzactie = tipTranzactie),
                ),
              ),
            ),
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Nume client",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (numeClient) => setState(() => _numeClient = numeClient),
                ),
              ),
            ),
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Prenume client",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (prenumeClient) => setState(() => _prenumeClient = prenumeClient),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Clientul este rezident?",
                  style: TextStyle(fontSize: 20),
                ),
                Checkbox(
                  value: _clientulEsteRezident,
                  onChanged: (value) => setState(
                    () => _clientulEsteRezident = value,
                  ),
                )
              ],
            ),
            Spacer(),
            Visibility(
              visible: !_clientulEsteRezident,
              child: ListTile(
                title: Center(
                    child: Text(
                  "Țara de rezidență a clientului",
                  style: TextStyle(fontSize: 20),
                )),
                subtitle: Center(
                  child: TextField(
                    textAlign: TextAlign.center,
                    onSubmitted: (taraRezidenta) => setState(() => _taraRezidenta = taraRezidenta),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !_clientulEsteRezident,
              child: Spacer(),
            ),
            ListTile(
              title: Center(
                child: Text(
                  "Document Identitate",
                  style: TextStyle(fontSize: 20),
                ), // todo: store fields
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
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Suma Încasată",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onSubmitted: (sumaIncasata) => setState(() => _sumaIncasata = sumaIncasata),
                ),
              ),
            ),
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Cursul de Schimb",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onSubmitted: (cursSchimb) => setState(() => _cursSchimb = cursSchimb),
                ),
              ),
            ),
            Spacer(),
            ListTile(
              title: Center(
                  child: Text(
                "Suma plătită clientului",
                style: TextStyle(fontSize: 20),
              )),
              subtitle: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onSubmitted: (sumaPlatita) => setState(() => _sumaPlatita = sumaPlatita),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
