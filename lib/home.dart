import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        fontFamily: "regular",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  // final textController2 = TextEditingController();

  var output = "";

  void add() {
    var num = textController.text.toString().split("+");

    var sum = int.parse(num.first) + int.parse(num.last);
    setState(() {
      output = "$sum";
    });
  }

  void subtract() {
    var num = textController.text.toString().split("-");

    var sub = int.parse(num.first) - int.parse(num.last);
    setState(() {
      output = "$sub";
    });
  }

  void multiply() {
    var num = textController.text.toString().split("x");

    var pro = int.parse(num.first) * int.parse(num.last);
    setState(() {
      output = "$pro()";
    });
  }

  void divide() {
    var num = textController.text.toString().split("/");

    var div = int.parse(num.first) / int.parse(num.last);
    setState(() {
      output = "$div";
    });
  }

  final List<String> button = [
    '<',
    'DEl',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '.',
    '0',
    "ANS",
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 185,
            width: double.infinity,
            color: const Color.fromARGB(255, 71, 26, 77),
            // color: const Color.fromARGB(255, 76, 34, 82),
            // color: const Color.fromARGB(255, 97, 11, 109),
            // color: const Color.fromARGB(255, 194, 173, 229),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: textController.text,
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 27,
                      // color: Color.fromARGB(255, 97, 11, 109),
                      color: Color.fromARGB(255, 255, 254, 255),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    output,
                    style: const TextStyle(
                      fontSize: 27,
                      // color: Color.fromARGB(255, 97, 11, 109),
                      color: Color.fromARGB(255, 255, 254, 255),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(255, 71, 26, 77),
              // color: const Color.fromARGB(255, 76, 34, 82),
              // color: const Color.fromARGB(255, 97, 11, 109),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: button.length,
                  itemBuilder: (BuildContext context, int index) {
                    // if (index == 15) {
                    //   operator == "+";
                    // }
                    if (index == 0) {
                      return MyButton(
                        ontapped: () {
                          setState(() {
                            textController.text = textController.text.substring(0, textController.text.length - 1);
                          });
                        },
                        text: button[index],
                        // color: isOperator(button[index])
                        //     ? const Color.fromARGB(255, 171, 122, 179)
                        //     : const Color.fromARGB(255, 140, 67, 150),
                        color: const Color.fromARGB(255, 129, 76, 138),
                        textColor:
                            isOperator(button[index]) ? const Color.fromARGB(255, 97, 11, 109) : Colors.deepPurple[100],
                      );
                    } else if (index == 15) {
                      operator == "+";
                      return MyButton(
                        ontapped: () {
                          setState(() {
                            // output = "";
                          });
                        },
                        text: button[index],
                        // color: isOperator(button[index])
                        //     ? const Color.fromARGB(255, 171, 122, 179)
                        //     : const Color.fromARGB(255, 131, 66, 139),
                        // color: const Color.fromARGB(255, 131, 66, 139),
                        color: const Color.fromARGB(255, 129, 76, 138),
                        textColor:
                            isOperator(button[index]) ? const Color.fromARGB(255, 71, 26, 77) : Colors.deepPurple[100],
                      );
                      // } else if (index == 2) {
                      //   return MyButton(
                      //     ontapped: () {
                      //       setState(() {
                      //         input += button[index];
                      //       });
                      //     },
                      //     text: button[index],
                      //     // color: isOperator(button[index])
                      //     //     ? const Color.fromARGB(255, 171, 122, 179)
                      //     //     : const Color.fromARGB(255, 140, 67, 150),
                      //     // // : const Color.fromARGB(255, 106, 23, 117),
                      //     // color: const Color.fromARGB(255, 131, 66, 139),
                      //     color: const Color.fromARGB(255, 129, 76, 138),
                      //     textColor:
                      //         isOperator(button[index]) ? const Color.fromARGB(255, 71, 26, 77) : Colors.deepPurple[100],
                      //   );
                    } else if (index == 19) {
                      return MyButton(
                        ontapped: () {
                          if (operator == "+") {
                            add();
                          }
                          // switch (operator) {
                          //   case "+":
                          //     add();
                          //     break;
                          //   case "-":
                          //     subtract();
                          //     break;
                          //   case "x":
                          //     multiply();
                          //     break;
                          //   case "/":
                          //     divide();
                          //     break;
                          //   default:
                          //     // Do nothing or handle the default case as needed
                          //     break;

                          // if (operator == "+") {
                          //   add();

                          //   // } else if (operator == "-") {
                          //   //   subtract();
                          //   // } else if (operator == "x") {
                          //   //   multiply();
                          //   // } else if (operator == "/") {
                          //   //   divide();
                          //   // } else
                          //   // // ignore: curly_braces_in_flow_control_structures
                          //   // {
                          //   //   return null;
                          // }
                        },
                        text: button[index],
                        // color: isOperator(button[index])
                        //     ? const Color.fromARGB(255, 171, 122, 179)
                        //     : const Color.fromARGB(255, 131, 66, 139),
                        // color: const Color.fromARGB(255, 131, 66, 139),
                        color: Colors.deepPurple[100],

                        textColor:
                            isOperator(button[index]) ? const Color.fromARGB(255, 71, 26, 77) : Colors.deepPurple[100],
                      );
                    } else {
                      return MyButton(
                        ontapped: () {
                          setState(() {
                            textController.text += button[index];
                            // var input1 = int.parse(textController.text.toString());
                            // var input2 = int.parse(textController.text.toString());
                          });
                        },
                        text: button[index],
                        color: isOperator(button[index])
                            ? Colors.deepPurple[100]
                            : const Color.fromARGB(255, 106, 23, 117),
                        textColor:
                            isOperator(button[index]) ? const Color.fromARGB(255, 71, 26, 77) : Colors.deepPurple[100],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  var operator = "";
  bool isOperator(String digit) {
    if (digit == "-" || digit == "+" || digit == "/" || digit == "x" || digit == "=" || digit == "%") {
      return true;
    }

    return false;
  }

//   void equalPressed() {
//     String finalInput = input;
//     finalInput = finalInput.replaceAll("x", "*");
//     Parser p = Parser();
//     Expression exp = p.parse(finalInput);
//     ContextModel cm = ContextModel();
//     double eval = exp.evaluate(EvaluationType.REAL, cm);

//     output = eval.toString();
//   }
}
