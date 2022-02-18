import 'contact.dart';

class Transaction {
  final double value;
  final Contact contact; //* Juntou  a 2 models

  Transaction(
    this.value,
    this.contact,
  );

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

}