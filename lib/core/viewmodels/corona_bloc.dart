import 'package:flutter/material.dart';
import 'package:data_covid/core/model/corona_model.dart';
import 'package:data_covid/core/services/corona_services.dart';

class CoronaBloc extends ChangeNotifier {

  List<CoronaModel> listCorona = [];
  bool isLoading = false;

  void initialized() async {
    isLoading = true;
    await fetchDataCorona();
    isLoading = false;
    notifyListeners();
  }

  Future fetchDataCorona() async {
    final result = await CoronaServices.getCorona();
    if (result is List<CoronaModel>) {
      listCorona = result;
    }
    notifyListeners();
  }
}