import 'package:fraction/fraction.dart' as fracc;

double result;
List<String> num1List = [];
List<String> num2List = [];
List<String> parameters = [];
String displayInputs;
List<String> allInputs = [];
List<String> lengthinputs = [];
//lenth perameters

//new logic//
String lengthResult = "";
String lengthResultUnit = "";
String conversionResult = "";
String convertInto = "";
double mr1 = 0;
double mr2 = 0;
String inchSymbol = "${String.fromCharCodes(new Runes('\u0022'))}";
String feetSymbol = "${String.fromCharCodes(new Runes('\u0027'))}";
String divisionSymbol = "${String.fromCharCodes(new Runes('\u00F7'))}";
String backspaceSymbol = "${String.fromCharCodes(new Runes('\u232B'))}";
String infoSymbol = "${String.fromCharCodes(new Runes('\u24D8'))}";
//
bool isLengthConverter = false;
bool isMathCalculation = false;
String lengthOptr = "";
bool lastOptrIsLength = true;
bool lastOptr = false;
bool isCalculatoinStart = false;
//
// braces calculation
bool braceopen = false;
List<String> numerator = [];
List<String> denominator = [];
bool fraction = false;
bool isFractionpressable = false;
bool fractionPressed = false;
bool isbracespressable = false;
bool over = false;
double fractionResult = 0;
//
conversition(String inputUnit) {
  lengthResultUnit = "";
  lengthResult = "";
  result = null;
  if (inputUnit == "yard") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 / 36).toString()} $inputUnit";

    // mr1 = mr1 * 1.094;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "m") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 / 39.37).toString()} $inputUnit";

    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "$feetSymbol") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 / 12).toString()} $inputUnit";
    // conversionResult = convertIntofeetInch(mr1);
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "$inchSymbol") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1).toString()} $inputUnit";
    // mr1 = mr1 * 39.37;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "cm") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 2.54).toString()} $inputUnit";
    // mr1 = mr1 * 100;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "mm") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 25.4).toString()} $inputUnit";
    // mr1 = mr1 * 1000;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  }
}

backspaceFunction() {
  //
  if (allInputs.length > 0 &&
      (allInputs.last == "0" ||
          allInputs.last == "1" ||
          allInputs.last == "2" ||
          allInputs.last == "3" ||
          allInputs.last == "4" ||
          allInputs.last == "5" ||
          allInputs.last == "6" ||
          allInputs.last == "7" ||
          allInputs.last == "8" ||
          allInputs.last == "9" ||
          allInputs.last == ".")) {
    print("removed");

    if (num2List.length < 1 && parameters.length < 1 && !braceopen) {
      num1List.removeLast();
      allInputs.removeLast();
      lengthinputs.removeLast();
    } else {
      if (num2List.length > 0 && !braceopen) {
        num2List.removeLast();
        allInputs.removeLast();
        lengthinputs.removeLast();
      }
    }
    if (braceopen) {
      if (numerator.length != 0 && !fraction) {
        numerator.removeLast();
        allInputs.removeLast();
      } else if (denominator.length != 0) {
        denominator.removeLast();
        allInputs.removeLast();
      }
      displayInputs = allInputs.join();
    }
  }
  displayInputs = allInputs.join();
}

