import 'package:flutter/material.dart';
import 'package:data_covid/core/model/corona_model.dart';
import 'package:data_covid/core/services/corona_services.dart';

class CoronaBloc extends ChangeNotifier {

  CoronaModel? coronaModel;
  List<CoronaModel> listCorona = [];
  List<CoronaModel> bckuplistCorona =[];
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
      bckuplistCorona.addAll(listCorona);
    }
    notifyListeners();
  }

  void search(String query) {
    listCorona = bckuplistCorona;
    if (query.isNotEmpty) {
      query = query.toLowerCase();
      listCorona = listCorona
          .where((e) => e.attributes!.countryRegion!.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }
}