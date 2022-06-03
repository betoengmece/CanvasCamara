import 'package:canvas_camara/home.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class CaixaTextoReuniao extends StatefulWidget {
  CaixaTextoReuniao({
    Key key,
  }) : super(key: key);

  String nome = "3ª Comissão de Política Urbana e Meio Ambiente";
  String horario = "14h";

  @override
  _CaixaTextoReuniaoState createState() => _CaixaTextoReuniaoState();
}

class _CaixaTextoReuniaoState extends State<CaixaTextoReuniao> {
  /*double scaleText() {
    double escala = 1.2 / Home.listaCaixaTexto.length;
    if (escala > 0.8) {
      escala = 0.7;
    }

    return escala;
  }*/

  double scaleText() {
    double escalaTexto = 1.2;
    switch (Home.listaCaixaTexto.length) {
      case 1:
        escalaTexto = 0.6;
        break;
      case 2:
        escalaTexto = 0.5;
        break;
      case 3:
        escalaTexto = 0.35;
        break;
      case 8:
        escalaTexto = 0.20;
        break;
      default:
        escalaTexto = 1.1 / Home.listaCaixaTexto.length;
    }

    return escalaTexto;
  }

  double tamanhoFonte = 45;
  int escalaContainerTexto() {
    if (widget.nome.length > 120) {
      return 3;
    } else {
      return 2;
    }
  }

  @override
  void initState() {
    Home.streamController.stream.listen((event) {
      print("evento tem o valor de $event");
      tamanhoFonte = event.toDouble();
      // se chamar o stream, atualiza
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: escalaContainerTexto(),
      child: TextButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    content: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 8,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            // initialValue: widget.nome,
                            decoration:
                                InputDecoration(labelText: "Nome da Comissão"),

                            onChanged: (valor) {
                              setState(() {
                                widget.nome = valor;
                              });
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Horário"),
                            onChanged: (valor) {
                              setState(() {
                                widget.horario = valor;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            padding: EdgeInsets.all(1),
            alignment: Alignment.center,
            //width: 500,
            child: Container(
              decoration: kDecorationCampoTexto,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 220.0 * scaleText(),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      // decoration: kDecorationCampoTexto,
                      child: Text(widget.horario,
                          textScaleFactor: scaleText(),
                          style: kTextStyleAmarelo.copyWith(
                              fontSize: tamanhoFonte, color: Colors.black),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: kDecorationCampoTexto,
                      child: Center(
                        child: Text(
                          //modificadorEscala.toString(),
                          widget.nome,
                          textScaleFactor: scaleText(),
                          softWrap: true,
                          style:
                              kStyleMontSerrat.copyWith(fontSize: tamanhoFonte),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
