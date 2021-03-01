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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
              children: [
                TableRow(
                  children: [
                    ListTile(
                      title: Center(child: Text("Tipul tranzacției", style: TextStyle(fontSize: 20))),
                      subtitle: Center(
                        child: DropdownButton(
                          value: _tipTranzactie,
                          items: widget._tipuriDeTranzactii,
                          onChanged: (tipTranzactie) => setState(() => _tipTranzactie = tipTranzactie),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Center(child: Text("Nume și prenume client", style: TextStyle(fontSize: 20))),
                      subtitle: Center(
                        child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(hintText: "e.g. Popescu Andrei"),
                            onChanged: (numeClient) => setState(() => _numeClient = numeClient)),
                      ),
                    ),
                    CheckboxListTile(
                      title: Center(child: Text("Rezident?", style: TextStyle(fontSize: 20))),
                      subtitle: Visibility(
                        visible: !_clientulEsteRezident,
                        child: ListTile(
                          title: Center(
                              child: Text(
                            "Țara de rezidență",
                            style: TextStyle(fontSize: 20),
                          )),
                          subtitle: Center(
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(hintText: "e.g. Austria"),
                              onSubmitted: (taraRezidenta) => setState(() => _taraRezidenta = taraRezidenta),
                            ),
                          ),
                        ),
                      ),
                      value: _clientulEsteRezident,
                      onChanged: (value) => setState(() => _clientulEsteRezident = value),
                    ),
                    ListTile(
                      title: Center(child: Text("Document Identitate", style: TextStyle(fontSize: 20))),
                      subtitle: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: TextField(textAlign: TextAlign.center, decoration: InputDecoration(hintText: "Tip")),
                          ),
                          Spacer(),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child:
                                TextField(textAlign: TextAlign.center, decoration: InputDecoration(hintText: "Serie")),
                          ),
                          Spacer(),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child:
                                TextField(textAlign: TextAlign.center, decoration: InputDecoration(hintText: "Număr")),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(children: [
                  ListTile(
                    title: Center(child: Text("Suma Încasată", style: TextStyle(fontSize: 20))),
                    subtitle: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "e.g. 123,46"),
                        onSubmitted: (sumaIncasata) => setState(() => _sumaIncasata = sumaIncasata),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text("Moneda", style: TextStyle(fontSize: 20))),
                    subtitle: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "e.g. \$"),
                        onSubmitted: (sumaIncasata) => setState(() => _sumaIncasata = sumaIncasata),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text("Cursul de Schimb", style: TextStyle(fontSize: 20))),
                    subtitle: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "e.g. 4,25"),
                        onSubmitted: (cursSchimb) => setState(() => _cursSchimb = cursSchimb),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text("Suma de plată clientului", style: TextStyle(fontSize: 20))),
                    subtitle: Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(hintText: "e.g. 567,78"),
                        onSubmitted: (sumaPlatita) => setState(() => _sumaPlatita = sumaPlatita),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
