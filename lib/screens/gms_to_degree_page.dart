import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

class GMSPage extends StatefulWidget {
  const GMSPage({super.key});

  @override
  State<GMSPage> createState() => GMSPageState();
}

class GMSPageState extends State<GMSPage> {
  final TextEditingController _degTec = TextEditingController();
  final TextEditingController _minutesTec = TextEditingController();
  final TextEditingController _secTec = TextEditingController();
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(50),
                      child: Column(
                        children: [
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
                            controller: _secTec,
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
                                  double result = GeoMath.toDeg(
                                      double.parse(_degTec.text),
                                      double.parse(_minutesTec.text),
                                      double.parse(_secTec.text));
                                  res = GeoMath.formatDouble(result);
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
                      _degTec.clear();
                      _secTec.clear();
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
          ),
        ));
  }
}
