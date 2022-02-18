import 'package:curso_alura_2/http/webclient.dart';
import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(MyApp());
  findAll().then((transactions) => print('new transactions: $transactions'));
}
