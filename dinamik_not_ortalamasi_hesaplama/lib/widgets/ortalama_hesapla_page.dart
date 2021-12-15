// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:dinamik_not_ortalamasi_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/helper/data_helper.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/model/ders.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/widgets/ortalama_g%C3%B6ster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'Ortalama Hesapla',
              style: Sabitler.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla()),
                ),
              ],
            ),
            Expanded(
              child: DersListesi(
                onDismiss: (index) {
                  //callBack Fonksiyonu
                  setState(() {
                    DataHelper.tumEklenenDersler.removeAt(index);
                    print('eleman çıkarıldı');
                  });
                },
              ),
            )
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                      padding: Sabitler.yatayPadding8, child: _buildHarfler()),
                ),
                Expanded(
                  child: Padding(
                      padding: Sabitler.yatayPadding8, child: _buildKrediler()),
                ),
                IconButton(
                  onPressed: _dersEkleveOrtalamHesapla,
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: Sabitler.anaRenk,
                  iconSize: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          girilenDersAdi = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ders adını Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'örn: Matematik',
        border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (value) {
          setState(
            () {
              secilenHarfDegeri = value!;
              print(value);
            },
          );
        },
        underline: Container(),
      ),
    );
  }

  Widget _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        items: DataHelper.tumDerslerinKrediler(),
        onChanged: (value) {
          setState(
            () {
              secilenKrediDegeri = value!;
              print(value);
            },
          );
        },
        underline: Container(),
      ),
    );
  }

  void _dersEkleveOrtalamHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.tumEklenenDersler);
      setState(() {});
    }
  }
}
