import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

class DirectPage extends StatefulWidget {
  const DirectPage({super.key});

  @override
  State<DirectPage> createState() => DirectPageState();
}

class DirectPageState extends State<DirectPage> {
  final TextEditingController _x1tec = TextEditingController();
  final TextEditingController _y1tec = TextEditingController();
  final TextEditingController _horLineTec = TextEditingController();

  final TextEditingController _degTec = TextEditingController();
  final TextEditingController _minutesTec = TextEditingController();
  final TextEditingController _secondsTec = TextEditingController();

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
                        "Введите исходные данные",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _x1tec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите x точки A:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _y1tec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите y точки A:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _horLineTec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите горизональное проложение:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Введите дирекционный угол линии AB",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _degTec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите градусы:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _minutesTec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите минуты:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _secondsTec,
                        onSubmitted: (value) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                            labelText: "Введите секунды:",
                            border: OutlineInputBorder()),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              var (resultX, resultY) = GeoMath.directGeo(
                                  double.parse(_x1tec.text),
                                  double.parse(_y1tec.text),
                                  double.parse(_horLineTec.text),
                                  double.parse(_degTec.text),
                                  double.parse(_minutesTec.text),
                                  double.parse(_secondsTec.text));
                              String resultXString =
                                  GeoMath.formatDouble(resultX);
                              String resultYString =
                                  GeoMath.formatDouble(resultY);
                              res = "$resultXString м, $resultYString м";
                            });
                          },
                          child: const Text(
                            "Перевести",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ))
                    ],
                  )),
              SelectableText(
                res,
                style: TextStyle(fontSize: 25),
                onTap: () {
                  _x1tec.clear();
                  _y1tec.clear();
                  _horLineTec.clear();

                  _degTec.clear();
                  _secondsTec.clear();
                  _minutesTec.clear();
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
