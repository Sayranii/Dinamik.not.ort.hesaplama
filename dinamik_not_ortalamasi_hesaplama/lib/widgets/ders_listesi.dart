// ignore_for_file: prefer_const_constructors

import 'package:dinamik_not_ortalamasi_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/helper/data_helper.dart';
import 'package:dinamik_not_ortalamasi_hesaplama/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;

  const DersListesi({Key? key, required this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text('${tumDersler[index].krediDegeri} Kredi,' +
                          ' Not Değeri ${tumDersler[index].harfDegeri}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_forever),
                        onPressed: () {
                          onDismiss(index);
                        },
                      )),
                ),
              );
            },
          )
        : Center(
            child: Text(
              'Lütfen Ders Giriniz',
              style: Sabitler.baslikStyle,
            ),
          );
  }
}