calculation(String input) {
  // If user press the clear button

//
  if (input == "(") {
    over = true;
  } else if (input == ")") {
    fractionResult =
        double.parse(numerator.join()) / double.parse(denominator.join());
    over = false;
  }
//
  if (input != "yard" &&
      input != "$feetSymbol" &&
      input != "$inchSymbol" &&
      input != "m" &&
      input != "cm" &&
      input != "mm") {
    //NOTE clear buttion
    if (input == "C") {
      isbracespressable = false;
      isFractionpressable = false;
      fractionPressed = false;
      fractionResult = 0;
      denominator = [];
      numerator = [];
      fraction = false;
      braceopen = false;
      conversionResult = "";
      lastOptr = false;
      isLengthConverter = false;
      isMathCalculation = false;
      lengthinputs = [];
      mr1 = 0;
      mr2 = 0;
      lastOptrIsLength = true;
      num1List = [];
      num2List = [];
      parameters = [];
      allInputs = [];
      displayInputs = null;
      result = null;
      isLengthConverter = false;
      isCalculatoinStart = false;
      lengthResult = "";
      lengthResultUnit = "";
      return;
    }
    // if two value are available then the '=' work

    // NOTE equal Code
    if (num1List.length != 0 && num2List.length != 0 && input == "=") {
      allOperations();
      if (isLengthConverter) {
        mr1 = double.parse(lengthResult);
        mr2 = 0;
        parameters = [];
        allInputs = ["$lengthResultUnit"];
        result = null;
      } else {
        lastOptr = false;
        parameters = [];
        num1List = ["$result"];
        num2List = [];
        allInputs = ["$result"];
      }
      return;
    } else if (num2List.length == 0 && input == "=")
      return; // if one value input then press '=' then it did nothing
//NOTE if number is pressed
    if (input == "0" ||
        input == "1" ||
        input == "2" ||
        input == "3" ||
        input == "4" ||
        input == "5" ||
        input == "6" ||
        input == "7" ||
        input == "8" ||
        input == "9" ||
        input == ".") {
//
      if (braceopen) {
        if (braceopen && !fraction) {
          numerator.add(input);
        } else if (braceopen && fraction) {
          denominator.add(input);
        }
//
      } else {
        isbracespressable = true;
        isCalculatoinStart = true;
        lastOptr = false;
        lastOptrIsLength = false;
        lengthOptr = "";

        if (parameters.length == 0 && result == null) {
          num1List.add(input);
          // When pressed "=" after that hit any number
        } else if (parameters.length == 0 && result != null) {
          result = null;
          num1List = [];
          allInputs = [];
          num1List.add(input);
        } else {
          num2List.add(input);
        }
      }
    }
    if (input == "+" ||
        input == "-" ||
        input == "x" ||
        input == "$divisionSymbol") {
      fractionResult = 0;
      denominator = [];
      numerator = [];
      lastOptr = true;
      if (!isLengthConverter) {
        isMathCalculation = true;
      }
      lengthOptr = "";
      if (num1List.length != 0) {
        if (parameters.length == 0) {
          // When for the first time we hit any Operator button
          parameters.add(input);
        } else {
          allOperations();
          // When we press any operator button for the second time
          parameters.add(input);
        }
      }
    }
//NOTE Show on Screen
    if (num1List.length != 0 || parameters.length != 0) {
      // if (!lastOptr) {
      if (!braceopen) {
        lengthinputs.add(input);
      }

      allInputs.add(input);
      if (lastOptr == true) {
        lengthinputs = [];
        // lastOptr = false;
      }
      displayInputs = allInputs.join();
      // }
    }
  } else if (!lastOptrIsLength && !isMathCalculation) {
    isLengthConverter = true;
    isbracespressable = false;
    //NOTE
//here is code for length measured

    if (num1List.length > 0 && parameters.length == 0 && lengthOptr == "") {
      if (input == "yard") {
        mr1 = mr1 + (double.parse(lengthinputs.join()) + fractionResult) * 36;
      } else if (input == "$feetSymbol") {
        mr1 = mr1 + ((double.parse(lengthinputs.join()) + fractionResult) * 12);
      } else if (input == "$inchSymbol") {
        mr1 = mr1 + double.parse(lengthinputs.join()) + fractionResult;
      } else if (input == "m") {
        mr1 =
            mr1 + (double.parse(lengthinputs.join()) + fractionResult) * 39.37;
      } else if (input == "cm") {
        mr1 = mr1 + (double.parse(lengthinputs.join()) + fractionResult) / 2.54;
      } else if (input == "mm") {
        mr1 = mr1 + (double.parse(lengthinputs.join()) + fractionResult) / 25.4;
      }
      // isLengthConverter = true;
      // lastOptrIsLength = true;
      // lengthOptr = input;
      // lengthinputs = [];
      // allInputs.add(input);
      // displayInputs = allInputs.join();
    } else if (num2List.length > 0 && lengthOptr == "") {
      if (input == "yard") {
        mr2 = mr2 + (double.parse(lengthinputs.join()) + fractionResult) * 36;
      } else if (input == "$feetSymbol") {
        mr2 = mr2 + ((double.parse(lengthinputs.join()) + fractionResult) * 12);
      } else if (input == "$inchSymbol") {
        mr2 = mr2 + double.parse(lengthinputs.join()) + fractionResult;
      } else if (input == "m") {
        mr2 =
            mr2 + (double.parse(lengthinputs.join()) + fractionResult) * 39.37;
      } else if (input == "cm") {
        mr2 = mr2 + (double.parse(lengthinputs.join()) + fractionResult) / 2.54;
      } else if (input == "mm") {
        mr2 = mr2 + (double.parse(lengthinputs.join()) + fractionResult) / 25.4;
      }
      // lastOptrIsLength = true;
      // lengthOptr = input;
      // lengthinputs = [];
      // allInputs.add(input);
      // displayInputs = allInputs.join();
    }

    lastOptrIsLength = true;
    denominator = [];
    numerator = [];
    fractionResult = 0;
    lengthOptr = input;
    lengthinputs = [];
    allInputs.add(input);
    displayInputs = allInputs.join();
    // if (braceopen && !fraction && input == "(") {
    //   numerator.add(input);
    // } else if (braceopen && fraction && input == ")") {
    //   denominator.add(input);
    // }
  }
}

