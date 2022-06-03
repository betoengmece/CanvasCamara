import 'dart:async';
import 'package:canvas_camara/globaldata.dart';
import 'package:canvas_camara/reuniao_face.dart';
import 'package:canvas_camara/reuniao_insta.dart';
import 'package:canvas_camara/sessao_abertura.dart';
import 'package:canvas_camara/sessao_face.dart';
import 'package:canvas_camara/sessao_insta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'caixaTexto.dart';
import 'reuniao_abertura.dart';

abstract class Bloc {
  void
      dispose(); //classe criado para colocar o dispose, mas n tem nada a ver ...
}

class Home extends StatefulWidget {
  static final StreamController<int> streamController =
      StreamController.broadcast();

  static List<CaixaTextoReuniao> listaCaixaTexto = [
    CaixaTextoReuniao(),
    CaixaTextoReuniao(),
    CaixaTextoReuniao(),
    CaixaTextoReuniao(),
    CaixaTextoReuniao(),
  ];

  static String numeroSessao;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    Home.streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        label: Center(
            child:
                Center(child: Text("Dia ${Data().dataHoje().day.toString()}"))),
        animatedIcon: AnimatedIcons.menu_close,
        closeManually: true,
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.add,
              ),
              onTap: () {
                Data().dias += 1;
                setState(() {});
              }),
          SpeedDialChild(
              child: Icon(
                Icons.remove,
              ),
              onTap: () {
                Data().dias -= 1;
                setState(() {});
              }),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Artes Reunioes",
                  style: TextStyle(fontSize: 30),
                ),
                NavegadorPaginas(
                  pagina: ReuniaoComissao(),
                  texto: "Arte Face",
                ),
                NavegadorPaginas(
                  pagina: ReuniaoComissaoInsta(),
                  texto: "Arte Insta",
                ),
                NavegadorPaginas(
                  pagina: ReuniaoAbertura(),
                  texto: "Abertura Reuniao",
                ),
              ],
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              children: [
                Text(
                  "Artes Sessões",
                  style: TextStyle(fontSize: 30),
                ),
                NavegadorPaginas(
                  pagina: SessaoFace(),
                  texto: "Sessão Face",
                ),
                NavegadorPaginas(
                  pagina: SessaoInsta(),
                  texto: "Sessão Insta",
                ),
                NavegadorPaginas(
                  pagina: SessaoAbertura(),
                  texto: "Sessão Abertura",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NavegadorPaginas extends StatelessWidget {
  final Widget pagina;
  final String texto;
  NavegadorPaginas({
    @required this.pagina,
    @required this.texto,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 2.2,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pagina));
            },
            child: Text(texto)),
      ),
    );
  }
}
