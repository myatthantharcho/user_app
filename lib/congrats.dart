import 'dart:math';
import 'package:flutter/material.dart';
import 'package:user_app/constants.dart';
import 'package:user_app/rive_animation.dart';
import 'package:user_app/strings_and_colors.dart';
import 'package:user_app/reusable_widgets.dart';

class Congrats extends StatefulWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [
            const SizedBox(
              height: 150,
            ),
            Center(
              child: imageAssets(
                awardImage,
                height * 0.09,
                width * 0.7,
              ),
            ),
            const PartyRow(),
            const SizedBox(
              height: 80,
            ),
            const TextNButton()
          ]),
        ),
      ),
    );
  }
}

class TextNButton extends StatelessWidget {
  const TextNButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: 
          buildText(
            'Congratulations',
            textColor,
            28,
            FontWeight.bold,
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(vertical: padding3x,horizontal: padding6x),
          child: buildText(
            'You\'ve gained 5 points.Reach level 50 to be able to report! Keep it up!',
            textColor,
            18,
            FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        const ContinueButton()
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            vertical: padding2x,
            horizontal: padding6x * 2.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          primary: const Color(
            0xff3993dd,
          ), //background
          onPrimary: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RiveWave(),
            ),
          );
        },
        child: buildText(
          textContinue,
          Colors.white,
          18.0,
          FontWeight.w600,
        ));
  }
}

class PartyRow extends StatelessWidget {
  const PartyRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double partyHeight = MediaQuery.of(context).size.height * 0.1;
    double partyWidth = MediaQuery.of(context).size.width * 0.175;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CongratsConfetti(
        direction: 0,
        child: imageAssets(
          partyImage,
          partyHeight,
          partyWidth,
        ),
      ),
      CongratsConfetti(
        direction: pi,
        child: imageAssets(
          partyImage2,
          partyHeight,
          partyWidth,
        ),
      ),
    ]);
  }
}
