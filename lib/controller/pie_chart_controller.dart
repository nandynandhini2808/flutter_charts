import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_charts/modal/pie_chart_modal.dart';
import 'package:flutter_charts/network/network_helper.dart';

class PieChartController extends ChangeNotifier {
  List<PieChartModalClass> pieChartValue = [];
  bool loading = true;
  List<ResponseData> tempdata = [];
  NetworkHelper _networkHelper = NetworkHelper();
  int? chartOption = 0;

  Future<PieChartModalClass?> getSinglePostData() async {
    PieChartModalClass? result;
    notifyListeners();
    try {
      final response = await _networkHelper.get("PASTE YOUR URL HERE");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = PieChartModalClass.fromJson(item);
        notifyListeners();
        pieChartValue.add(result);
        loading = false;
        for (int i = 0; i < pieChartValue.length; i++) {
          tempdata = pieChartValue[i].responseData!;
        }
      } else {
        print("error");
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
    return result;
  }

  changeChart(int chartValue) {
    if (chartValue == 0) {
      chartOption = chartValue;
    } else if (chartValue == 1) {
      chartOption = chartValue;
    } else if (chartValue == 2) {
      chartOption = chartValue;
    }
    notifyListeners();
  }
}
