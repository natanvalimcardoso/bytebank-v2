import 'package:curso_alura_2/components/card_components.dart';
import 'package:curso_alura_2/models/contact.dart';
import 'package:curso_alura_2/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  ContactsList({Key? key}) : super(key: key);

  final List<Contact> contactsList = [];

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView(
        children: [
          CardComponents(
            title: 'title',
            subtitle: 'subtitle',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactForm()),
          ).then((newValue) => setState(() {
                //contactsList.add(newValue);

                
              }));
        },
      ),
    );
  }
}
