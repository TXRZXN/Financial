import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortTH extends StatefulWidget {
  const PortTH({super.key});

  @override
  State<PortTH> createState() => _PortTHState();
}

class _PortTHState extends State<PortTH> {
  TextEditingController assetsNameControll = TextEditingController();
  TextEditingController entryPriceControll = TextEditingController();
  TextEditingController positionSizeControll = TextEditingController();
  TextEditingController dateControll = TextEditingController();

  void onPressNewAssets() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Add News Asset"),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Date "),
                ),
                TextField(
                  readOnly: true,
                  controller: dateControll,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);

                      setState(() {
                        dateControll.text = formattedDate;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Asset Name"),
                ),
                TextField(controller: assetsNameControll),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Entry Price"),
                ),
                TextField(controller: entryPriceControll),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Postion Size"),
                ),
                TextField(controller: positionSizeControll),
              ],
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
        onPressed: () => onPressNewAssets(),
      ),
    );
    var progressBar = ModalRoundedProgressBar(
      handleCallback: (handler) {
        // _handler = handler;
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
          children: [],
        ),
      ),
    );
  }
}
