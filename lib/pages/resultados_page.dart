import 'package:flutter/material.dart';
import 'package:imc_app/constantes.dart';
import 'package:imc_app/widgets/botao_inferior.dart';
import 'package:imc_app/widgets/cartao_padrao.widget.dart';

class ResultadoPage extends StatelessWidget {
  const ResultadoPage(
      {Key? key,
      required this.resultadoIMC,
      required this.resultadoTexto,
      required this.interpretacao})
      : super(key: key);

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Resultado",
                style: textStyleCartaoBranco,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CartaoPadrao(
              cor: corBase,
              filho: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultadoTexto,
                    style: textStyleResultado,
                  ),
                  Text(
                    resultadoIMC,
                    style: textStyleResultadoValor,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      interpretacao,
                      textAlign: TextAlign.center,
                      style: textStyleCartao,
                    ),
                  ),
                ],
              ),
            ),
          ),
          botao_inferior(
            icone: Icons.arrow_back_ios,
            titulo: "Recalcular",
            aoPressionar: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
