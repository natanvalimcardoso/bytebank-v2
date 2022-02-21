import 'package:curso_alura_2/screens/transaction_form.dart';
import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactItem extends StatelessWidget {

  final Contact contact;
  ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionForm(contact)));
        },
        child: ListTile(
          title: Text(contact.name,
              style: TextStyle(
                fontSize: 24.0,
              )),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
