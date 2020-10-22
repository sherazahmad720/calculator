import 'package:calculator/calFun.dart';
import 'package:calculator/constant.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cm Inch Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Calculator(),
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({
    Key key,
  }) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  displayInputs == null ? "" : "$displayInputs",
                  style: typeTextStyle,
                ),
                Align(
                  child: Text(
                    result == null
                        ? lengthResult == ""
                            ? ""
                            : "$lengthResult m"
                        : "$result",
                    style: kResultTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        //length functionality button
        Row(
          children: <Widget>[
            ConverterButton(
              text: "yard",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("yard");
                  },
                );
              },
            ),
            ConverterButton(
              text: "feet",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("feet");
                  },
                );
              },
            ),
            ConverterButton(
              text: "inch",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("inch");
                  },
                );
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            ConverterButton(
              text: "Convert",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.3),
              textColor: kTextColorWhite,
              press: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Container(
                            height: 300,
                            child: Column(
                              children: [
                                Text(
                                  "Convert",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$displayInputs into",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("Meter")),
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("CentiMeter")),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("Meter")),
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("CentiMeter")),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("Meter")),
                                      RaisedButton(
                                          color: kButtonBackground
                                              .withOpacity(0.7),
                                          onPressed: () {},
                                          child: Text("CentiMeter")),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                // setState(
                //   () {

                //     // calculation("C");
                //   },
                // );
              },
            ),
            ConverterButton(
              text: "m",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("m");
                  },
                );
              },
            ),
            ConverterButton(
              text: "cm",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("cm");
                  },
                );
              },
            ),
            ConverterButton(
              text: "mm",
              backgroundColor: kButtonConverterBackgroud.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("mm");
                  },
                );
              },
            ),
          ],
        ),
        //
        Row(
          children: <Widget>[
            CalculatorButton(
              text: "C",
              backgroundColor: kButtonBackground.withOpacity(0.3),
              textColor: kTextColorWhite,
              press: () {
                setState(
                  () {
                    calculation("C");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "()",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {},
            ),
            CalculatorButton(
              text: "%",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {},
            ),
            CalculatorButton(
              text: "/",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("/");
                  },
                );
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorButton(
              text: "7",
              press: () {
                setState(
                  () {
                    calculation("7");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "8",
              press: () {
                setState(
                  () {
                    calculation("8");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "9",
              press: () {
                setState(
                  () {
                    calculation("9");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "x",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("x");
                  },
                );
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorButton(
              text: "4",
              press: () {
                setState(
                  () {
                    calculation("4");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "5",
              press: () {
                setState(
                  () {
                    calculation("5");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "6",
              press: () {
                setState(
                  () {
                    calculation("6");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "-",
              press: () {
                setState(
                  () {
                    calculation("-");
                  },
                );
              },
              backgroundColor: kButtonBackground.withOpacity(0.1),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorButton(
              text: "1",
              press: () {
                setState(
                  () {
                    calculation("1");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "2",
              press: () {
                setState(
                  () {
                    calculation("2");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "3",
              press: () {
                setState(
                  () {
                    calculation("3");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "+",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    calculation("+");
                  },
                );
              },
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            CalculatorButton(
              text: "0",
              press: () {
                setState(
                  () {
                    calculation("0");
                  },
                );
              },
            ),
            CalculatorButton(
              text: ".",
              press: () {
                setState(
                  () {
                    calculation(".");
                  },
                );
              },
            ),
            CalculatorButton(
              text: "=",
              backgroundColor: kButtonBackground,
              textColor: kTextColorWhite,
              press: () {
                setState(
                  () {
                    calculation("=");
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
