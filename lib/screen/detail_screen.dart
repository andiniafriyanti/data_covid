import 'package:flutter/material.dart';
import 'package:data_covid/core/model/corona_model.dart';

class DetailScreen extends StatelessWidget {
  final Attributes dataCorona;

  const DetailScreen({Key? key, required this.dataCorona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${dataCorona.countryRegion}"),
      ),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Active : ${dataCorona.active ?? "0"}"),
            SizedBox(height: 8),
            Text("Confirm : ${dataCorona.confirmed ?? "0"}"),
            SizedBox(height: 8),
            Text("Death : ${dataCorona.deaths ?? "0"}"),
            SizedBox(height: 8),
            Text("Recovered : ${dataCorona.recovered ?? "0"}"),
            SizedBox(height: 8),
            Text("Lat: ${dataCorona.lat}"),
            SizedBox(height: 8),
            Text("Lng: ${dataCorona.long}")
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}