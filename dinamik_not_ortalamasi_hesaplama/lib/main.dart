// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:dinamik_not_ortalamasi_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dinamik Ortalama Hesaplama',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Sabitler.anaRenk,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: OrtalamaHesaplaPage());
  }
}
