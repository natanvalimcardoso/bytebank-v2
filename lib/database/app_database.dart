import 'package:sqflite/sqflite.dart';
import '../models/contact.dart'; // Importei as models

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = dbPath + '/bytebank.db';
    return openDatabase(path, version: 1, onCreate: (Database db, int version) {
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER) ',
      );
    });
  });
}

Future<int> save(Contact contact) {  // Função para salvar o contato
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap); //* inserts salvar dados
  });
}

void findAll() {
  createDatabase().then((db) {
    db.rawQuery('SELECT * FROM contacts').then((list) {
      print(list);
    });
  });
}
