// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  const CartaoPadrao({
    Key? key,
    required this.cor,
    this.filho,
    this.aoPressionar,
  }) : super(key: key);

  final Color cor;
  final Widget? filho;
  final GestureTapCallback? aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cor,
        ),
        child: filho,
      ),
    );
  }
}
