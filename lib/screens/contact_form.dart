import 'package:curso_alura_2/database/app_database.dart';
import 'package:curso_alura_2/models/contact.dart';
import 'package:flutter/material.dart';

import '../components/text_field_components.dart';

class ContactForm extends StatefulWidget {
  ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: Material(
        child: Column(
          children: [
            TextFieldComponents(
              controlador: _nameController,
              labelText: 'Full Name',
              keyboardType: TextInputType.text,
            ),
            TextFieldComponents(
              controlador: _accountNumber,
              labelText: 'Account number',
              keyboardType: TextInputType.number,
            ),
            Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text(
                    'Create',
                  ),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber = int.parse(_accountNumber.text);

                    final newContact = Contact(0, name, accountNumber);
                    save(newContact)
                        .then((id) => Navigator.pop(context, newContact));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
