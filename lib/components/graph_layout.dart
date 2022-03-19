import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  List<LnmData> _chartData;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
            text: "Daily Sales Analysis",
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        // Initialize category axis
        primaryXAxis: CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            //  labelFormat: '{value}M',
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        series: <LineSeries<LnmData, String>>[
          LineSeries<LnmData, String>(
              //  name: "Sales",
              // Bind data source
              dataSource: _chartData,
              xValueMapper: (LnmData sales, _) => sales.year,
              yValueMapper: (LnmData sales, _) => sales.sales,
              dataLabelSettings: DataLabelSettings(isVisible: true))
        ]);
  }

  List<LnmData> getChartData() {
    final List<LnmData> chartData = [
      LnmData('Mon', 35),
      LnmData('Tue', 28),
      LnmData('Wed', 34),
      LnmData('Thur', 32),
      LnmData('Fri', 40)
    ];
    return chartData;
  }
}

class LnmData {
  LnmData(this.year, this.sales);
  final String year;
  final double sales;
}
