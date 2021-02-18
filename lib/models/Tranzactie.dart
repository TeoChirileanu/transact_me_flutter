class TipTranzactie {
  static const String Cumparare = "Cumpărare";
  static const String Vanzare = "Vânzare";
}

class Tranzactie {
  TipTranzactie _tipTranzactie;
  String _numePrenumeClient;
  bool _clientulEsteRezident;
  num _sumaIncasata;
}
