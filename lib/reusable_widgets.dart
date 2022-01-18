import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

Text buildText(
    String text, Color textColor, double textFontSize, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      color: textColor,
      fontSize: textFontSize,
      fontWeight: fontWeight,
    ),
  );
}

class CongratsConfetti extends StatefulWidget {
  final Widget child;
  final double direction;
  const CongratsConfetti(
      {required this.child, required this.direction, Key? key})
      : super(key: key);

  @override
  _CongratsConfettiState createState() => _CongratsConfettiState();
}

class _CongratsConfettiState extends State<CongratsConfetti> {
  late ConfettiController controller;
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(
      duration: const Duration(
        seconds: 5,
      ),
    );
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: controller,
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Colors.blue,
              Colors.red,
              Colors.orange,
              Colors.purple,
            ],
            numberOfParticles: 15,
            blastDirection: widget.direction,
            blastDirectionality: BlastDirectionality.explosive,
            gravity: 0,
            // shouldLoop: true,
          ),
        ),
      ],
    );
  }
}

Image imageAssets(String imageName, double imageHeight, double imageWidth) {
  return Image.asset(
    imageName,
    height: imageHeight,
    width: imageWidth,
  );
}


