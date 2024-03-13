import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widget/indicator_widget.dart';

class PurposeScreen extends StatefulWidget {
  const PurposeScreen({super.key});

  @override
  State<PurposeScreen> createState() => _PurposeScreenState();
}

class _PurposeScreenState extends State<PurposeScreen> {
  ProgressBarHandler? _handler;
  int onTouchedRetriementPort = -1;
  int onTouchedPassivePort = -1;
  int onTouchScbPort = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var scaffold = DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isDesktop) {
                return Container(
                  color: Colors.blue,
                );
              } else if (sizingInformation.isTablet) {
                return Container(color: Colors.yellow);
              }
              return buildbodyMobile(context);
            },
          ),
          resizeToAvoidBottomInset: true,
        ));
    var progressBar = ModalRoundedProgressBar(
      handleCallback: (handler) {
        _handler = handler;
        return null;
      },
    );
    return Stack(
      children: [scaffold, progressBar],
    );
  }

  Widget buildbodyMobile(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Retirement Port",
                  style: TextStyle(fontSize: kFontUltraLargeSize),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.3,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            onTouchedRetriementPort = -1;
                            return;
                          }
                          onTouchedRetriementPort = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 5,
                    centerSpaceRadius: 30,
                    sections: showSectionsOne(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Indicator(
                    color: Colors.green,
                    text: 'Core Port',
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBS&P500E 20%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBNDQE 20%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBCHAE 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBCEE 10%"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  const Indicator(
                    color: Colors.red,
                    text: 'Satellite Port',
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBPINE 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBSET50E 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBGOLDE 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBVIETE 10%"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Passive Port",
                  style: TextStyle(fontSize: kFontUltraLargeSize),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.3,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            onTouchedPassivePort = -1;
                            return;
                          }
                          onTouchedPassivePort = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 5,
                    centerSpaceRadius: 30,
                    sections: showSectionsTwo(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Indicator(
                    color: Colors.green,
                    text: 'Deverloped Market',
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBWORLD 20%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBDJI 20%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBEUEQ 20%"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  const Indicator(
                    color: Colors.red,
                    text: 'Emerging Market',
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBBLOC 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBSEMI 10%"),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBIHEALT 10%"),
                        ],
                      ),
                    ],
                  ),
                  const Indicator(
                    color: Colors.blue,
                    text: 'Bond Market',
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(25),
                          ),
                          const Text("SCBFST/SCBUSHYA 10%"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "มูลค่าพอร์ต",
                        style: TextStyle(fontSize: kFontRegularSize),
                      ),
                      Text(
                        "กำไร/ขาดทุน*",
                        style: TextStyle(fontSize: kFontRegularSize),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "15000.00",
                        style: TextStyle(fontSize: kFontMediumSize),
                      ),
                      Text(
                        "+238.90",
                        style: TextStyle(
                            fontSize: kFontMediumSize, color: Colors.green),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "",
                        style: TextStyle(fontSize: kFontMediumSize),
                      ),
                      Text(
                        "(+1.64%)",
                        style: TextStyle(
                            fontSize: kFontRegularSize, color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.4,
                    height: SizeConfig.screenHeight! * 0.3,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                onTouchScbPort = -1;
                                return;
                              }
                              onTouchScbPort = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 25,
                        sections: showSectionsSCB(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.51,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                  ),
                                ),
                                Text(
                                  "ตราสารทุนไทย",
                                  style: TextStyle(fontSize: kFontNormalSize),
                                ),
                              ],
                            ),
                            Text(
                              "9.86%",
                              style: TextStyle(fontSize: kFontSmallSize),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "ตราสารทุนต่างประเทศ",
                                  style: TextStyle(fontSize: kFontNormalSize),
                                ),
                              ],
                            ),
                            Text(
                              "69.94%",
                              style: TextStyle(fontSize: kFontSmallSize),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.purple,
                                  ),
                                ),
                                Text(
                                  "กองทุนทางเลือก",
                                  style: TextStyle(fontSize: kFontNormalSize),
                                ),
                              ],
                            ),
                            Text(
                              "20.43%",
                              style: TextStyle(fontSize: kFontSmallSize),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showSectionsOne() {
    return List.generate(2, (i) {
      final isTouched = i == onTouchedRetriementPort;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [
        Shadow(
          color: Colors.white,
          blurRadius: 2,
        ),
      ];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: 60,
            title: 'Core Port',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: 40,
            title: 'Satellite Port',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showSectionsTwo() {
    return List.generate(3, (i) {
      final isTouched = i == onTouchedPassivePort;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [
        Shadow(
          color: Colors.white,
          blurRadius: 2,
        ),
      ];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: 60,
            title: 'Deverloped Market',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: 'Emerging Market',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blue,
            value: 10,
            title: 'Bond Market',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }

  List<PieChartSectionData> showSectionsSCB() {
    return List.generate(3, (i) {
      final isTouched = i == onTouchScbPort;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [
        Shadow(
          color: Colors.white,
          blurRadius: 2,
        ),
      ];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.grey,
            value: 69.94,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.amber,
            value: 9.63,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 20.43,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
