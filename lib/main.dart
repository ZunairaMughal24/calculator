import 'dart:ui';

import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

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
  var output = "";
  var operator = "";

  // void add() {
  //   var num = textController.text.split("+");
  //   if (num.length < 2 || num[0].isEmpty || num[1].isEmpty) {
  //     // Handle invalid input
  //     return;
  //   }
  //   var sum = int.parse(num[0]) + int.parse(num[1]);
  //   setState(() {
  //     output = "$sum";
  //   });
  // }

  // void subtract() {
  //   var num = textController.text.split("-");
  //   if (num.length == 2 && num[1].isNotEmpty) {
  //     // Handle negative numbers properly
  //     num[1] = "-${num[1]}";
  //   }
  //   if (num.length < 2 || num[0].isEmpty || num[1].isEmpty) {
  //     // Handle invalid input
  //     return;
  //   }
  //   var sub = int.parse(num[0]) - int.parse(num[1]);
  //   setState(() {
  //     output = "$sub";
  //   });
  // }

  // void multiply() {
  //   var num = textController.text.split("x");
  //   if (num.length == 2 && num[1].isNotEmpty) {
  //     // Handle negative numbers properly
  //     num[1] = "-${num[1]}";
  //   }
  //   if (num.length < 2 || num[0].isEmpty || num[1].isEmpty) {
  //     // Handle invalid input
  //     return;
  //   }
  //   var pro = int.parse(num[0]) * int.parse(num[1]);
  //   setState(() {
  //     output = "$pro";
  //   });
  // }

  // void divide() {
  //   var num = textController.text.split("/");
  //   if (num.length == 2 && num[1].isNotEmpty) {
  //     // Handle negative numbers properly
  //     num[1] = "-${num[1]}";
  //   }
  //   if (num.length < 2 || num[0].isEmpty || num[1].isEmpty) {
  //     // Handle invalid input
  //     return;
  //   }
  //   var div = int.parse(num[0]) / int.parse(num[1]);
  //   setState(() {
  //     output = "$div";
  //   });
  // }

  void add() {
    var num = textController.text.toString().split("+");
    if (num[0].isEmpty) {
      num[0] = '0';
    }
    var sum = int.parse(num.first) + int.parse(num.last);
    setState(() {
      output = "$sum";
    });
  }

  void subtract() {
    var num = textController.text.toString().split("-");
    if (num[0].isEmpty) {
      num[0] = '0';
    }
    var sub = int.parse(num.first) - int.parse(num.last);
    setState(() {
      output = "$sub";
    });
  }

  void multiply() {
    var num = textController.text.toString().split("x");
    if (num[0].isEmpty) {
      num[0] = '0';
    }
    var pro = int.parse(num.first) * int.parse(num.last);
    setState(() {
      output = "$pro";
    });
  }

  void divide() {
    var num = textController.text.toString().split("/");
    if (num[0].isEmpty) {
      num[0] = '0';
    }
    var div = int.parse(num.first) / int.parse(num.last);
    setState(() {
      output = "$div";
    });
  }

  final List<String> button = [
    '<',
    'AC',
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
    'ANS',
    '0',
    ".",
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 26, 77),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          //  [ ui1
          // Color.fromARGB(255, 175, 122, 159),
          // Color.fromARGB(255, 63, 10, 70),
          // Color.fromARGB(255, 63, 10, 70),]
          Colors.black,
          Color.fromARGB(255, 32, 32, 32),
          Color.fromARGB(255, 48, 47, 47),

          Color.fromARGB(255, 32, 32, 32),
        ], begin: Alignment.topRight, end: Alignment.bottomRight)),
        child: Column(
          children: [
            SizedBox(
              height: 185,
              width: double.infinity,
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
                        fontSize: 32,
                        color: Color.fromARGB(255, 255, 254, 255),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      output,
                      style: const TextStyle(
                        fontSize: 27,
                        color: Color.fromARGB(255, 255, 254, 255),
                        // color: Color.fromARGB(255, 255, 254, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 6, right: 2, bottom: 6, left: 2),
                child: Container(
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
                        if (index == 0) {
                          return MyButton(
                            ontapped: () {
                              setState(() {
                                textController.text = textController.text.substring(0, textController.text.length - 1);
                              });
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 58, 57, 57),
                              // color: const Color.fromARGB(255, 138, 98, 125),ui1
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 68, 68, 68),
                                // color: Color.fromARGB(255, 155, 110, 141),ui1
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 49, 47, 47),
                            textColor: Colors.white,
                            // color: const Color.fromARGB(255, 124, 65, 106),ui1
                            //   textColor: isOperator(button[index])
                            //       ? const Color.fromARGB(255, 97, 11, 109)
                            //       : Colors.deepPurple[100],ui1
                          );
                        }
                        if (index == 1) {
                          return MyButton(
                            ontapped: () {
                              setState(() {
                                output = "";
                                textController.clear();
                              });
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 58, 57, 57),
                              // color: const Color.fromARGB(255, 138, 98, 125),ui1
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 68, 68, 68),
                                // color: Color.fromARGB(255, 155, 110, 141),ui1
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 51, 51, 51),
                            textColor: Colors.white,
                            // color: const Color.fromARGB(255, 124, 65, 106),ui1
                            // textColor: isOperator(button[index])
                            //     ? const Color.fromARGB(255, 97, 11, 109)
                            //     : Colors.deepPurple[100],ui1
                          );
                        } else if (index == 2) {
                          return MyButton(
                            border: Border.all(
                              color: const Color.fromARGB(255, 58, 57, 57),
                              // color: const Color.fromARGB(255, 138, 98, 125),ui1
                            ),
                            ontapped: () {
                              operator = "%";
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            text: button[index],
                            // color: const Color.fromARGB(255, 124, 65, 106),ui1
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 68, 68, 68),
                                // color: Color.fromARGB(255, 155, 110, 141),ui1
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 51, 51, 51),
                            textColor: Colors.white,
                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),ui1
                          );
                        } else if (index == 3) {
                          return MyButton(
                            ontapped: () {
                              operator = "/";
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            border: Border.all(
                              color: const Color.fromARGB(255, 206, 202, 202),
                              // color: const Color.fromARGB(255, 134, 92, 136),ui1
                            ),
                            text: button[index],
                            // color: const Color.fromARGB(255, 121, 66, 122),ui1
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 105, 102, 102),
                                // color: Color.fromARGB(255, 156, 109, 158),ui1
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 216, 216, 211),
                            textColor: Colors.black,
                            //2 color: const Color.fromARGB(255, 175, 144, 6),
                            // textColor: Colors.white,2
                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),ui1
                          );
                        } else if (index == 7) {
                          return MyButton(
                            ontapped: () {
                              operator = "x";
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            border: Border.all(
                              color: const Color.fromARGB(255, 206, 202, 202),
                              // color: const Color.fromARGB(255, 134, 92, 136),
                            ),
                            text: button[index],
                            // color: const Color.fromARGB(255, 121, 66, 122),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 105, 102, 102),
                                // color: Color.fromARGB(255, 156, 109, 158),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 216, 216, 211),
                            textColor: Colors.black,
                            //2 color: const Color.fromARGB(255, 175, 144, 6),
                            //  textColor: Colors.white,2
                            // color: const Color.fromARGB(255, 3, 100, 107),

                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),
                          );
                        } else if (index == 11) {
                          return MyButton(
                            ontapped: () {
                              operator = "-";
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 206, 202, 202),
                              // color: const Color.fromARGB(255, 134, 92, 136),
                            ),
                            // color: const Color.fromARGB(255, 121, 66, 122),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 105, 102, 102),
                                // color: Color.fromARGB(255, 156, 109, 158),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 216, 216, 211),
                            textColor: Colors.black,
                            // color: const Color.fromARGB(255, 3, 100, 107),
                            //2 color: const Color.fromARGB(255, 175, 144, 6),
                            // textColor: Colors.white,2
                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),
                          );
                        } else if (index == 15) {
                          return MyButton(
                            ontapped: () {
                              operator = "+";
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 206, 202, 202),
                              // color: const Color.fromARGB(255, 134, 92, 136),
                            ),
                            // color: const Color.fromARGB(255, 121, 66, 122),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 105, 102, 102),
                                // color: Color.fromARGB(255, 156, 109, 158),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 216, 216, 211),
                            textColor: Colors.black,
                            // color: const Color.fromARGB(255, 3, 100, 107),
                            // 2color: const Color.fromARGB(255, 175, 144, 6),
                            // textColor: Colors.white,2
                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),
                          );
                        } else if (index == 19) {
                          return MyButton(
                            ontapped: () {
                              if (operator == "-") {
                                subtract();
                              } else if (operator == "+") {
                                add();
                              } else if (operator == "/") {
                                divide();
                              } else if (operator == "x") {
                                multiply();
                              } else {
                                return null;
                              }
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 206, 202, 202),
                              // color: const Color.fromARGB(255, 134, 92, 136),
                            ),
                            // color: const Color.fromARGB(255, 121, 66, 122),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 105, 102, 102),
                                // color: Color.fromARGB(255, 156, 109, 158),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            // color: const Color.fromARGB(255, 3, 100, 107),\

                            // textColor: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 71, 26, 77),
                            //2//    color: const Color.fromARGB(255, 175, 144, 6),
                            // textColor: Colors.white,2
                            color: const Color.fromARGB(255, 216, 216, 211),
                            textColor: Colors.black,
                          );
                        } else {
                          return MyButton(
                            ontapped: () {
                              setState(() {
                                textController.text += button[index];
                              });
                            },
                            text: button[index],
                            border: Border.all(
                              color: const Color.fromARGB(255, 58, 57, 57),

                              // color: const Color.fromARGB(255, 102, 62, 93),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 68, 68, 68),
                                // color: Color.fromARGB(255, 126, 88, 117),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              )
                            ],
                            color: const Color.fromARGB(255, 20, 20, 20),
                            textColor: Colors.white,
                            // color: isOperator(button[index])
                            //     ? Colors.deepPurple[100]
                            //     : const Color.fromARGB(255, 63, 10, 70),
                            // textColor: isOperator(button[index])
                            //     ? const Color.fromARGB(255, 71, 26, 77)
                            //     : Colors.deepPurple[100],
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String digit) {
    if (digit == "-" || digit == "+" || digit == "/" || digit == "x" || digit == "=" || digit == "%") {
      return true;
    }

    return false;
  }
}
