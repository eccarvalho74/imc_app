import 'package:flutter/material.dart';

class BotaoArredondado extends StatelessWidget {
  final VoidCallback aoPressionar;
  final IconData icone;
  const BotaoArredondado({
    Key? key,
    required this.aoPressionar,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF7e7e7e),
      onPressed: aoPressionar,
      child: Icon(
        icone,
        color: Colors.white,
      ),
    );
  }
}
