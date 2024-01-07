import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

void main() => runApp(const RoundPage());

class RoundPage extends StatefulWidget {
  const RoundPage({super.key});

  @override
  State<RoundPage> createState() => RoundPageState();
}

class RoundPageState extends State<RoundPage> {

  final TextEditingController _x1TextBox = TextEditingController();
  final TextEditingController _y1TextBox = TextEditingController();

  final TextEditingController _x2TextBox = TextEditingController();
  final TextEditingController _y2TextBox = TextEditingController();

  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(50),
                      child: Column(
                        children: [
                          const Text(
                            "Введите исходные данные первой точки",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _x1TextBox,
                            onSubmitted: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                                labelText: "Введите x первой точки:",
                                border: OutlineInputBorder()),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _y1TextBox,
                            onSubmitted: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                                labelText: "Введите y первой точки:",
                                border: OutlineInputBorder()),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Введите исходные данные второй точки",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _x2TextBox,
                            onSubmitted: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                                labelText: "Введите x второй точки:",
                                border: OutlineInputBorder()),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _y2TextBox,
                            onSubmitted: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                                labelText: "Введите y второй точки:",
                                border: OutlineInputBorder()),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  var (horLine1, horLine2, horLine3)
                                    = GeoMath.reverseGeo(
                                      double.parse(_x1TextBox.text),
                                      double.parse(_y1TextBox.text),
                                      double.parse(_x2TextBox.text),
                                      double.parse(_y2TextBox.text));

                                  String horLine1String =
                                  GeoMath.formatDouble(horLine1);
                                  String horLine2String =
                                  GeoMath.formatDouble(horLine2);
                                  String horLine3String =
                                  GeoMath.formatDouble(horLine3);
                                  if (horLine1.isNaN) {
                                    horLine1String = "Не удалось посчитать";
                                  }
                                  if (horLine2.isNaN) {
                                    horLine2String = "Не удалось посчитать";
                                  }
                                  if (horLine3.isNaN) {
                                    horLine3String = "Не удалось посчиать";
                                  }

                                  res =
                                  "$horLine1String м, $horLine2String м, $horLine3String м";
                                });
                              },
                              child: const Text(
                                "Перевести",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ))
                        ],
                      )),
                  const Text(
                    "Результаты вычисления тремя способами:",
                    textAlign: TextAlign.center,
                  ),
                  SelectableText(
                    res,
                    style: const TextStyle(fontSize: 25),
                    onTap: () {
                      _x1TextBox.clear();
                      _y1TextBox.clear();
                      _x2TextBox.clear();
                      _y2TextBox.clear();

                      Clipboard.setData(ClipboardData(text: res)).then(
                            (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Текст скопирован!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
