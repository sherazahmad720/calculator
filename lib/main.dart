import 'package:calculator/calFun.dart';
import 'package:calculator/constant.dart';
import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'Mobile_id';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
  static const MobileAdTargetingInfo targetinfo = MobileAdTargetingInfo(
      testDevices: testDevice != null ? <String>[testDevice] : null,
      nonPersonalizedAds: true,
      keywords: <String>['Education', 'Books', "job"]);
  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        // adUnitId: "ca-app-pub-7700197525069981/5915447837",
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.fullBanner,
        targetingInfo: targetinfo,
        listener: (MobileAdEvent event) {
          print("banner add Should loaded");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: BannerAd.testAdUnitId);
    _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

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
          children: <Widget>[],
        ),
        Container(
          // width: 200,
          height: 100,
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  ConvertButton(
                      text: "Convert",
                      backgroundColor:
                          kButtonConverterBackgroud.withOpacity(0.3),
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
                  ConvertButton(
                      text: "${String.fromCharCodes(new Runes('\u232B'))}",
                      backgroundColor: Colors.black.withOpacity(0.3),
                      textColor: Colors.white,
                      press: () {
                        setState(() {
                          backspaceFunction();
                        });
                      }),
                ],
              ),
              Column(
                children: [
                  UnitButton(
                    text: "yard",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
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
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
                        setState(
                          () {
                            calculation("m");
                          },
                        );
                      }
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
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
                        setState(
                          () {
                            calculation("$feetSymbol");
                          },
                        );
                      }
                    },
                  ),
                  UnitButton(
                    text: "cm",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
                        setState(
                          () {
                            calculation("cm");
                          },
                        );
                      }
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
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
                        setState(
                          () {
                            calculation("$inchSymbol");
                          },
                        );
                      }
                    },
                  ),
                  UnitButton(
                    text: "mm",
                    backgroundColor:
                        kButtonLengthUnitBackgroud.withOpacity(0.1),
                    press: () {
                      if (!isMathCalculation &&
                          !lastOptr &&
                          !lastOptrIsLength &&
                          !braceopen) {
                        setState(
                          () {
                            calculation("mm");
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
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
              text: "( )",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    if (!braceopen && !isMathCalculation && isbracespressable) {
                      isbracespressable = false;
                      isLengthConverter = true;
                      fractionPressed = false;
                      isFractionpressable = true;
                      braceopen = true;
                      calculation("(");
                    } else if (denominator.length > 0) {
                      calculation(")");
                      fractionPressed = false;

                      braceopen = false;
                      fraction = false;
                    }
                  },
                );
              },
            ),
            CalculatorButton(
              text: "/",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                setState(
                  () {
                    if (isFractionpressable &&
                        !fractionPressed &&
                        numerator.length > 0) {
                      fractionPressed = true;
                      fraction = true;
                      calculation(" / ");
                    }
                  },
                );
              },
            ),
            CalculatorButton(
              text: "$divisionSymbol",
              backgroundColor: kButtonBackground.withOpacity(0.1),
              press: () {
                if ((!lastOptr) &&
                    (!isLengthConverter || lastOptrIsLength) &&
                    isCalculatoinStart) {
                  setState(
                    () {
                      calculation("$divisionSymbol");
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
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return infoDiolog();
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      "$infoSymbol",
                      style: TextStyle(fontSize: 30),
                    ),
                  )),
                ),
              ),
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
        Container(
          width: 100,
          height: 70,
        )
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
                            conversition("$feetSymbol");
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text("Feet")),
                    FlatButton(
                        color: kButtonBackground.withOpacity(0.7),
                        onPressed: () {
                          setState(() {
                            conversition("$inchSymbol");
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

  //info dialog
  Widget infoDiolog() {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          height: 400,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  crossButton(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cm Inch Calculator",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                height: 350,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("$infoText"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Text("How To Use Fraction and Lenght units",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("$howtoText"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String infoText =
      """This Application Perform Simple Calculation as well as length calculation
You can use fraction in This app And Convert One unit to another.Answer of length Calculation is provided in fraction of feet and inches
      """;
  String howtoText =
      """First write any number and then press then unit button after that press any operator(+,-,/,X)
If you want to add fraction then write whole of fraction and open  bracket by pressing "(".  Enter numerator then press fraction "/" and write denominator and close bracket by pressing ")"  and chose any unit(m,cm,inch etc.)
If You want to write fraction which is less than 1 like 0.5 or 1/2 then you have to write 0 digit as whole
Example: write 0.5 as "0(1/2)" and 1.5 as "1(1/2)"
 """;
  Widget crossButton() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent, // button color
          child: InkWell(
            splashColor: Colors.lightBlue, // inkwell color
            child: SizedBox(
              width: 35,
              height: 35,
              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 19,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
