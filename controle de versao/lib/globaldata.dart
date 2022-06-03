import 'dart:html';

class Data {
  Data._privateConstructor();
  static final Data _instance = Data._privateConstructor();

  factory Data() {
    return _instance;
  }
  int dias = 0;
  DateTime dataHoje() {
    return DateTime.now().add(Duration(days: dias));
  }
}
/*
class Data {
  int dias = 0;
  DateTime dataHoje() {
    return DateTime.now().add(Duration(days: dias));
  }
}*/
