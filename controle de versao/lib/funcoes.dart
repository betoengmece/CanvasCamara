import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'globaldata.dart';

class FuncoesUteis {
  static void download(
    List<int> bytes, {
    String downloadName,
  }) {
    // Encode our file in base64
    final _base64 = base64Encode(bytes);
    // Create the link with the file
    final anchor =
        AnchorElement(href: 'data:application/octet-stream;base64,$_base64')
          ..target = 'blank';
    // add the name
    if (downloadName != null) {
      anchor.download = downloadName;
    }
    // trigger download
    document.body.append(anchor);
    anchor.click();
    anchor.remove();
    return;
  }

  static Future<Uint8List> capturePng(
      // ignore: non_constant_identifier_names
      GlobalKey globalKey,
      double pixelRatio,
      String nome_salvo) async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      //var bs64 = base64Encode(pngBytes);
      //  print(pngBytes);
      // print(bs64);

      download(pngBytes, downloadName: "$nome_salvo.png");
      return pngBytes;
    } catch (e) {
      print("ERRO");
    }
  }

  static String data(int opcao) {
    final dataHoje = Data().dataHoje();
    var diaSemana = dataHoje.weekday;
    var diaNumero = dataHoje.day;
    var mes = Data().dataHoje().month;
    String tempDia = '';
    var fatorDiaReuniao;
    switch (diaSemana) {
      case 0:
        tempDia = "SEGUNDA-FEIRA"; //DOMINGO
        fatorDiaReuniao = 1;
        break;
      case 1:
        tempDia = "SEGUNDA-FEIRA";
        fatorDiaReuniao = 0;
        break;
      case 2:
        tempDia = "QUARTA-FEIRA";
        fatorDiaReuniao = 1;
        break;
      case 3:
        tempDia = "QUARTA-FEIRA"; //QUARTA
        fatorDiaReuniao = 0;
        break;
      case 4:
        tempDia = "SEXTA-FEIRA";
        fatorDiaReuniao = 1;
        break;
      case 5:
        tempDia = "SEGUNDA-FEIRA";
        fatorDiaReuniao = 3;
        break;
      case 6:
        tempDia = "SEGUNDA-FEIRA"; //SABADO
        fatorDiaReuniao = 2;
        break;
    }
    diaNumero = Data().dataHoje().add(new Duration(days: fatorDiaReuniao)).day;
    mes = Data().dataHoje().add(new Duration(days: fatorDiaReuniao)).month;
    if (opcao == 0) {
      return "$tempDia - $diaNumero/$mes";
    } else if (opcao == 1) {
      return "$diaNumero-$mes";
    } else if (opcao == 2) {
      return tempDia;
    }
  }

  static String dataSessao(int opcao) {
    final dataHoje = Data().dataHoje();
    var diaSemana = dataHoje.weekday;
    var diaNumero = dataHoje.day;
    var mes = dataHoje.month;
    String mes_escrito;
    var fatordiaSessao;
    String tempDia = '';
    switch (diaSemana) {
      case 0:
        tempDia = "TERÇA-FEIRA"; //DOMINGO
        fatordiaSessao = 2;
        break;
      case 1:
        tempDia = "TERÇA-FEIRA";
        fatordiaSessao = 1;
        break;
      case 2:
        tempDia = "TERÇA-FEIRA";
        fatordiaSessao = 0;
        break;
      case 3:
        tempDia = "QUINTA-FEIRA"; //QUARTA
        fatordiaSessao = 1;
        break;
      case 4:
        tempDia = "QUINTA-FEIRA";
        fatordiaSessao = 0;
        break;
      case 5:
        tempDia = "TERÇA-FEIRA";
        fatordiaSessao = 4;
        break;
      case 6:
        tempDia = "TERÇA-FEIRA"; //SABADO
        fatordiaSessao = 3;
        break;
    }
    mes = dataHoje.add(new Duration(days: fatordiaSessao)).month;

    switch (mes) {
      case 1:
        mes_escrito = 'JANEIRO';
        break;
      case 2:
        mes_escrito = 'FEVEREIRO';
        break;
      case 3:
        mes_escrito = 'MARÇO';
        break;
      case 4:
        mes_escrito = 'ABRIL';
        break;
      case 5:
        mes_escrito = 'MAIO';
        break;
      case 6:
        mes_escrito = 'JUNHO';
        break;
      case 7:
        mes_escrito = 'JULHO';
        break;
      case 8:
        mes_escrito = 'AGOSTO';
        break;
      case 9:
        mes_escrito = 'SETEMBRO';
        break;
      case 10:
        mes_escrito = 'OUTUBRO';
        break;
      case 11:
        mes_escrito = 'NOVEMBRO';
        break;
      case 12:
        mes_escrito = 'DEZEMBRO';
        break;
      default:
    }
    diaNumero = dataHoje.add(new Duration(days: fatordiaSessao)).day;
    //mes = DateTime.now().add(new Duration(days: fatordiaSessao)).month;

    if (opcao == 0) {
      return "$tempDia - $diaNumero/$mes";
    } else if (opcao == 1) {
      return "$diaNumero/$mes";
    } else if (opcao == 2) {
      return tempDia;
    } else if (opcao == 3) {
      return mes_escrito;
    } else if (opcao == 4) {
      return "${dataHoje.add(new Duration(days: fatordiaSessao)).day}";
    }
  }
}
