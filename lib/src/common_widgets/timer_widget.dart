import 'dart:async';

import 'package:flutter/material.dart';
import 'package:incident_reporting/src/ui_utils/text_styles.dart';

import 'common_rich_text.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  int _start = 60;

  startTimer() {
    const oneSec = Duration(
      seconds: 1,
    );
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void restartTimer() {
    _start = 60;
    startTimer();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return _start != 0
        ? CommonRichText(
            firstText: "Resend OTP in :",
            secondText: _start < 10 ? '00:0$_start' : '00:$_start',
            onPressed: () {},
            firstStyle: TextStyles.timerTextStyles,
          )
        : CommonRichText(
            firstText: "Don't Received?",
            secondText: "Resend",
            onPressed: () {
              restartTimer();
              widget.onTap();
            },
          );
  }
}
