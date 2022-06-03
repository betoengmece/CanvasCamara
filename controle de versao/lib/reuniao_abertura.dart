import 'package:canvas_camara/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'funcoes.dart';

class ReuniaoAbertura extends StatefulWidget {
  @override
  _ReuniaoAberturaState createState() => _ReuniaoAberturaState();
}

class _ReuniaoAberturaState extends State<ReuniaoAbertura> {
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
                    "AberturaReuniaoComissao ${FuncoesUteis.data(1)}");
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 413,
                ),
                Container(
                    //color: Colors.blue,
                    child: Text(
                  "${FuncoesUteis.data(0)} - 14h",
                  style: kTextStyleAmarelo.copyWith(
                      color: Colors.white, fontSize: 30),
                ))
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
    return AssetImage("assets/images/AberturaReuniaoSegunda.png");
  } else if (FuncoesUteis.data(2) == "QUARTA-FEIRA") {
    return AssetImage("assets/images/AberturaReuniaoQuarta.png");
  } else if (FuncoesUteis.data(2) == "SEXTA-FEIRA") {
    return AssetImage("assets/images/AberturaReuniaoSexta.png");
  } else {
    print('error no assetImage');
    return AssetImage("assetName");
  }
}
