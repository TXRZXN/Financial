import 'package:flutter/material.dart';
import 'package:play/model/model_fund.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/default_button.dart';
import 'package:play/widget/dialog_widget.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FundScreen extends StatefulWidget {
  const FundScreen({super.key});

  @override
  State<FundScreen> createState() => _FundScreenState();
}

class _FundScreenState extends State<FundScreen> {
  ProgressBarHandler? _handler;
  List<FundModel> fundtoCal = [];

  void onPressNewFund() {
    TextEditingController nameControl = TextEditingController();
    TextEditingController percentControl = TextEditingController();
    TextEditingController expectControl = TextEditingController();
    TextEditingController sdControl = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("New Fund"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Name"),
              keyboardType: TextInputType.name,
              controller: nameControl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Percent"),
              keyboardType: TextInputType.number,
              controller: percentControl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Expect Return"),
              keyboardType: TextInputType.number,
              controller: expectControl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "-2SD"),
              keyboardType: TextInputType.number,
              controller: sdControl,
            ),
          ),
          Center(
            child: TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenHeight(kFontLargeSize),
                  ),
                ),
                onPressed: () async {
                  if (checkPercentAndAddToFund() &&
                      double.parse(percentControl.text) <= 100) {
                    fundtoCal.add(FundModel(
                      name: nameControl.text,
                      percent: double.parse(percentControl.text),
                      expectreturn: double.parse(expectControl.text),
                      risksd: double.parse(sdControl.text),
                    ));
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const ErrorDialog(message: "Percent เกิน 100"),
                    );
                    // ignore: use_build_context_synchronously

                  }
                }),
          )
        ],
      ),
    );
    setState(() {});
  }

  bool checkPercentAndAddToFund() {
    if (fundtoCal.isNotEmpty) {
      double sum = 0;
      for (var i = 0; i < fundtoCal.length; i++) {
        sum += fundtoCal[i].percent!;
      }
      if (sum >= 100) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  bool checkPercentOnCalculate() {
    if (fundtoCal.isNotEmpty) {
      double sumPercent = 0;
      for (var i = 0; i < fundtoCal.length; i++) {
        sumPercent += fundtoCal[i].percent!;
      }
      if (sumPercent == 100) {
        return true;
      } else {
        showDialog(
          context: context,
          builder: (context) =>
              const ErrorDialog(message: "Percent ไม่ถึง 100"),
        );
        return false;
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const ErrorDialog(message: "Percent ไม่ถึง 100"),
      );
      return false;
    }
  }

  void onPressCalculate() {
    double maxDrawdown = 0;
    double profit = 0;
    if (checkPercentOnCalculate()) {
      for (var i = 0; i < fundtoCal.length; i++) {
        double riskSd = 0;
        double drawdown = 0;
        double calProfit = 0;
        riskSd = fundtoCal[i].expectreturn! -
            fundtoCal[i].risksd! -
            fundtoCal[i].risksd!;
        drawdown = (riskSd / 100) * fundtoCal[i].percent!;
        calProfit = (fundtoCal[i].percent! / 100) * fundtoCal[i].expectreturn!;
        maxDrawdown += drawdown;
        profit += calProfit;
      }
      showDialog(
        context: context,
        builder: (context) => SuccessDialog(
          message: "MaxDrawdown = $maxDrawdown\n Profit = $profit",
          onPress: () => Navigator.pop(context),
        ),
      );
    }
  }

  void deleteRow(int index) {
    showDialog(
      context: context,
      builder: (context) => ConditionDialog(
        message: "ต้องการจะลบกองทุนนี้ใช่หรือไม่",
        onPressYes: () {
          fundtoCal.removeAt(index);
          setState(() {});
          Navigator.pop(context);
        },
        onPressNo: () => Navigator.pop(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var scaffold = Scaffold(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => onPressNewFund(),
      ),
    );
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DataTable(
              columnSpacing: 30,
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Text("Fund"),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("Percent"),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("Expected Return"),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text("SD"),
                  ),
                ),
              ],
              rows: List.generate(
                  fundtoCal.length,
                  (index) => DataRow(
                        onLongPress: () => deleteRow(index),
                        cells: <DataCell>[
                          DataCell(
                            Center(child: Text(fundtoCal[index].name ?? "")),
                          ),
                          DataCell(
                            Center(
                                child:
                                    Text(fundtoCal[index].percent.toString())),
                          ),
                          DataCell(
                            Center(
                                child: Text(
                                    fundtoCal[index].expectreturn.toString())),
                          ),
                          DataCell(
                            Center(
                                child:
                                    Text(fundtoCal[index].risksd.toString())),
                          ),
                        ],
                      )),
            ),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.5,
              child: DefaultButton(
                text: "Calculate",
                onPress: () => onPressCalculate(),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
