import 'package:flutter/material.dart';
import 'package:play/theme/style.dart';
import 'package:play/utils/size_config.dart';
import 'package:play/widget/dialog_widget.dart';
import 'package:play/widget/modal_round_progress_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TicTacToeGameScreen extends StatefulWidget {
  const TicTacToeGameScreen({super.key});

  @override
  State<TicTacToeGameScreen> createState() => _TicTacToeGameScreenState();
}

class _TicTacToeGameScreenState extends State<TicTacToeGameScreen> {
  List<String> listTicTacToe = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  String firstPlay = "";
  String secondPlay = "";

  bool isOdd = true;

  String checkTicTacToeWinner(List<String> board) {
    // ตรวจสอบแนวนอน
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == board[i + 1] && board[i] == board[i + 2]) {
        return board[i];
      }
    }

    // ตรวจสอบแนวตั้ง
    for (int i = 0; i < 3; i++) {
      if (board[i] == board[i + 3] && board[i] == board[i + 6]) {
        return board[i];
      }
    }

    // ตรวจสอบแนวทแยง
    if (board[0] == board[4] && board[0] == board[8]) {
      return board[0];
    }

    if (board[2] == board[4] && board[2] == board[6]) {
      return board[2];
    }

    // ถ้าไม่มีใครชนะ
    bool isBoardEmpty = false;
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        isBoardEmpty = true;
      }
    }
    if (isBoardEmpty) {
      return "";
    } else {
      return "No Winner";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {choosePlayer()});
  }

  void choosePlayer() {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SimpleDialog(
          backgroundColor: const Color(0xff292929),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: getProportionateScreenHeight(40)),
              Center(
                child: Text(
                  "กรุณาเลือกผู้เล่นที่จะเล่นก่อน",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: kFontMediumSize),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    firstPlay = "X";
                    secondPlay = "O";
                    Navigator.pop(context);
                  },
                  child: Text(
                    "X",
                    style: TextStyle(
                      fontSize: kFontMediumSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    firstPlay = "O";
                    secondPlay = "X";
                    Navigator.pop(context);
                  },
                  child: Text(
                    "O",
                    style: TextStyle(
                      fontSize: kFontMediumSize,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var scaffold = Scaffold(
      // backgroundColor: Colors.white,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.45,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        listTicTacToe[index],
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      )),
                    ),
                    onTap: () async {
                      if (isOdd) {
                        listTicTacToe.removeAt(index);
                        listTicTacToe.insert(index, firstPlay);
                        isOdd = !isOdd;
                        setState(() {});
                      } else {
                        listTicTacToe.removeAt(index);
                        listTicTacToe.insert(index, secondPlay);
                        isOdd = !isOdd;
                        setState(() {});
                      }
                      String winner = checkTicTacToeWinner(listTicTacToe);
                      if (winner != "") {
                        await showDialog(
                          context: context,
                          builder: (context) => SuccessDialog(
                            message: "Winner is $winner",
                            onPress: () => Navigator.pop(context),
                          ),
                        );
                        listTicTacToe = [
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                        ];

                        isOdd = true;
                      }
                      setState(() {});
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
