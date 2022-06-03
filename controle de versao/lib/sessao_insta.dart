import 'package:canvas_camara/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'funcoes.dart';
import 'home.dart';

class SessaoInsta extends StatefulWidget {
  @override
  _SessaoInstaState createState() => _SessaoInstaState();
}

class _SessaoInstaState extends State<SessaoInsta> {
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
                FuncoesUteis.capturePng(_globalKey, 3.5,
                    "Arte_Sessão_Instagram ${FuncoesUteis.data(1)}");
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
            alignment: Alignment.center,
            width: 2160 / 3.5,
            height: 2160 / 3.5,
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
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${Home.numeroSessao}",
                        style: kStyleEvolve.copyWith(fontSize: 27),
                      ),
                      Text(
                        "ª",
                        style: TextStyle(color: Colors.white, fontSize: 27),
                      ),
                      Text(
                        " SESSÃO ORDINÁRIA",
                        style: kStyleEvolve.copyWith(fontSize: 27),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "${FuncoesUteis.dataSessao(2)}",
                    style: kStyleArimo.copyWith(fontSize: 17),
                  ),
                  Text(
                    "${FuncoesUteis.dataSessao(4)} DE ${FuncoesUteis.dataSessao(3)}",
                    style: kStyleArimo.copyWith(
                        fontSize: 35, letterSpacing: 4.0, wordSpacing: 6.0),
                  ),
                  Text(
                    "14 HORAS",
                    style: kStyleArimo.copyWith(fontSize: 17),
                  )
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
    return AssetImage("assets/images/InstaSessaoTerca.png");
  } else if (FuncoesUteis.dataSessao(2) == "QUINTA-FEIRA") {
    return AssetImage("assets/images/InstaSessaoQuinta.png");
  } else {
    print('error no assetImage');
    return AssetImage("assets/images/InstaSessaoTerca.png");
  }
}
