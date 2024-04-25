import 'package:flutter/material.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:play/widget/transparent_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MoneyManagement extends StatefulWidget {
  const MoneyManagement({super.key});

  @override
  State<MoneyManagement> createState() => _MoneyManagementState();
}

class _MoneyManagementState extends State<MoneyManagement> {
  ProgressBarHandler? _handler;
  TextEditingController entryPriceControll = TextEditingController();
  TextEditingController stoplossPriceControll = TextEditingController();
  TextEditingController lossAmountControll = TextEditingController();
  TextEditingController riskPerTradeControll = TextEditingController();
  TextEditingController portSizeControll = TextEditingController();

  bool percentStoplossMode = false;
  String modeStopLoss = "Price";

  void calculatePositionSize() {
    double entryPrice = double.parse(entryPriceControll.text);
    double stoploss = double.parse(stoplossPriceControll.text);
    double lossamount = double.parse(lossAmountControll.text);
    double risk = double.parse(riskPerTradeControll.text);
    double portSize = double.parse(portSizeControll.text);
    double positionSize = 0;
    double positionPrice = 0;
    double leverageToUse = 0;
    double leveragePrice = 0;
    double leverageLoss = 0;
    
    if (percentStoplossMode) {
      double mul = (100 - stoploss) / 100;
      double stoplossPrice = entryPrice * mul;
      double diff = entryPrice - stoplossPrice;
      positionSize = lossamount / diff;
      positionPrice = positionSize * entryPrice;
      // leverageToUse = risk / mul;
      // leveragePrice = positionPrice / leverageToUse;
    } else {
      double diff = entryPrice - stoploss;
      // double percenSl = (diff / entryPrice) * 100;
      positionSize = lossamount / diff;
      positionPrice = positionSize * entryPrice;
      // leverageToUse = risk / percenSl;
      // leveragePrice = positionPrice / leverageToUse;
    }
    if (positionPrice > portSize) {
      leverageToUse = positionPrice / portSize;
      leveragePrice = positionPrice / leverageToUse.floor();

    } else if (positionPrice < portSize) {
      leverageToUse = portSize / positionPrice;
      leveragePrice = positionPrice * leverageToUse.floor();
    }
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("PositionSized"),
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "position Size : $positionSize",
              style: TextStyle(fontSize: getProportionateScreenHeight(18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "position Price : $positionPrice",
              style: TextStyle(fontSize: getProportionateScreenHeight(18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Leverage : ${leverageToUse.floor()}",
              style: TextStyle(fontSize: getProportionateScreenHeight(18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Leverage Price: ${leveragePrice}",
              style: TextStyle(fontSize: getProportionateScreenHeight(18)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
          return buildbodyMobile(context);
        },
      ),
      resizeToAvoidBottomInset: true,
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
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Position Sizing",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Port Size",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: portSizeControll,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Port Size"),
                onChanged: (value) {
                  double portSize = double.parse(portSizeControll.text);
                  double rpt = double.parse(riskPerTradeControll.text);
                  double lossamout = (rpt / 100) * portSize;
                  lossAmountControll.text = lossamout.toString();
                  setState(() {});
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Risk/Trade",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: riskPerTradeControll,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Risk/Trade"),
                onChanged: (value) {
                  double portSize = double.parse(portSizeControll.text);
                  double rpt = double.parse(riskPerTradeControll.text);
                  double lossamout = (rpt / 100) * portSize;
                  lossAmountControll.text = lossamout.toString();
                  setState(() {});
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Loss Amount",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                enabled: false,
                cursorColor: Colors.white,
                controller: lossAmountControll,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Loss Amount"),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Entry Price",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: entryPriceControll,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintText: "Entry Price"),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Stoploss $modeStopLoss",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: stoplossPriceControll,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Stoploss $modeStopLoss"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.autorenew),
                      color: Colors.white,
                      onPressed: () {
                        percentStoplossMode = !percentStoplossMode;
                        if (percentStoplossMode) {
                          modeStopLoss = "Percent";
                        } else {
                          modeStopLoss = "Price";
                        }

                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              TransparentButton(
                text: "Calculate",
                press: () {
                  calculatePositionSize();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