void allOperations() {
  if (parameters[parameters.length - 1] == "+") {
    if (isLengthConverter) {
      result = mr1 + mr2;
      mr1 = result;
      lengthResult = "${result.toString()}";
      lengthResultUnit = convertIntofeetInch(result);
      // double resfeet = result / 12;
      // double resinch = result - resfeet.toInt() * 12;

      // if (resfeet == 0) {
      //   lengthResultUnit = "${resinch.toString()}inch";
      // } else if (resinch == 0) {
      //   lengthResultUnit = "${resfeet.toInt().toString()}feet";
      // } else {
      //   lengthResultUnit =
      //       "${resfeet.toInt().toString()}feet${resinch.toStringAsFixed(2)}inch";
      // }

      num1List = ["$result"];
      num2List = [];
      mr2 = 0;
      result = null;
      parameters = [];
    } else {
      double sum = addition(num1List.join(), num2List.join());
      num1List = ["$sum"];
      num2List = [];
      result = sum;
    }
  } else if (parameters[parameters.length - 1] == "-") {
    if (isLengthConverter) {
      result = mr1 - mr2;
      mr1 = result;
      lengthResultUnit = convertIntofeetInch(result);
      lengthResult = "${result.toString()}";

      num1List = ["$result"];
      num2List = [];
      mr2 = 0;
      result = null;
      parameters = [];
    } else {
      double subtract = subtraction(num1List.join(), num2List.join());
      num1List = ["$subtract"];
      num2List = [];
      result = subtract;
    }
  } else if (parameters[parameters.length - 1] == "x") {
    if (isLengthConverter) {
      result = mr1 * mr2;
      mr1 = result;
      lengthResult = "${result.toString()}";
      lengthResultUnit = convertIntofeetInch(result);
      num1List = ["$result"];
      num2List = [];
      result = null;
      mr2 = 0;
      parameters = [];
    } else {
      double multi = multiplication(num1List.join(), num2List.join());
      num1List = ["$multi"];
      num2List = [];
      result = multi;
    }
  } else if (parameters[parameters.length - 1] == "$divisionSymbol") {
    if (isLengthConverter) {
      result = mr1 / mr2;
      mr1 = result;
      lengthResult = "${result.toString()}";
      lengthResultUnit = convertIntofeetInch(result);
      num1List = ["$result"];
      num2List = [];
      mr2 = 0;
      result = null;
      parameters = [];
    } else {
      double divi = division(num1List.join(), num2List.join());
      num1List = ["$divi"];
      num2List = [];
      result = divi;
    }
  }
}

convertIntofeetInch(double result2) {
  double resfeet = result2 / 12;
  double resinch = result2 - resfeet.toInt() * 12;
  String denomi;
  String nume;
  String whole;

  print(inchSymbol);
  // String frac = resinch.toStringAsFixed(2);
  // String whole =
  //     fracc.Fraction.fromDouble(resinch).toMixedFraction().whole.toString();
  print(resinch.floor());
  print((resinch - resinch.floor()));

  //

  //
  if ((resinch - resinch.floor()) != 0) {
    // nume = fracc.Fraction.fromDouble(resinch).numerator.toString();
    // denomi = fracc.Fraction.fromDouble(resinch).denominator.toString();
    nume = fracc.Fraction.fromDouble(resinch)
        .toMixedFraction()
        .numerator
        .toString();
    whole =
        fracc.Fraction.fromDouble(resinch).toMixedFraction().whole.toString();
    denomi = fracc.Fraction.fromDouble(resinch)
        .toMixedFraction()
        .denominator
        .toString();
  }
  // print(frac);
  // print(fracc.Fraction.fromDouble(1.5).toMixedFraction());
  // print(((double.parse(frac) - double.parse(frac).floor()) * 100).floor());
  if (resfeet.toInt() == 0) {
    if (nume == null) {
      return "${resinch.toInt()}$inchSymbol";
    } else {
      return "${resinch.toInt()}($nume/$denomi)$inchSymbol";
    }
  } else if (resinch == 0) {
    return "${resfeet.toInt().toString()}$feetSymbol";
  } else if (nume != null) {
    // return "${resfeet.toInt().toString()}feet${resinch.toStringAsFixed(2)}inch";
    return "${resfeet.toInt().toString()}$feetSymbol ${resinch.toInt()}($nume/$denomi)$inchSymbol";
  } else {
    return "${resfeet.toInt().toString()}$feetSymbol ${resinch.toStringAsFixed(0)}$inchSymbol";
  }
}

addition(String num1, String num2) {
  double addResult = double.parse(num1) + double.parse(num2);
  return addResult;
}

subtraction(String num1, String num2) {
  double subResult = double.parse(num1) - double.parse(num2);
  return subResult;
}

multiplication(String num1, String num2) {
  double mulResult = double.parse(num1) * double.parse(num2);
  return mulResult;
}

division(String num1, String num2) {
  double diviResult = double.parse(num1) / double.parse(num2);
  return diviResult;
}
