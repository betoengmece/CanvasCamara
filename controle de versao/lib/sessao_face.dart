import 'package:canvas_camara/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'funcoes.dart';
import 'home.dart';

class SessaoFace extends StatefulWidget {
  @override
  _SessaoFaceState createState() => _SessaoFaceState();
}

class _SessaoFaceState extends State<SessaoFace> {
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
                FuncoesUteis.capturePng(_globalKey, 1.3,
                    "Arte_Sessão_Facebook ${FuncoesUteis.data(1)}");
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
            width: 940 / 1.3,
            height: 788 / 1.3,
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
                    height: 145,
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
                    height: 20,
                  ),
                  Text(
                    "${FuncoesUteis.dataSessao(2)}",
                    style: kStyleEvolve.copyWith(fontSize: 17),
                  ),
                  Text(
                    "${FuncoesUteis.dataSessao(4)} DE ${FuncoesUteis.dataSessao(3)}",
                    style: kStyleEvolve.copyWith(
                        fontSize: 35, letterSpacing: 4.0, wordSpacing: 6.0),
                  ),
                  Text(
                    "14 HORAS",
                    style: kStyleEvolve.copyWith(fontSize: 17),
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
    return AssetImage("assets/images/FaceSessaoTerca.png");
  } else if (FuncoesUteis.dataSessao(2) == "QUINTA-FEIRA") {
    return AssetImage("assets/images/FaceSessaoQuinta.png");
  } else {
    print('error no assetImage');
    return AssetImage("assets/images/FaceSessaoTerca.png");
  }
}
