import 'dart:math';

String calculate(List<String> exp) {
  List<double> num = [];
  List<String> oper = [];

  List<String> a = [];

  //print(exp);
  
  for (var i in exp) {
    if (exp[0] == '-' && a.isEmpty ) {
      a.add('-');
      continue;
    }

    if (double.tryParse(i) != null || i == '.') {
      a.add(i);
    } else {
      a.add(' ');
      oper.add(i);
    }
  }

  num = a.join('').split(' ').map((e) => double.parse(e)).toList();

  //print(oper);
  //print(num[0]);

  

  var b = 0;
  for (var i = 0; b < oper.length;) {
    switch (oper[i]) {
      case '*':
        num[i + 1] = multiply(num[i], num[i + 1]);
        num.removeAt(i);
        oper.removeAt(i);
        continue;
      case '/':
        num[i + 1] = divide(num[i], num[i + 1]);
        num.removeAt(i);
        oper.removeAt(i);
        continue;
      default:
        i++;
    }
    b++;
  }
  b = 0;
  for (var i = 0; b < oper.length;) {
    switch (oper[i]) {
      case '+':
        num[i + 1] = add(num[i], num[i + 1]);
        num.removeAt(i);
        oper.removeAt(i);
        continue;
      case '-':
        num[i + 1] = subtract(num[i], num[i + 1]);

        num.removeAt(i);
        oper.removeAt(i);
        continue;
      default:
    }
    b++;
  }

  return num[0] - num[0].round() == 0
      ? (num[0].round()).toString()
      : num[0].toStringAsFixed(3);
}

double multiply(num1, num2) {
  return num1 * num2;
}

double add(num1, num2) {
  return num1 + num2;
}

double divide(num1, num2) {
  return num1 / num2;
}

double subtract(num1, num2) {
  return num1 - num2;
}
