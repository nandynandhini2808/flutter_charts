
import 'package:flutter/material.dart';
import 'package:flutter_charts/screens/chartData/pie_chart_data.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),

      body: PieChartData(),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: null,
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: null,
            icon: pageIndex == 1
                ? const Icon(
              Icons.pie_chart,
              color: Colors.black,
              size: 35,
            )
                : const Icon(
              Icons.pie_chart_outline,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: null,
            icon: pageIndex == 2
                ? const Icon(
              Icons.savings,
              color: Colors.black,
              size: 35,
            )
                : const Icon(
              Icons.savings_outlined,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: null,
            icon: pageIndex == 3
                ? const Icon(
              Icons.person,
              color: Colors.black,
              size: 35,
            )
                : const Icon(
              Icons.person_outline,
              color: Colors.black,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: null,
            icon: pageIndex == 4
                ? const Icon(
              Icons.more,
              color: Colors.black,
              size: 35,
            )
                : const Icon(
              Icons.more_horiz_outlined,
              color: Colors.black,
              size: 35,
            ),

          ),
        ],
      ),
    );
  }
}




