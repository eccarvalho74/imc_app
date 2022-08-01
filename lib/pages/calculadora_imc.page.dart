import 'package:flutter/material.dart';
import 'package:imc_app/pages/principal_page.dart';

class CalculadoraIMCPage extends StatelessWidget {
  const CalculadoraIMCPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.grey[800],

        // Define the default font family.
        //  fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: const PrincipalPage(),
    );
  }
}
