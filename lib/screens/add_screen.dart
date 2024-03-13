import 'package:flutter/material.dart';
import 'package:play/model/money_account_model.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:play/widget/transparent_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  ProgressBarHandler? _handler;
  TextEditingController moneyController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  List<String> list = [
    "",
    "1 => เงินสดถอนได้",
    "2 => Investment ไม่ควรถอน",
    "3 => Investment ถอนไม่ได้"
  ];
  String dropdownValue = "";
  MoneyAccount newData = MoneyAccount();

  void onSave() {
    newData.bankName = nameController.text;
    newData.detail = detailController.text;
    newData.icon = "lib/assets/picture/dntknow.png";
    newData.money = double.parse(moneyController.text);
    newData.type = dropdownValue;
    Navigator.pop(context, newData.toString());
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
                alignment: Alignment.center,
                child: Text(
                  "Picture",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Container(
                width: SizeConfig.screenWidth! * 0.4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "lib/assets/picture/dntknow.png",
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: nameController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Money",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                controller: moneyController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Detail",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Colors.white,
                controller: detailController,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Type",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: DropdownButton(
                  iconEnabledColor: Colors.white,
                  underline: Divider(
                    color: Colors.white,
                    height: getProportionateScreenHeight(5),
                  ),
                  value: dropdownValue,
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    dropdownValue = value!;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Center(
                child: TransparentButton(
                    text: "SAVE",
                    press: () {
                      onSave();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
