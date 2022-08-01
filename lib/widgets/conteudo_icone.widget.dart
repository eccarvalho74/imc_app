import 'package:flutter/material.dart';

class ConteudoIcone extends StatelessWidget {
  const ConteudoIcone({Key? key, required this.icone, required this.descricao})
      : super(key: key);

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icone,
          size: 80.0,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          descricao,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
