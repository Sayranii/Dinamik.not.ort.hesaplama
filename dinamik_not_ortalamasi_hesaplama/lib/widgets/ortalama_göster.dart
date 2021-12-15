// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dinamik_not_ortalamasi_hesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster(
      {Key? key, required this.dersSayisi, required this.ortalama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seciniz',
          style: Sabitler.OrtalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? '${ortalama.toStringAsFixed(2)}' : '0.0',
          style: Sabitler.OrtalamaStyle,
        ),
        Text(
          'Ortalama',
          style: Sabitler.OrtalamaGosterBodyStyle,
        ),
      ],
    );
  }
}
