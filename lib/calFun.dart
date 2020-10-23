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
String conversionResult = "";
String convertInto = "";
double mr1 = 0;
double mr2 = 0;

//
bool isLengthConverter = false;
bool isMathCalculation = false;
String lengthOptr = "";
bool lastOptrIsLength = true;
bool lastOptr = false;
bool isCalculatoinStart = false;
conversition(String inputUnit) {
  if (inputUnit == "yard") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 1.094).toString()} $inputUnit";
    lengthResult = "";
    // mr1 = mr1 * 1.094;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "m") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1).toString()} $inputUnit";
    // mr1 = mr1;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "feet") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 3.281).toString()} $inputUnit";
    // mr1 = mr1 * 3.281;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "inch") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 39.37).toString()} $inputUnit";
    // mr1 = mr1 * 39.37;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "cm") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 100).toString()} $inputUnit";
    // mr1 = mr1 * 100;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  } else if (inputUnit == "mm") {
    // conversionResult = "${mr1.toString()} $inputUnit";
    conversionResult = "${(mr1 * 1000).toString()} $inputUnit";
    // mr1 = mr1 * 1000;
    mr2 = 0;
    parameters = [];
    allInputs = ["$conversionResult"];
    result = null;
  }
}

calculation(String input) {
  // If user press the clear button

  if (input != "yard" &&
      input != "feet" &&
      input != "inch" &&
      input != "m" &&
      input != "cm" &&
      input != "mm") {
    //NOTE clear buttion
    if (input == "C") {
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
        allInputs = ["$lengthResult m"];
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
    if (input == "+" || input == "-" || input == "x" || input == "/") {
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
      lengthinputs.add(input);
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
    //NOTE
//here is code for length measured

    if (num1List.length > 0 && parameters.length == 0 && lengthOptr == "") {
      if (input == "yard") {
        mr1 = mr1 + double.parse(lengthinputs.join()) / 1.094;
      } else if (input == "feet") {
        mr1 = mr1 + (double.parse(lengthinputs.join()) / 3.281);
      } else if (input == "inch") {
        mr1 = mr1 + double.parse(lengthinputs.join()) / 39.37;
      } else if (input == "m") {
        mr1 = mr1 + double.parse(lengthinputs.join());
      } else if (input == "cm") {
        mr1 = mr1 + double.parse(lengthinputs.join()) / 100;
      } else if (input == "mm") {
        mr1 = mr1 + double.parse(lengthinputs.join()) / 1000;
      }
      // isLengthConverter = true;
      lastOptrIsLength = true;
      lengthOptr = input;
      lengthinputs = [];
      print(mr1);
      allInputs.add(input);
      displayInputs = allInputs.join();
    } else if (num2List.length > 0 && lengthOptr == "") {
      if (input == "yard") {
        mr2 = mr2 + double.parse(lengthinputs.join()) / 1.094;
      } else if (input == "feet") {
        mr2 = mr2 + (double.parse(lengthinputs.join()) / 3.281);
      } else if (input == "inch") {
        mr2 = mr2 + double.parse(lengthinputs.join()) / 39.37;
      } else if (input == "m") {
        mr2 = mr2 + double.parse(lengthinputs.join());
      } else if (input == "cm") {
        mr2 = mr2 + double.parse(lengthinputs.join()) / 100;
      } else if (input == "mm") {
        mr2 = mr2 + double.parse(lengthinputs.join()) / 1000;
      }
      lastOptrIsLength = true;
      lengthOptr = input;
      lengthinputs = [];
      allInputs.add(input);
      displayInputs = allInputs.join();
    }
  }
}

void allOperations() {
  if (parameters[parameters.length - 1] == "+") {
    if (isLengthConverter) {
      result = mr1 + mr2;
      mr1 = result;
      lengthResult = "${result.toString()}";

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
  } else if (parameters[parameters.length - 1] == "/") {
    if (isLengthConverter) {
      result = mr1 / mr2;
      mr1 = result;
      lengthResult = "${result.toString()}";

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
