import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/payAndRec/MainPayAndRec.dart';
import 'package:flutter_application_1/page/settings/Settings.dart';
import 'package:unicons/unicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../dimonApp/Style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool checkinternet = false;
  int Valuecash = 0;
  int dahadTap = 0;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  Future Checkinternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return checkinternet = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return checkinternet = false;
    }
  }

  @override
  void initState() {
    data = [
      _ChartData(20, 20000),
      _ChartData(21, 23000),
      _ChartData(22, 22000),
      _ChartData(23, 23000),
      _ChartData(24, 24000),
      _ChartData(25, 23000),
      _ChartData(26, 26000),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 252, 30),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Header(context),
              const SizedBox(
                height: 10,
              ),
              Box(context),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Chart(context),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              MnueCard(context),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.home),
            title: const Text("داشبورد"),
            selectedColor: Colors.blue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.chart_line),
            title: const Text("ڕاپۆرتەکان"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(UniconsLine.users_alt),
            title: const Text("کەسەکان"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("..."),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                UniconsLine.align_center_alt,
                size: 30,
                color: MainColor,
              ),
              Row(children: const [
                Text("Wallet"),
                Text(
                  "Jimer",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              Icon(
                Icons.notifications,
                size: 30,
                color: MainColor,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 0.1))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png",
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  child: const Text(
                    "FarhadAdrbar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget Chart(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  dahadTap = 0;
                });
              },
              child: Text(
                "داهات",
                style: dahadTap == 0 ? BtmChartStyle : BtmChartNoStyle,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  dahadTap = 1;
                });
              },
              child: Text(
                "خەرجی ",
                style: dahadTap == 1 ? BtmChartStyle : BtmChartNoStyle,
              ),
            ),
          ],
        ),
        dahadTap == 0
            ? Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                  child: Stack(
                    children: [
                      SfCartesianChart(
                        margin: EdgeInsets.all(0),
                        borderWidth: 0,
                        borderColor: Colors.transparent,
                        plotAreaBorderWidth: 0,
                        primaryXAxis: NumericAxis(
                            maximum: 20,
                            minimum: 26,
                            isVisible: false,
                            interval: 1),
                        primaryYAxis: NumericAxis(
                          minimum: 20000,
                          maximum: 26000,
                          interval: 1000,
                          borderWidth: 0,
                          borderColor: Colors.transparent,
                          isVisible: false,
                        ),
                        series: <ChartSeries<_ChartData, double>>[
                          AreaSeries<_ChartData, double>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(230, 33, 8, 220),
                                    Color.fromARGB(230, 100, 95, 189),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ],
                      ),
                      Positioned(
                          left: 50,
                          right: 150,
                          top: 160,
                          child: Row(
                            children: [
                              Text(
                                'داهات',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            : Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                  child: Stack(
                    children: [
                      SfCartesianChart(
                        margin: EdgeInsets.all(0),
                        borderWidth: 0,
                        borderColor: Colors.transparent,
                        plotAreaBorderWidth: 0,
                        primaryXAxis: NumericAxis(
                            maximum: 20,
                            minimum: 26,
                            isVisible: false,
                            interval: 1),
                        primaryYAxis: NumericAxis(
                          minimum: 20000,
                          maximum: 26000,
                          interval: 1000,
                          borderWidth: 0,
                          borderColor: Colors.transparent,
                          isVisible: false,
                        ),
                        series: <ChartSeries<_ChartData, double>>[
                          AreaSeries<_ChartData, double>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 169, 34, 34),
                                    Color.fromARGB(230, 169, 65, 92),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)),
                        ],
                      ),
                      Positioned(
                          left: 50,
                          right: 150,
                          top: 160,
                          child: Row(
                            children: [
                              Text(
                                'خەرجی ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
      ],
    );
  }

  Widget Box(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(230, 100, 95, 189),
                ),
                height: 80,
                width: 100,
                child: Center(
                  child: CupertinoPicker(
                    itemExtent: 30,
                    onSelectedItemChanged: (valuecash) {
                      setState(() {
                        Valuecash = valuecash;
                      });
                    },
                    children: [
                      Text(
                        'USD'.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'IQD'.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
            Container(
              child: Icon(
                Icons.arrow_right,
                size: 40,
              ),
            ),
            Container(
              child: Valuecash == 0
                  ? Text(
                      "10000000 USD",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Text("20000000 IQD",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  Widget MnueCard(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    '/PayAndRec',
                  ),
                  child: Container(
                    width: widthandheightCardIcons,
                    height: hidthandheightCardIcons,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusCard,
                      ),
                      color: ColorCard,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            UniconsLine.channel,
                            size: SizeCardIcons,
                            color: ColorCardIcons,
                          ),
                          const Text(
                            "  وەرگرتن/پێدان",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: widthandheightCardIcons,
                  height: hidthandheightCardIcons,
                  child: Card(
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadiusCard),
                    color: ColorCard,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          UniconsLine.money_withdraw,
                          size: SizeCardIcons,
                          color: ColorCardIcons,
                        ),
                        Text(
                          " داهات",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    '/Settings',
                  ),
                  child: Container(
                    width: widthandheightCardIcons,
                    height: hidthandheightCardIcons,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusCard,
                      ),
                      color: ColorCard,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            UniconsLine.setting,
                            size: SizeCardIcons,
                            color: ColorCardIcons,
                          ),
                          Text(
                            " ڕێکخستن",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: widthandheightCardIcons,
                  height: hidthandheightCardIcons,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusCard,
                    ),
                    color: ColorCard,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          UniconsLine.money_insert,
                          size: SizeCardIcons,
                          color: ColorCardIcons,
                        ),
                        Text(
                          " خەرجی",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData([this.x, this.y]);
  double? x;
  double? y;
}
