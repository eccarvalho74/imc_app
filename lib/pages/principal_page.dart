import 'package:flutter/material.dart';

import 'package:imc_app/constantes.dart';
import 'package:imc_app/enum/sexo_enum.dart';
import 'package:imc_app/pages/resultados_page.dart';
import 'package:imc_app/provider/calculadora_imc.provider.dart';
import 'package:imc_app/widgets/botao_arredondado.dart';
import 'package:imc_app/widgets/botao_inferior.dart';
import 'package:imc_app/widgets/cartao_padrao.widget.dart';
import 'package:imc_app/widgets/conteudo_icone.widget.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  Color corMasculinoCartaoPadrao = corInativaCartaoPadrao;
  Color corFemininoCartaoPadrao = corInativaCartaoPadrao;
  SexoEnum sexoSelecionado = SexoEnum.vazio;
  int altura = 180;
  int peso = 60;
  int idade = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadore IMC"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CartaoPadrao(
                  cor: sexoSelecionado == SexoEnum.masculino
                      ? corMasculinoCartaoPadrao
                      : corBase,
                  filho: const ConteudoIcone(
                    icone: Icons.male,
                    descricao: "Masculino",
                  ),
                  aoPressionar: () {
                    setState(() {
                      sexoSelecionado = SexoEnum.masculino;
                    });
                  },
                ),
              ),
              Expanded(
                child: CartaoPadrao(
                  cor: sexoSelecionado == SexoEnum.feminino
                      ? corFemininoCartaoPadrao
                      : corBase,
                  filho: const ConteudoIcone(
                    icone: Icons.female,
                    descricao: "Feminino",
                  ),
                  aoPressionar: () {
                    setState(() {
                      sexoSelecionado = SexoEnum.feminino;
                    });
                  },
                ),
              ),
            ],
          )),
          Expanded(
            child: CartaoPadrao(
              cor: corBase,
              filho: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Altura",
                    style: textStyleCartao,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        altura.toString(),
                        style: textStyleCartaoBranco,
                      ),
                      const Text(
                        " cm",
                        style: textStyleCartao,
                      ),
                    ],
                  ),
                  Slider(
                      activeColor: corContainerInferior,
                      inactiveColor: corInativaCartaoPadrao,
                      value: altura.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          altura = value.toInt();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    cor: corBase,
                    filho: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "PESO",
                          style: textStyleCartao,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              peso.toString(),
                              style: textStyleCartaoBranco,
                            ),
                            const Text(
                              " Kg",
                              style: textStyleCartao,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BotaoArredondado(
                              aoPressionar: () {
                                setState(() {
                                  peso++;
                                });
                              },
                              icone: Icons.add,
                            ),
                            BotaoArredondado(
                              aoPressionar: () {
                                setState(() {
                                  peso--;
                                });
                              },
                              icone: Icons.remove,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                    cor: corBase,
                    filho: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "IDADE",
                          style: textStyleCartao,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              idade.toString(),
                              style: textStyleCartaoBranco,
                            ),
                            const Text(
                              " anos",
                              style: textStyleCartao,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BotaoArredondado(
                              aoPressionar: () {
                                setState(() {
                                  idade++;
                                });
                              },
                              icone: Icons.add,
                            ),
                            BotaoArredondado(
                              aoPressionar: () {
                                setState(() {
                                  idade--;
                                });
                              },
                              icone: Icons.remove,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          botao_inferior(
            icone: Icons.calculate,
            titulo: "Calcular",
            aoPressionar: () {
              CalculadoraIMCProvider calc =
                  CalculadoraIMCProvider(altura, peso);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultadoPage(
                            resultadoIMC: calc.calcularIMC(),
                            resultadoTexto: calc.obterResultado(),
                            interpretacao: calc.obterInterpretacao(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
