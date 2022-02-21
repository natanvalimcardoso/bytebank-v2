import 'package:curso_alura_2/http/webclient.dart';
import 'package:flutter/material.dart';
import 'models/contact.dart';
import 'myapp.dart';
import 'screens/transactions_list.dart';

void main() {
  runApp(MyApp());
  
  save(Transaction(200.0, Contact(0, 'natan', 2000))).then((transaction) => print(transaction));
  

}