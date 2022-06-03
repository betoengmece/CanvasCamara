import 'package:canvas_camara/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'funcoes.dart';
import 'home.dart';

class SessaoAbertura extends StatefulWidget {
  @override
  _SessaoAberturaState createState() => _SessaoAberturaState();
}

class _SessaoAberturaState extends State<SessaoAbertura> {
  GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: SpeedDial(
        label: Center(child: Text("Opções")),
        animatedIcon: AnimatedIcons.menu_close,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.download_rounded,
              ),
              onTap: () {
                FuncoesUteis.capturePng(_globalKey, 2,
                    "Arte_Sessao_Abertura ${FuncoesUteis.dataSessao(1)}");
              }),
          SpeedDialChild(
              child: Icon(
                Icons.arrow_back,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: Container(
            width: 1920 / 2,
            height: 1080 / 2,
            decoration:
                BoxDecoration(image: DecorationImage(image: escolheAsset())),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 8,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Número da Sessão"),
                              onChanged: (valor) {
                                setState(() {
                                  Home.numeroSessao = valor;
                                });
                              },
                            ),
                          ),
                        ));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 125,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${Home.numeroSessao}",
                        style: kStyleSessao.copyWith(fontFamily: "Antonio"),
                      ),
                      Text(
                        "ª",
                        style: kStyleSessao.copyWith(fontFamily: "Antonio"),
                      ),
                      Text(
                        " SESSÃO ORDINÁRIA ",
                        style: kStyleSessao.copyWith(fontFamily: "Antonio"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 62,
                  ),
                  Container(
                      //color: Colors.blue,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${FuncoesUteis.dataSessao(2)}",
                        style: kStyleArimo.copyWith(fontSize: 27),
                      ),
                      Text(
                        " - ${FuncoesUteis.dataSessao(4)} DE ${FuncoesUteis.dataSessao(3)}",
                        style: kStyleArimo.copyWith(fontSize: 27),
                      ),
                      Text(
                        " - 14H",
                        style: kStyleArimo.copyWith(fontSize: 27),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

AssetImage escolheAsset() {
  //TODO ARRUMAR ISSO DEPOIS
  if (FuncoesUteis.dataSessao(2) == "TERÇA-FEIRA") {
    return AssetImage("assets/images/AberturaSessaoTerca.png");
  } else if (FuncoesUteis.dataSessao(2) == "QUINTA-FEIRA") {
    return AssetImage("assets/images/AberturaSessaoQuinta.png");
  } else {
    print('error no assetImage');
    return AssetImage("assets/images/AberturaSessaoTerca.png");
  }
}
