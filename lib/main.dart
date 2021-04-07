import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here
  SyncfusionLicense.registerLicense(null);
  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

late SfCartesianChart chart;
late CrosshairBehavior crosshair;


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
    ChartData(10, 17),
    ChartData(20, 34),
    ChartData(30, 25),
    ChartData(40, 10),
    ChartData(50, 10)
// Add the required data  
];
crosshair = CrosshairBehavior(enable: true);
 chart = SfCartesianChart(

   backgroundColor: Colors.white,
   primaryXAxis: NumericAxis(interval: 10),
    crosshairBehavior: crosshair,
  series: <CartesianSeries>[
    StepLineSeries<ChartData, double>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y),
    ]
);
return Scaffold(
  appBar: AppBar(
    title: Text('Crosshair')
  ),
  body: Container(
    child: Column(
      children: <Widget>[
        FlatButton(
          color: Theme.of(context).primaryColor,
          child: Text('Show'),
          onPressed: show,

        ),
        Center(
          child: Container(height: 500,
          width: 320,
            child: chart),
        )
      ]
    )
  )
);

  }

void show() {
  crosshair.showByIndex(2);
  }

void hide(){
    crosshair.hide();
}

}

class ChartData {
  ChartData(this.x, this.y);

  final double x;
  final double y;
}