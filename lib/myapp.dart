import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        buttonTheme: theme.buttonTheme.copyWith(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.green[900],
          secondary: Colors.green[900],
        ),
      ),
      home: const Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
