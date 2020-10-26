import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    this.backgroundColor = Colors.transparent,
    this.textColor = kTextColorBlack,
    @required this.text,
    @required this.press,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, border: Border.all(color: Colors.black12)),
        child: FlatButton(
          color: backgroundColor,
          padding: EdgeInsets.all(20),
          onPressed: press,
          child: Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class UnitButton extends StatelessWidget {
  const UnitButton({
    this.backgroundColor = Colors.transparent,
    this.textColor = kTextColorBlack,
    @required this.text,
    @required this.press,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, border: Border.all(color: Colors.black12)),
        child: FlatButton(
          color: backgroundColor,
          padding: EdgeInsets.all(15),
          onPressed: press,
          child: Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    this.backgroundColor = Colors.transparent,
    this.textColor = kTextColorBlack,
    @required this.text,
    @required this.press,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, border: Border.all(color: Colors.black12)),
        child: FlatButton(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          onPressed: press,
          child: Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    this.backgroundColor = Colors.transparent,
    this.textColor = kTextColorBlack,
    @required this.text,
    @required this.press,
  });

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor, border: Border.all(color: Colors.black12)),
        child: FlatButton(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 10),
          onPressed: press,
          child: Text(
            "$text",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
