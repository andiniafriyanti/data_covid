import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:data_covid/core/model/corona_model.dart';

Dio dio = Dio();
String baseUrl = "https://api.kawalcorona.com/";

class CoronaServices {
  static Future getCorona() async {
    try {
      final response = await dio.get(baseUrl);
      log("Response CoronaServices.getCorona => ${jsonEncode(response.data)}");
      if (response.statusCode == 200) {
        return List<CoronaModel>.from(
          response.data.map((e) => CoronaModel.fromJson(e)),
        );
      }
    } catch (e) {
      log("Error CoronaServices.getCorona => $e", error: e);
      throw e;
    }
  }

}