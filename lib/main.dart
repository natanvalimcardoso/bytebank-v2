import 'package:curso_alura_2/database/app_database.dart';
import 'package:curso_alura_2/models/contact.dart';
import 'package:flutter/material.dart';

import 'myapp.dart';

void main() {
  runApp(MyApp());

  save(Contact(0, 'Natan', 2000));
  save(Contact(0, 'Deu', 2000));
}
 
/* findAll().then((contacts) {

    }); */