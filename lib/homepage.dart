import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import'package:flutteranimatedchartsapp/main.dart';


class HomePage extends StatefulWidget {


  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<DataPoint, int>> _seriesLineData;








generateData(){
  final ScreenArguments args = ModalRoute.of(context).settings.arguments;


  _seriesLineData.add(
    charts.Series(
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
      id: 'COVID',
      data: args.timeline,

      domainFn: (DataPoint dp, _) => dp.date,
      measureFn: (DataPoint dp, _) => dp.num,
    ),
  );
  _seriesLineData.add(
    charts.Series(
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
      id: 'COVID',
      data: args.timeline1,
      domainFn: (DataPoint dp, _) => dp.date,
      measureFn: (DataPoint dp, _) => dp.num,
    ),
  );
  _seriesLineData.add(
    charts.Series(
      colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      id: 'ACOVID',
      data: args.timeline2,

      domainFn: (DataPoint dp, _) => dp.date,
      measureFn: (DataPoint dp, _) => dp.num,
    ),
  );
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _seriesLineData = List<charts.Series<DataPoint, int>>();
    generateData();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1976d2),
          //backgroundColor: Color(0xff308e1c),

          title: Text('Flutter Charts'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Sales for the first 5 years',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                  Expanded(
                    child: charts.LineChart(
                        _seriesLineData,
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Years',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Sales',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Departments',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );


  }
}

