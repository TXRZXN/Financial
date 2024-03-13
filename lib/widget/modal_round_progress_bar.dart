import 'package:flutter/material.dart';

class ModalRoundedProgressBar extends StatefulWidget {
  final double _opacity;
  final String _textMessage;
  final Function _handlerCallback;

  const ModalRoundedProgressBar({
    Key? key,
    required Function? Function(ProgressBarHandler? handler) handleCallback,
    String message = "",
    double opacity = 0.7,
    Color color = Colors.black54,
  })  : _textMessage = message,
        _opacity = opacity,
        _handlerCallback = handleCallback,
        super(key: key);

  @override
  State createState() => _ModalRoundedProgressBarState();
}

class _ModalRoundedProgressBarState extends State<ModalRoundedProgressBar> {
  bool _isShowing = false;

  @override
  void initState() {
    super.initState();
    ProgressBarHandler handler = ProgressBarHandler();

    handler.show = show;
    handler.dismiss = dismiss;
    widget._handlerCallback(handler);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowing) return Stack();

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: widget._opacity,
            child: const ModalBarrier(
              dismissible: false,
              color: Colors.black54,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                Text(widget._textMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void show() {
    if (!mounted) return;
    setState(() => _isShowing = true);
  }

  void dismiss() {
    if (!mounted) return;
    setState(() => _isShowing = false);
  }
}

class ProgressBarHandler {
  late Function show;
  late Function dismiss;
}
