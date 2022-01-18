import 'package:flutter/material.dart';
import 'package:user_app/congrats.dart';




void main() {
  runApp(const ShowPoints());
}

class ShowPoints extends StatefulWidget {
  const ShowPoints({Key? key}) : super(key: key);

  @override
  _ShowPointsState createState() => _ShowPointsState();
}

class _ShowPointsState extends State<ShowPoints> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Congrats(),
    );
  }
}
