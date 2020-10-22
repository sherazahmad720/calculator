double result;
List<String> num1List = [];
List<String> num2List = [];
List<String> _parameters = [];
String displayInputs;
List<String> allInputs = [];
//lenth perameters
String inch1 = "";
String inch2 = "";
String feet1 = "";
String feet2 = "";
double inchResult = 0;
double feetResult = 0;
bool isLengthConverter = false;
String lengthOptr = "";
bool lastOptrIsLength = false;
bool lastOptr = false;
calculation(String input) {
  // If user press the clear button

  if (input != "inch") {
    lastOptrIsLength = false;
    if (input == "C") {
      num1List = [];
      num2List = [];
      _parameters = [];
      allInputs = [];
      displayInputs = null;
      result = null;
      //
      inch1 = "";
      inch2 = "";
      feet1 = "";
      feet2 = "";
      isLengthConverter = false;
      return;
    }
    // if two value are available then the '=' work
    if (num1List.length != 0 && num2List.length != 0 && input == "=") {
      allOperations();
      if (isLengthConverter) {
        inch2 = "";
        _parameters = [];
        // allInputs = ["$inchResult inch"];
      } else {
        _parameters = [];
        num1List = ["$result"];
        num2List = [];
        allInputs = ["$result"];
      }
      return;
    } else if (num2List.length == 0 && input == "=")
      return; // if one value input then press '=' then it did nothing

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
      lengthOptr = "";
      if (_parameters.length == 0 && result == null) {
        num1List.add(input);
        // When pressed "=" after that hit any number
      } else if (_parameters.length == 0 && result != null) {
        result = null;
        num1List = [];
        allInputs = [];
        num1List.add(input);
      } else {
        num2List.add(input);
      }
    }
    if (input == "+" || input == "-" || input == "x" || input == "/") {
      lengthOptr = "";
      if (num1List.length != 0) {
        if (_parameters.length == 0) {
          // When for the first time we hit any Operator button
          _parameters.add(input);
        } else {
          allOperations();
          // When we press any operator button for the second time
          _parameters.add(input);
        }
      }
    }

    if (num1List.length != 0 || _parameters.length != 0) {
      allInputs.add(input);
      displayInputs = allInputs.join();
    }
  } else if (_parameters.length == 0 || inch1 != "") {
    isLengthConverter = true;
//here is code for length measured

    if (num1List.length > 0 && _parameters.length == 0 && lengthOptr == "") {
      lengthOptr = input;
      inch1 = allInputs.join();
      allInputs.add(input);
      // allInputs.removeLast();
      displayInputs = allInputs.join();
    } else if (num2List.length > 0 && lengthOptr == "") {
      lengthOptr = input;
      inch2 = num2List.join();
      allInputs.add(input);
      displayInputs = allInputs.join();
    }
  }
}

void allOperations() {
  if (_parameters[_parameters.length - 1] == "+") {
    if (isLengthConverter) {
      num2List = [];
      inchResult = addition(inch1, inch2);
      inch1 = "$inchResult";
      inch2 = "";
      // feetResult = inchResult;
      _parameters = [];

      allInputs = ["$inchResult inch"];
    } else {
      double sum = addition(num1List.join(), num2List.join());
      num1List = ["$sum"];
      num2List = [];
      result = sum;
    }
  } else if (_parameters[_parameters.length - 1] == "-") {
    if (isLengthConverter) {
      num2List = [];
      inchResult = subtraction(inch1, inch2);
      inch1 = "$inchResult";
      inch2 = "";
      // feetResult = inchResult;
      _parameters = [];

      allInputs = ["$inchResult inch"];
    } else {
      double subtract = subtraction(num1List.join(), num2List.join());
      num1List = ["$subtract"];
      num2List = [];
      result = subtract;
    }
  } else if (_parameters[_parameters.length - 1] == "x") {
    if (isLengthConverter) {
      num2List = [];
      inchResult = multiplication(inch1, inch2);
      inch1 = "$inchResult";
      inch2 = "";
      // feetResult = inchResult;
      _parameters = [];

      allInputs = ["$inchResult inch"];
    } else {
      double multi = multiplication(num1List.join(), num2List.join());
      num1List = ["$multi"];
      num2List = [];
      result = multi;
    }
  } else if (_parameters[_parameters.length - 1] == "/") {
    if (isLengthConverter) {
      num2List = [];
      inchResult = division(inch1, inch2);
      inch1 = "$inchResult";
      inch2 = "";
      // feetResult = inchResult;
      _parameters = [];

      allInputs = ["$inchResult inch"];
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
