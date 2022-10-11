import 'package:flutter/material.dart';
import 'package:flutter_charts/controller/pie_chart_controller.dart';
import 'package:flutter_charts/screens/chart_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>PieChartController(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Animated Charts App',
          theme: ThemeData(
            primaryColor: Color(0xffff6101),
          ),
          home: ChartScreen()
        ));
  }
}