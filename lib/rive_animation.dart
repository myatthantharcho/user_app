import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/strings_and_colors.dart';
import 'package:user_app/reusable_widgets.dart';

class RiveWave extends StatefulWidget {
  const RiveWave({Key? key}) : super(key: key);

  @override
  _RiveWaveState createState() => _RiveWaveState();
}

class _RiveWaveState extends State<RiveWave> {
  late double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      // ignore: unnecessary_const
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: buildText(
                'You are doing great today!',
                textColor,
                22.0,
                FontWeight.bold,
              ),
            ),
            //Animation
            StackAnimation(width: width, height: height),
            Center(
              child: buildText(
                'user1369',
                textColor,
                22.0,
                FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 81.0,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Column(children: [
              const PointsAmount(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: padding2x,
                  horizontal: padding5x,
                ),
                child: LinearProgressIndicator(),
              ),
              const ShowTargetLvl(),
            ])
          ]),
        ),
      ),
    );
  }
}

class ShowTargetLvl extends StatelessWidget {
  const ShowTargetLvl({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: padding4x,
            top: padding,
          ),
          child: buildText(
            'Lvl 2',
            textColor,
            18.0,
            FontWeight.bold,
          ),
        ),
        buildText(
            '15 points to go', textColor, 16.0, FontWeight.bold),
        Padding(
          padding:
              const EdgeInsets.only(right: padding4x, top: padding),
          child: buildText(
            'Lvl 3',
            textColor,
            18.0,
            FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PointsAmount extends StatelessWidget {
  const PointsAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 41,
        ),
        buildText(
          totalText,
          textColor,
          20.0,
          FontWeight.bold,
        ),
        const SizedBox(
          width: 12,
        ),
        buildText(
          '5',
          textColor,
          22.0,
          FontWeight.bold,
        ),
        const SizedBox(
          width: 10,
        ),
        buildText(
          pointsText,
          textColor,
          20.0,
          FontWeight.w700,
        ),
      ],
    );
  }
}

class StackAnimation extends StatelessWidget {
  const StackAnimation({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Container(
          width: width,
          height: height * 0.38,
          child: const RiveAnimation.asset(
            'images/wave5.riv',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: height * 0.18,
          left: width * 0.435,
          child: const Text(
            levelText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        Positioned(
          top: height * 0.23,
          left: width * 0.49,
          child: buildText(
            '2',
            Colors.white,
            28.0,
            FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class LinearProgressIndicator extends StatefulWidget {
  const LinearProgressIndicator({Key? key}) : super(key: key);

  @override
  _LinearProgressIndicatorState createState() =>
      _LinearProgressIndicatorState();
}

class _LinearProgressIndicatorState extends State<LinearProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width * 0.8,
      // ignore: prefer_const_constructors
      progressColor: const Color(
        0xff3993dd,
      ),

      percent: 0.4,
      lineHeight: 5.0,
      backgroundColor: const Color(0xffDBDBDB).withOpacity(0.5),
      linearStrokeCap: LinearStrokeCap.roundAll,
    );
  }
}
