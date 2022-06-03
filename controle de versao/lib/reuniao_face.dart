import 'package:canvas_camara/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'caixaTexto.dart';
import 'funcoes.dart';
import 'home.dart';

class ReuniaoComissao extends StatefulWidget {
  @override
  _ReuniaoComissaoState createState() => _ReuniaoComissaoState();
}

class _ReuniaoComissaoState extends State<ReuniaoComissao> {
  GlobalKey _globalKey = new GlobalKey();

  int personalizadoTamanhoFonte = 40;

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
                FuncoesUteis.capturePng(_globalKey, 1.2,
                    "Arte_Reuniao_Comissao_Face ${FuncoesUteis.data(1)}");
              }),
          SpeedDialChild(
              child: Icon(
                Icons.add,
              ),
              onTap: () {
                setState(() {
                  Home.listaCaixaTexto.add(CaixaTextoReuniao());
                  Home.streamController.add(0);
                });
              }),
          SpeedDialChild(
              child: Icon(
                Icons.remove,
              ),
              onTap: () {
                setState(() {
                  Home.listaCaixaTexto.removeLast();
                  Home.streamController.add(0);
                });
              }),
          SpeedDialChild(
              child: Icon(
                Icons.arrow_back,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          SpeedDialChild(
              child: Icon(
                Icons.add_box,
              ),
              onTap: () {
                setState(() {
                  personalizadoTamanhoFonte += 1;
                  Home.streamController.add(personalizadoTamanhoFonte);
                });
              }),
          SpeedDialChild(
              child: Icon(
                Icons.remove_circle,
              ),
              onTap: () {
                setState(() {
                  personalizadoTamanhoFonte -= 1;
                  Home.streamController.add(personalizadoTamanhoFonte);
                });
              }),
        ],
      ),
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: Container(
            width: 940 / 1.2,
            height: 788 / 1.2,
            decoration:
                BoxDecoration(image: DecorationImage(image: escolheAsset())),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      FuncoesUteis.data(0),
                      style: kTextStyleAmarelo.copyWith(fontSize: 25),
                    ),
                  ),
                  height: 280,
                ),
                Container(
                  height: 250,
                  width: 550,
                  //color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: Home.listaCaixaTexto,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AssetImage escolheAsset() {
  if (FuncoesUteis.data(2) == "SEGUNDA-FEIRA") {
    return AssetImage("assets/images/FaceReuniaoSegunda.png");
  } else if (FuncoesUteis.data(2) == "QUARTA-FEIRA") {
    return AssetImage("assets/images/FaceReuniaoQuarta.png");
  } else if (FuncoesUteis.data(2) == "SEXTA-FEIRA") {
    return AssetImage("assets/images/FaceReuniaoSexta.png");
  } else {
    print('error no assetImage');
    return AssetImage("assetName");
  }
}
