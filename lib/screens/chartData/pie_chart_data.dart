
import 'package:flutter/material.dart';
import 'package:flutter_charts/common/commonText.dart';
import 'package:flutter_charts/controller/pie_chart_controller.dart';
import 'package:flutter_charts/modal/pie_chart_modal.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';
class PieChartData extends StatefulWidget {
  @override
  State<PieChartData> createState() => _PieChartDataState();
}

class _PieChartDataState extends State<PieChartData> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    final postModel = Provider.of<PieChartController>(context, listen: false);
    postModel.getSinglePostData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PieChartController>(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          CommonText.appBarExpense,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [

          PopupMenuButton(
              itemBuilder: (context){
                return const [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(CommonText.pieChart),
                  ),

                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(CommonText.barChart),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(CommonText.donutChart),
                  ),
                ];
              },
              onSelected:(int value){
                postModel.changeChart(value);
              }
          )
        ],
      ),
      body: Column(
        children: [
          charts(),
          Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),child: Container(
              width: 470,
              height:40,
              child:const Center(child:
              Text(CommonText.topSpending,
                style: TextStyle(fontSize: 20,color: Colors.black),)
              ))),
          Expanded(child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: postModel.tempdata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          title: Text(postModel.tempdata[index].categoryName.toString()),
                          subtitle: Text(postModel.tempdata[index].amountSpent.toString()));
                    })
            ),
          ),)
        ],

      ),
    );
  }

  Widget charts(){
   return Selector<PieChartController, Tuple3<List<ResponseData>, bool, int>>(
        selector: (buildContext , counterProvider) =>
            Tuple3(counterProvider.tempdata, counterProvider.loading, counterProvider.chartOption!.toInt()),
        builder: (_, data, __) {
        return Expanded(child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          elevation: 5.0,
          child:data.item3==0? Center(
            child: data.item2
                ? CircularProgressIndicator()
                : Container(
                child: SfCircularChart(
                  series: <CircularSeries>[
                    PieSeries<ResponseData, String>(
                        dataSource: data.item1,
                        xValueMapper: (ResponseData data, _) => data.subCategoryName,
                        yValueMapper: (ResponseData data, _) => data.amountSpent,
                        dataLabelSettings:  DataLabelSettings(isVisible: true)
                    ),
                  ],
                )
            ),
          ):data.item3 ==1? Center(
            child: data.item2
                ? CircularProgressIndicator()
                : Container(
                child: SfCartesianChart(
                    series: <ChartSeries<ResponseData, int>>[
                      ColumnSeries<ResponseData, int>(
                          dataSource: data.item1,
                          xValueMapper: (ResponseData data, _) => data.subCategoryId,
                          yValueMapper: (ResponseData data, _) => data.amountSpent,
                          width: 0.8,
                          spacing: 0.2,
                          dataLabelSettings:  DataLabelSettings(isVisible: true)
                      )
                    ]
                )
            ),
          ): Center(
            child: data.item2
                ? CircularProgressIndicator()
                : Container(
                child: SfCircularChart(
                    series: <CircularSeries>[
                      RadialBarSeries<ResponseData, String>(
                          dataSource: data.item1,
                          xValueMapper: (ResponseData data, _) => data.subCategoryName,
                          yValueMapper: (ResponseData data, _) => data.amountSpent,
                          dataLabelSettings:const DataLabelSettings(
                              isVisible: true
                          )
                      )
                    ]
                )
            ),
          ),
        )
        );
      },
    );
  }
}