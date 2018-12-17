import 'dart:math' as math;
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  int daysLeft;
  int hoursLeft;
  int minsLeft;
  int secsLeft;
  CountdownTimer({this.daysLeft, this.hoursLeft, this.minsLeft, this.secsLeft});
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  AnimationController animationController;

  int myTime = 1542886874957;

  String get timerString {
    Duration duration =
        animationController.duration * animationController.value;
    return '${duration.inHours}:${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
            //days: widget.daysLeft,
            hours: widget.hoursLeft,
            minutes: widget.minsLeft,
            seconds: widget.secsLeft));

//
    animationController.reverse(
        from:
            animationController.value == 0.0 ? 1.0 : animationController.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (animationController != null || animationController.isAnimating) {
      animationController.stop();
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 150.0,
      padding: EdgeInsets.all(20.0),
      child: new Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (BuildContext context, Widget child) {
                    return CustomPaint(
                      //size: Size.fromWidth(10.0),
                      painter: TimerPainter(
                          animation: animationController,
                          backgroundColor: Colors.white,
                          color: Theme.of(context).primaryColor),
                    );
                  },
                ),
              ),
              Align(
                alignment: FractionalOffset.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Time left",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      AnimatedBuilder(
                          animation: animationController,
                          builder: (_, Widget child) {
                            return Text(
                              timerString,
                              style: TextStyle(fontSize: 18.0),
                            );
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
