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
                            ? conversionResult == ""
                                ? ""
                                : "$conversionResult"
                            : "$lengthResultUnit "
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
            // UnitButton(
            //   text: "yard",
            //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
            //   press: () {
            //     setState(
            //       () {
            //         calculation("yard");
            //       },
            //     );
            //   },
            // ),
            // UnitButton(
            //   text: "feet",
            //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
            //   press: () {
            //     setState(
            //       () {
            //         calculation("feet");
            //       },
            //     );
            //   },
            // ),
            // UnitButton(
            //   text: "inch",
            //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
            //   press: () {
            //     setState(
            //       () {
            //         calculation("inch");
            //       },
            //     );
            //   },
            // ),
          ],
        ),
        Container(
          // width: 200,
          height: 100,
          child: Row(
            children: <Widget>[
              ConvertButton(
                  text: "Convert",
                  backgroundColor: kButtonConverterBackgroud.withOpacity(0.3),
                  textColor: kTextColorWhite,
                  press: () {
                    //NOTE Dialog
                    if (isLengthConverter && parameters.length < 1) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return diolog();
                          });
                    }
                  }),
              Column(
                children: [
                  UnitButton(
                    text: "yard",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength) {
                        setState(
                          () {
                            calculation("yard");
                          },
                        );
                      }
                    },
                  ),
                  UnitButton(
                    text: "m",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      setState(
                        () {
                          calculation("m");
                        },
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  UnitButton(
                    text: "feet",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      setState(
                        () {
                          calculation("feet");
                        },
                      );
                    },
                  ),
                  UnitButton(
                    text: "cm",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      setState(
                        () {
                          calculation("cm");
                        },
                      );
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  UnitButton(
                    text: "inch",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      setState(
                        () {
                          calculation("inch");
                        },
                      );
                    },
                  ),
                  UnitButton(
                    text: "mm",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
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
              // UnitButton(
              //   text: "Convert",
              //   backgroundColor: kButtonConverterBackgroud.withOpacity(0.3),
              //   textColor: kTextColorWhite,
              //   press: () {
              //     //NOTE Dialog
              //     showDialog(
              //         context: context,
              //         builder: (context) {
              //           return diolog();
              //         });
              //   },
              // ),
              // UnitButton(
              //   text: "m",
              //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
              //   press: () {
              //     setState(
              //       () {
              //         calculation("m");
              //       },
              //     );
              //   },
              // ),
              // UnitButton(
              //   text: "cm",
              //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
              //   press: () {
              //     setState(
              //       () {
              //         calculation("cm");
              //       },
              //     );
              //   },
              // ),
              // UnitButton(
              //   text: "mm",
              //   backgroundColor: kButtonLengthUnitBackgroud.withOpacity(0.1),
              //   press: () {
              //     setState(
              //       () {
              //         calculation("mm");
              //       },
              //     );
              //   },
              // ),
            ],
          ),
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
                if ((!lastOptr) &&
                    (!isLengthConverter || lastOptrIsLength) &&
                    isCalculatoinStart) {
                  setState(
                    () {
                      calculation("/");
                    },
                  );
                }
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
                if ((!lastOptr) &&
                    (!isLengthConverter || lastOptrIsLength) &&
                    isCalculatoinStart) {
                  setState(
                    () {
                      calculation("x");
                    },
                  );
                }
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
                if ((!lastOptr) &&
                    (!isLengthConverter || lastOptrIsLength) &&
                    isCalculatoinStart) {
                  setState(
                    () {
                      calculation("-");
                    },
                  );
                }
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
                if ((!lastOptr) &&
                    (!isLengthConverter || lastOptrIsLength) &&
                    isCalculatoinStart) {
                  setState(
                    () {
                      calculation("+");
                    },
                  );
                }
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
                if ((!lastOptr) && (!isLengthConverter || lastOptrIsLength)) {
                  setState(
                    () {
                      calculation("=");
                    },
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget diolog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          height: 300,
          child: Column(
            children: [
              Text(
                "Convert",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("m");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Meter")),
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("yard");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Yard")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("feet");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Feet")),
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("inch");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Inch")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("cm");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Centi Meter")),
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("mm");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("MiliMeter")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
