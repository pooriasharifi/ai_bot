// ignore_for_file: prefer_const_constructors

import 'package:ai_bot/modules/constans.dart';
import 'package:ai_bot/screen/Models/indicator.dart';
import 'package:ai_bot/screen/controllers/candleController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CandlePage extends GetView {
  const CandlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: _builBody());
  }

  Widget _builBody() {
    CandleController controller = Get.put(CandleController());
    return GetBuilder<CandleController>(builder: ((controller) {
      controller.handlecandle();
      if (controller.loading.value) {
        return Center(
          child: SpinKitFadingCircle(
            color: sec,
          ),
        );
      }
      return Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  Text('macd: '),
                  Checkbox(
                      checkColor: sec,
                      activeColor: wh,
                      hoverColor: sec,
                      focusColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      value: controller.macd.value,
                      onChanged: (data) {
                        controller.macd.value == true
                            ? controller.macd.value = false
                            : controller.macd.value = true;
                        controller.update();
                      })
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text('rsi: '),
                  Checkbox(
                      checkColor: sec,
                      activeColor: wh,
                      hoverColor: sec,
                      focusColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      value: controller.rsi.value,
                      onChanged: (data) {
                        controller.rsi.value == true
                            ? controller.rsi.value = false
                            : controller.rsi.value = true;
                        controller.update();
                      })
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text('ema 20: '),
                  Checkbox(
                      checkColor: sec,
                      activeColor: wh,
                      hoverColor: sec,
                      focusColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      value: controller.ema20.value,
                      onChanged: (data) {
                        controller.ema20.value==true?controller.ema20.value=false:controller.ema20.value=true;
                        controller.comparison();
                      })
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text('ema 50: '),
                  Checkbox(
                      checkColor: sec,
                      activeColor: wh,
                      hoverColor: sec,
                      focusColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      value: controller.ema50.value,
                      onChanged: (data) {
                        controller.ema50.value==true?controller.ema50.value=false:controller.ema50.value=true;
                        controller.comparison();
                      })
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Text('ema 100: '),
                  Checkbox(
                      checkColor: sec,
                      activeColor: wh,
                      hoverColor: sec,
                      focusColor: Colors.white,
                      side: BorderSide(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid),
                      value: controller.ema100.value,
                      onChanged: (data) {
                        controller.ema100.value==true?controller.ema100.value=false:controller.ema100.value=true;
                        controller.comparison();
                      })
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height /1.5,
                  child: InteractiveChart(

                    candles: controller.data.value,
                    style: ChartStyle(
                      volumeColor: grey.withOpacity(0.8),

                    ),

                  ),
                ),
                controller.macd.value == true
                    ? (Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                            child: Container(
                          height: Get.height / 2,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            onLegendItemRender: (args) {
                              if (args.text == 'MACD') {
                                args.color = sec;
                              }
                            },
                            legend: Legend(isVisible: true),
                            primaryXAxis: DateTimeAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              dateFormat: DateFormat.MMM(),
                              interval: 3,
                              minimum: DateTime(2016, 01, 01),
                              maximum: DateTime(2017, 01, 01),
                            ),
                            primaryYAxis: NumericAxis(
                                minimum: 70,
                                maximum: 130,
                                interval: 20,
                                axisLine: AxisLine(width: 0)),
                            axes: <ChartAxis>[
                              NumericAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                  axisLine: AxisLine(width: 0),
                                  opposedPosition: true,
                                  name: 'agybrd',
                                  interval: 2)
                            ],
                            indicators: <
                                TechnicalIndicators<ChartSampleData, DateTime>>[
                              /// MACD indicator mentioned here.
                              MacdIndicator<ChartSampleData, DateTime>(
                                  period: 14,
                                  name: 'MACD',
                                  longPeriod: 5,
                                  shortPeriod: 2,
                                  signalLineWidth: 2,
                                  macdLineColor: sec,
                                  macdType: MacdType.line,
                                  seriesName: 'AAPL',
                                  yAxisName: 'agybrd'),
                            ],
                            trackballBehavior: TrackballBehavior(
                              enable: false,
                              activationMode: ActivationMode.singleTap,
                              tooltipDisplayMode:
                                  TrackballDisplayMode.groupAllPoints,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            title: ChartTitle(
                                text: 'MACD',
                                textStyle: Get.textTheme.headline1!
                                    .copyWith(fontSize: 16)),
                            series: <ChartSeries<ChartSampleData, DateTime>>[
                              CandleSeries<ChartSampleData, DateTime>(
                                  bearColor: Colors.red,
                                  bullColor: Colors.green,
                                  emptyPointSettings: EmptyPointSettings(
                                      mode: EmptyPointMode.zero),
                                  dataSource: chartData,
                                  opacity: 0.7,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x,
                                  lowValueMapper: (ChartSampleData sales, _) =>
                                      sales.low,
                                  highValueMapper: (ChartSampleData sales, _) =>
                                      sales.high,
                                  openValueMapper: (ChartSampleData sales, _) =>
                                      sales.open,
                                  closeValueMapper:
                                      (ChartSampleData sales, _) => sales.close,
                                  name: 'AAPL'),
                            ],
                          ),
                        ))))
                    : Center(),
                controller.rsi.value == true
                    ? (Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                            child: Container(
                          height: Get.height / 2,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            onLegendItemRender: (args) {
                              if (args.text == 'MACD') {
                                args.color = sec;
                              }
                            },
                            legend: Legend(isVisible: true),
                            primaryXAxis: DateTimeAxis(
                              axisLine: AxisLine(color: wh),
                              majorGridLines: MajorGridLines(width: 0),
                              dateFormat: DateFormat.MMM(),
                              interval: 3,
                              minimum: DateTime(2016, 01, 01),
                              maximum: DateTime(2017, 01, 01),
                            ),
                            primaryYAxis: NumericAxis(
                                minimum: 70,
                                maximum: 130,
                                interval: 20,
                                axisLine: AxisLine(width: 0)),
                            axes: <ChartAxis>[
                              NumericAxis(
                                  majorGridLines: MajorGridLines(width: 0),
                                  axisLine: AxisLine(width: 0, color: sec),
                                  opposedPosition: true,
                                  name: 'agybrd',
                                  interval: 2)
                            ],
                            indicators: <
                                TechnicalIndicators<ChartSampleData, DateTime>>[
                              /// MACD indicator mentioned here.
                              RsiIndicator<ChartSampleData, DateTime>(
                                  period: 14,
                                  name: 'RSI',
                                  signalLineWidth: 2,
                                  seriesName: 'AAPL',
                                  yAxisName: 'agybrd'),
                            ],
                            trackballBehavior: TrackballBehavior(
                              enable: false,
                              activationMode: ActivationMode.singleTap,
                              tooltipDisplayMode:
                                  TrackballDisplayMode.groupAllPoints,
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            title: ChartTitle(
                                text: 'RSI',
                                textStyle: Get.textTheme.headline1!
                                    .copyWith(fontSize: 16)),
                            series: <ChartSeries<ChartSampleData, DateTime>>[
                              CandleSeries<ChartSampleData, DateTime>(
                                  bearColor: Colors.red,
                                  bullColor: Colors.green,
                                  emptyPointSettings: EmptyPointSettings(
                                      mode: EmptyPointMode.zero),
                                  dataSource: chartData,
                                  opacity: 0.7,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x,
                                  lowValueMapper: (ChartSampleData sales, _) =>
                                      sales.low,
                                  highValueMapper: (ChartSampleData sales, _) =>
                                      sales.high,
                                  openValueMapper: (ChartSampleData sales, _) =>
                                      sales.open,
                                  closeValueMapper:
                                      (ChartSampleData sales, _) => sales.close,
                                  name: 'AAPL'),
                            ],
                          ),
                        ))))
                    : Center(),
              ],
            ),
          ));
    }));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartSampleData {
  ChartSampleData(
      {required this.x,
      required this.open,
      required this.high,
      required this.close,
      required this.low,
      required this.volume});

  final DateTime x;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
}
