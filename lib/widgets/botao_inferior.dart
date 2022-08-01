// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:imc_app/constantes.dart';

class botao_inferior extends StatelessWidget {
  final GestureTapCallback? aoPressionar;
  final String titulo;
  final IconData icone;
  const botao_inferior({
    Key? key,
    this.aoPressionar,
    required this.titulo,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        color: corContainerInferior,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              color: Colors.white,
              size: 48.0,
            ),
            Text(
              titulo,
              style: textStyleCartaoBranco,
            ),
          ],
        ),
      ),
    );
  }
}
