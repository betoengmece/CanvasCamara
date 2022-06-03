import 'package:flutter/material.dart';

const kDecorationCampoTexto = BoxDecoration(
    color: Colors.white60,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(8.0)));

const kTextStyleAmarelo =
    TextStyle(fontFamily: 'RacingSansOne', color: Colors.yellow);

const kStyleMontSerrat = TextStyle(
  fontFamily: 'montserrat',
  fontWeight: FontWeight.w700,
  fontSize: 15,
  color: Colors.black,
);
const kStyleEvolve = TextStyle(
  fontFamily: 'EvolveSans',
  fontWeight: FontWeight.w700,
  fontSize: 15,
  letterSpacing: 3.0,
  color: Colors.white,
);

const kStyleArimo = TextStyle(
  fontFamily: 'Arimo',
  fontWeight: FontWeight.w700,
  fontSize: 15,
  letterSpacing: 3.0,
  color: Colors.white,
);

TextStyle kStyleSessao = TextStyle(
  color: Colors.white,
  fontSize: 100,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w700,
  shadows: <Shadow>[
    Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.5)),
    Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 8.0,
        color: Colors.black.withOpacity(0.5)),
  ],
);
