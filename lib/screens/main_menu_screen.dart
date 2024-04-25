import 'dart:io';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:play/model/money_account_model.dart';
import 'package:play/screens/add_screen.dart';
import 'package:play/screens/money_management.dart';
import 'package:play/screens/mutual_fund.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/common.dart';
import 'package:play/utils/lifecycle_watcher_state.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/dialog_widget.dart';
import 'package:play/widget/indicator_widget.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends LifecycleWatcherState<MainMenuScreen> {
  ProgressBarHandler? _handler;
  double totalMoney = 0;
  double cashMoney = 0;
  double invest = 0;
  double reverseInvest = 0;
  double salary = 28590; //รวมค่าครองชีพ
  String lastUpdated = "23/11/2566";
  TextEditingController moneycontroller = TextEditingController();
  TextEditingController salarycontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();
  bool isAuth = false;
  int touchedSectionTwo = -1;
  int touchedSectionOne = -1;

  //*23/11/2566
  // True 10000
  // DIME 10000
  // LHB 10000
  // SCBEZ 12000
  // SCB 10000
  // SCBAM 12000
  // LHF 23833
  // SSO 12833
  // Binanace 311.78 * 33.00 = 10288.74

  //*18/3/2567
  //   Dime : 10000.0
  // LHB : 10000.0
  // SCB : 50000.0
  // SCBEZ : 10000.0
  // True : 10000.0
  // Binance : 14535.18
  // GoldTrueMoney : 100.0
  // JittaMoney : 10000.0
  // JittaThematic : 10000.0
  // SCBAM : 17000.0
  // StockDime : 123.97
  // AIA : 12000.0
  // LHFund : 29803.0
  // SSO : 15533.0

  //7/3/2567
  List<MoneyAccount> fistAccount = [
    MoneyAccount(
      money: 10000,
      bankName: "Dime",
      detail:
          "จ่ายดอกเบี้ยทุกวันที่ 30 มิถุนายน และ 31 ธันวาคม อัตราดอกเบี้ยคือ <10000 = 3% , 10001-1000000 = 1.5%",
      icon: "lib/assets/picture/dime.png",
      type: "1 => เงินสดถอนได้",
    ),
    MoneyAccount(
      money: 10000,
      bankName: "True",
      detail: "อัตราดอกเบี้ย <5000 = 2% , 5001-10000 += 2% ",
      icon: "lib/assets/picture/true.png",
      type: "1 => เงินสดถอนได้",
    ),
    MoneyAccount(
      money: 10000,
      bankName: "LHB",
      detail:
          "จ่ายดอกเบี้ยทุกวันที่ 30 มิถุนายน และ 31 ธันวาคม อัตราดอกเบี้ยคือ <10001 = 6% ",
      icon: "lib/assets/picture/lhb.png",
      type: "1 => เงินสดถอนได้",
    ),
    MoneyAccount(
      money: 10000,
      bankName: "SCB",
      detail: "บัญชีรับเงินเดือน และไว้กระจายเงินในการลงทุน",
      icon: "lib/assets/picture/scb.png",
      type: "1 => เงินสดถอนได้",
    ),
    MoneyAccount(
      money: 12000,
      bankName: "SCBEZ",
      detail: "เงินสำรองฉุกเฉินฝากเพิ่มเดือนละ 1000 ",
      icon: "lib/assets/picture/scb.png",
      type: "1 => เงินสดถอนได้",
    ),
    MoneyAccount(
      money: 12000,
      bankName: "SCBAM",
      detail: "ฝากเพิ่มเดือนละ 1000 (ไม่รวมกำไร/ขาดทุน)",
      icon: "lib/assets/picture/scbam.png",
      type: "2 => Investment ไม่ควรถอน",
    ),
    MoneyAccount(
      money: 10288,
      bankName: "ฺBinance",
      detail: "(ไม่รวมกำไร/ขาดทุน) 311.78 * 33",
      icon: "lib/assets/picture/binance.png",
      type: "2 => Investment ไม่ควรถอน",
    ),
    MoneyAccount(
      money: 12833,
      bankName: "SSO",
      detail: "เพิ่มขึ้นประมาณ 900* ต่อเดือน",
      icon: "lib/assets/picture/sso.png",
      type: "3 => Investment ถอนไม่ได้",
    ),
    MoneyAccount(
      money: 23833,
      bankName: "LHFund",
      detail: "เพิ่มขึ้น 5%(2180*) ของเงินเดือน",
      icon: "lib/assets/picture/lhfund.png",
      type: "3 => Investment ถอนไม่ได้",
    ),
    MoneyAccount(
      money: 100.0,
      bankName: "GoldTrueMoney",
      type: "2 => Investment ไม่ควรถอน",
      icon: "lib/assets/picture/gold.png",
      detail: "Gold TrueMoney",
    ),
    MoneyAccount(
        money: 123.97,
        bankName: "StockDime",
        type: "2 => Investment ไม่ควรถอน",
        icon: "lib/assets/picture/stock.png",
        detail: "Stock Dime,"),
    MoneyAccount(
      money: 0.0,
      bankName: "JittaThematic",
      type: "2 => Investment ไม่ควรถอน",
      icon: "lib/assets/picture/JittaThematic.png",
      detail: "Jitta Thematic",
    )
  ];

  List<MoneyAccount>? moneyAcc;

  //Later
  // MoneyAccount(
  //     money: 100,
  //     bankName: "Gold TrueMoney",
  //     detail: "34482.7586 ราคาเข้า",
  //     icon: "lib/assets/picture/gold.png",
  //     type: "2 => Investment ไม่ควรถอน",
  //   ),
  //   MoneyAccount(
  //     money: 123.97,
  //     bankName: "Stock TrueMoney",
  //     detail: "35.82",
  //     icon: "lib/assets/picture/stock.png",
  //     type: "2 => Investment ไม่ควรถอน",
  //   ),

  // Future<void> getAreaFootball() async {
  //   Map<String, dynamic>? data;
  //   var response = FootballApi().getResourcePreload(query: data);
  //   response.listen(
  //     (event) {
  //       event.when(
  //         loading: () {
  //           _handler?.show();
  //           debugPrint("response: loading...");
  //         },
  //         success: (AreaResponse? data) async {
  //           _handler?.dismiss();
  //           debugPrint("response Success --> ${data!.toJson()}");
  //         },
  //         failure: (NetworkExceptions? error) {
  //           _handler?.dismiss();
  //           debugPrint(
  //               "response: failure -> ${NetworkExceptions.getErrorMessage(error)}");
  //           showDialog(
  //             context: context,
  //             builder: (ctx) => ErrorDialog(
  //               message: error.toString(),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    calTotal();
  }

  @override
  void dispose() {
    moneycontroller.dispose();
    salarycontroller.dispose();
    detailcontroller.dispose();
    super.dispose();
  }

  void calTotal() async {
    await checkBiometrics();
    await getValueFromPref();
    totalMoney = 0;
    cashMoney = 0;
    if (moneyAcc != null) {
      for (var element in moneyAcc!) {
        totalMoney += element.money ?? 0;
        if (element.type?.startsWith("1") ?? false) {
          cashMoney += element.money!;
        }
        if (element.type?.startsWith("2") ?? false) {
          invest += element.money!;
        }
        if (element.type?.startsWith("3") ?? false) {
          reverseInvest += element.money!;
        }
      }
    }
    setState(() {});
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      debugPrint(e.message);
    }
    if (!mounted) return;
    if (canCheckBiometrics) {
      authenticateWithBiometrics();
    }
  }

  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerdebugPrint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.message);
      setState(() {});
      return;
    }
    if (!mounted) return;
    isAuth = authenticated;
    setState(() {});

    if (!authenticated) {
      debugPrint("exit"); // exit(0);
    }
  }

  Future<void> getValueFromPref() async {
    double? newSalary;
    String? list;
    String? updated;
    final pref = await SharedPreferences.getInstance();
    list = pref.getString("List");
    newSalary = pref.getDouble("Salary");
    updated = pref.getString("Updated");
    if (newSalary != null) {
      salary = newSalary;
      setState(() {});
    }

    if (list != null) {
      moneyAcc = parseMoneyAccountsFromString(list);
    } else {
      moneyAcc = fistAccount;
    }

    if (updated != null) {
      lastUpdated = updated;
    }

    setState(() {});
  }

  void updatedManualMonthly() async {
    for (var element in moneyAcc!) {
      if (element.bankName == "SCB") {
        element.money = element.money! - 3000; //invest
        //element.money = element.money! - 1000; //insurance
        //element.money = element.money! + 1500; //saraly
      } else if (element.bankName == "SCBAM") {
        element.money = element.money! + 1000;
      } else if (element.bankName == "JittaThematic") {
        element.money = element.money! + 1000;
      } else if (element.bankName == "JittaMoney") {
        element.money = element.money! + 1000;
      } else if (element.bankName == "SSO") {
        element.money = element.money! + 600;
      } else if (element.bankName == "LHFund") {
        element.money = element.money! + (salary * 0.08);
      }
    }
    //Bank
    // moneyAcc![3].money = (moneyAcc![3].money! - 4000);
    // moneyAcc![5].money = (moneyAcc![5].money! + 1000);
    //SSO-LHFund
    // moneyAcc![7].money = (moneyAcc![7].money! + 900);
    // moneyAcc![8].money = (moneyAcc![8].money! + 1990);

    DateTime now = DateTime.now();
    lastUpdated = "${now.day}/${now.month}/${now.year}";

    totalMoney = 0;
    cashMoney = 0;
    if (moneyAcc != null) {
      for (var element in moneyAcc!) {
        totalMoney += element.money ?? 0;
        if (element.type?.startsWith("1") ?? false) {
          cashMoney += element.money!;
        }
      }
    }
    safeToPref();
    getValueFromPref();
    setState(() {});
  }

  void updatedDialog(double price, int index) {
    moneycontroller.text = price.toString();
    detailcontroller.text = moneyAcc![index].detail ?? "";
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text("Edit ${moneyAcc![index].bankName}"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Money"),
              controller: moneycontroller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Detail"),
              controller: detailcontroller,
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
                onPressed: () {
                  DateTime now = DateTime.now();
                  lastUpdated = "${now.day}/${now.month}/${now.year}";
                  moneyAcc![index].money = double.parse(moneycontroller.text);
                  moneyAcc![index].detail = detailcontroller.text;
                  Navigator.pop(context);
                  safeToPref();
                  getValueFromPref();
                  setState(() {});
                }),
          )
        ],
      ),
    );
  }

  void updatedNewSalary(double salary) {
    salarycontroller.text = salary.toString();
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Enter New Salary"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: salarycontroller,
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
                  salary = double.parse(salarycontroller.text);
                  final pref = await SharedPreferences.getInstance();
                  pref.setDouble("Salary", salary);
                  setState(() {});
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                }),
          )
        ],
      ),
    );
  }

  void safeToPref() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    pref.setDouble("Salary", salary);
    pref.setString("List", moneyAcc.toString());
    pref.setString("Updated", lastUpdated);
    showDialog(
      context: context,
      builder: (context) => SuccessDialog(
          message: "Save Success",
          onPress: () {
            Navigator.pop(context);
          }),
    );
  }

  void addNewlist() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddListScreen(),
      ),
    );
    await getValueFromPref();
    sortList();
    setState(() {});
  }

  void deleteList(int index) async {
    String? list;
    final pref = await SharedPreferences.getInstance();
    list = pref.getString("List");
    if (list != null) {
      moneyAcc = parseMoneyAccountsFromString(list);
    } else {
      moneyAcc = fistAccount;
    }
    await showDialog(
      context: context,
      builder: (context) => ConditionDialog(
        message: "ต้องการจะลบบัญชี : ${moneyAcc![index].bankName} ใช่หรือไม่",
        onPressYes: () {
          moneyAcc!.removeAt(index);
          Navigator.pop(context);
          totalMoney = 0;
          cashMoney = 0;
          if (moneyAcc != null) {
            for (var element in moneyAcc!) {
              totalMoney += element.money ?? 0;
              if (element.type?.startsWith("1") ?? false) {
                cashMoney += element.money!;
              }
            }
          }
          safeToPref();
        },
        onPressNo: () {
          Navigator.pop(context);
        },
      ),
    );
    setState(() {});
  }

  void updateDetailByCode() async {
    String? list;
    final pref = await SharedPreferences.getInstance();
    list = pref.getString("List");
    if (list != null) {
      moneyAcc = parseMoneyAccountsFromString(list);
    }
    DateTime now = DateTime.now();
    lastUpdated = "${now.day}/${now.month}/${now.year}";
    // for (var element in moneyAcc!) {
    //   debugPrint(element.bankName);
    // }
    // moneyAcc![13].icon = "lib/assets/picture/AIA.png";
    // debugPrint(moneyAcc![6]);
    safeToPref();
    await getValueFromPref();
  }

  void sortList() async {
    String? list;
    List<MoneyAccount> one = [];
    List<MoneyAccount> two = [];
    List<MoneyAccount> three = [];

    final pref = await SharedPreferences.getInstance();
    list = pref.getString("List");
    if (list != null) {
      moneyAcc = parseMoneyAccountsFromString(list);
    }
    moneyAcc!.sort(
      (a, b) => a.type!.compareTo(b.type!),
    );
    for (var element in moneyAcc!) {
      debugPrint(element.bankName);
      if (element.type!.startsWith("1")) {
        one.add(element);
      } else if (element.type!.startsWith("2")) {
        two.add(element);
      } else if (element.type!.startsWith("3")) {
        three.add(element);
      }
    }
    one.sort((a, b) => a.bankName!.compareTo(b.bankName!));
    two.sort((a, b) => a.bankName!.compareTo(b.bankName!));
    three.sort((a, b) => a.bankName!.compareTo(b.bankName!));
    moneyAcc!.clear();
    moneyAcc!.addAll(one);
    moneyAcc!.addAll(two);
    moneyAcc!.addAll(three);
    debugPrint("------------------------------");
    for (var element in moneyAcc!) {
      debugPrint("${element.bankName} : ${element.money}");
    }

    safeToPref();
    await getValueFromPref();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var scaffold = DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  showDefaultDialog(context, showAppBarMenu(context));
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.donut_small_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isDesktop) {
                return Container(
                  color: Colors.blue,
                );
              } else if (sizingInformation.isTablet) {
                return Container(color: Colors.yellow);
              }
              return isAuth
                  ? TabBarView(
                      children: [
                        buildbodyMobileDetail(context),
                        buildbodyMobileChart(context),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
            },
          ),
          resizeToAvoidBottomInset: true,
          // bottomNavigationBar: Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getProportionateScreenHeight(10),
          //   ),
          //   child: TransparentButton(
          //     text: "Updated 1 Month",
          //     press: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) => ConditionDialog(
          //             message: "ต้องการ Updated ใช่หรือไม่",
          //             onPressYes: () {
          //               updatedManual();
          //               Navigator.pop(context);
          //             },
          //             onPressNo: () {
          //               Navigator.pop(context);
          //             }),
          //       );
          //     },
          //   ),
          // ),
        ));
    var progressBar = ModalRoundedProgressBar(
      handleCallback: (handler) {
        _handler = handler;
        return null;
      },
    );
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => ConditionDialog(
            message: "ต้องการปิดแอปใช่หรือไม่",
            onPressYes: () {
              exit(0);
            },
            onPressNo: () {
              Navigator.pop(context);
            },
          ),
        );
        return false;
      },
      child: Stack(
        children: [scaffold, progressBar],
      ),
    );
  }

  Widget buildbodyMobileDetail(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15),
        ),
        child: Column(
          children: [
            Text(
              "Salary is : $salary",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Last Updated Is : $lastUpdated",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Cash : $cashMoney THB",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              "Total : $totalMoney THB",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: moneyAcc?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(10),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        if (moneyAcc![index].type!.startsWith("1") ||
                            moneyAcc![index].type!.startsWith("2")) {
                          updatedDialog(moneyAcc![index].money!, index);
                        }
                      },
                      onLongPress: () {
                        deleteList(index);
                        setState(() {});
                      },
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              moneyAcc![index].icon ??
                                  "lib/assets/picture/error.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(moneyAcc![index].money.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SuccessDialog(
                                message: moneyAcc![index].detail!,
                                onPress: () => Navigator.pop(context),
                              ),
                            );
                          },
                          icon: const Icon(Icons.error_outline)),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildbodyMobileChart(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
          vertical: getProportionateScreenHeight(5),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            touchedSectionOne = -1;
                            return;
                          }
                          touchedSectionOne = pieTouchResponse
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
                    text: 'Reserves Money',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  const Indicator(
                    color: Colors.red,
                    text: 'Investment',
                  ),
                ],
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
                            touchedSectionTwo = -1;
                            return;
                          }
                          touchedSectionTwo = pieTouchResponse
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
                    text: 'Reverse Money',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  const Indicator(
                    color: Colors.yellow,
                    text: 'Investment',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  const Indicator(
                    color: Colors.red,
                    text: 'Reserves Investment',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAppBarMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildMenu(
          context: context,
          title: "Updated 1 Month",
          onPress: () {
            showDialog(
              context: context,
              builder: (context) => ConditionDialog(
                  message: "ต้องการ Updated ใช่หรือไม่",
                  onPressYes: () {
                    Navigator.pop(context);
                    updatedManualMonthly();
                    Navigator.pop(context);
                  },
                  onPressNo: () {
                    Navigator.pop(context);
                  }),
            );
          },
        ),
        buildMenu(
          context: context,
          title: "Updated Salary",
          onPress: () {
            updatedNewSalary(salary);
          },
        ),
        buildMenu(
          context: context,
          title: "Add List",
          onPress: () {
            addNewlist();
          },
        ),
        buildMenu(
          context: context,
          title: "Save To Pref",
          onPress: () {
            safeToPref();
          },
        ),
        buildMenu(
          context: context,
          title: "Calculate Profit Funds",
          onPress: () => changeScreen(context, const FundScreen()),
        ),
        buildMenu(
          context: context,
          title: "Calculate PositionSize",
          onPress: () => changeScreen(context, const MoneyManagement()),
        ),
        // buildMenu(
        //   context: context,
        //   title: "Up",
        //   onPress: () {
        //     updateDetailByCode();
        //   },
        // ),
      ],
    );
  }

  Widget buildMenu(
      {required BuildContext context,
      required String title,
      required Function onPress}) {
    return Column(
      children: [
        InkWell(
          onTap: () => onPress(),
          child: SizedBox(
            height: SizeConfig.screenHeight! * 0.06,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontSize: kFontRegularSize),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
      ],
    );
  }

  List<PieChartSectionData> showSectionsOne() {
    return List.generate(2, (i) {
      final isTouched = i == touchedSectionOne;
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
            value: cashMoney / totalMoney * 100,
            title:
                '${double.parse((cashMoney / totalMoney * 100).toString()).toStringAsFixed(2)}%',
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
            value: 100 - (cashMoney / totalMoney * 100),
            title:
                '${double.parse((100 - (cashMoney / totalMoney * 100)).toString()).toStringAsFixed(2)}%',
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
      final isTouched = i == touchedSectionTwo;
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
            value: cashMoney / totalMoney * 100,
            title:
                '${double.parse((cashMoney / totalMoney * 100).toString()).toStringAsFixed(2)}%',
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
            value: (reverseInvest / totalMoney * 100),
            title:
                '${double.parse((reverseInvest / totalMoney * 100).toString()).toStringAsFixed(2)}%',
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
            color: Colors.yellow,
            value: invest / totalMoney * 100,
            title:
                '${double.parse((invest / totalMoney * 100).toString()).toStringAsFixed(2)}%',
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

  @override
  void onDetached() {
    debugPrint("onDetached");
  }

  @override
  void onInactive() {
    isAuth = false;
    setState(() {});
    debugPrint("onInactive");
  }

  @override
  void onPaused() {
    debugPrint("onPaused");
  }

  @override
  void onResumed() async {
    await checkBiometrics();
    debugPrint("onResumed");
  }
}
