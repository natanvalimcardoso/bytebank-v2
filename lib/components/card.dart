import 'package:flutter/material.dart';

class CardComponents extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardComponents({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
